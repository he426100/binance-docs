#!/bin/bash

################################################################################
# Binance API 文档转换工具 v2.0
# 功能：将 Binance 杠杆交易 API 文档从 HTML 转换为 Markdown
# 新增：支持增量更新、查漏补缺、多次执行
# 作者：AI Assistant
# 日期：2026-01-29
################################################################################

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 全局变量
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HTML_DIR="${SCRIPT_DIR}/html"
MARKDOWN_DIR="${SCRIPT_DIR}/markdown"
LOGS_DIR="${SCRIPT_DIR}/logs"
LINKS_FILE=""  # 将通过命令行参数设置
HTML2MD_BIN="${HOME}/go/bin/html2markdown"

# 日志文件
DOWNLOAD_LOG="${LOGS_DIR}/download.log"
CONVERT_LOG="${LOGS_DIR}/convert.log"
ERROR_LOG="${LOGS_DIR}/error.log"

# 统计变量
TOTAL_URLS=0
DOWNLOAD_SUCCESS=0
DOWNLOAD_FAILED=0
DOWNLOAD_SKIPPED=0
DOWNLOAD_UPDATED=0
CONVERT_SUCCESS=0
CONVERT_FAILED=0
CONVERT_SKIPPED=0

# 运行模式
MODE="incremental"  # incremental, skip-existing, force

################################################################################
# 函数：打印带颜色的消息
################################################################################
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "\n${GREEN}=== $1 ===${NC}\n"
}

################################################################################
# 函数：显示帮助信息
################################################################################
show_help() {
    cat << EOF
用法: $0 [选项]

选项:
  -i, --incremental     增量更新模式（默认）- 只下载有更新的文件
  -s, --skip-existing   跳过已存在的文件 - 只下载缺失的文件
  -f, --force           强制模式 - 重新下载所有文件
  -l, --links-file FILE 指定 links.json 文件路径（默认: ./links.json）
  -h, --help            显示此帮助信息

模式说明:
  增量更新模式 (-i):
    - 使用 wget -N 时间戳比较
    - 只下载远程文件比本地新的文件
    - 适合定期更新文档

  跳过已存在模式 (-s):
    - 跳过所有已存在的文件
    - 只下载缺失的文件
    - 适合查漏补缺

  强制模式 (-f):
    - 重新下载所有文件
    - 覆盖已存在的文件
    - 适合完全重新获取

示例:
  $0                    # 增量更新（默认）
  $0 -i                 # 增量更新
  $0 -s                 # 只下载缺失的文件
  $0 -f                 # 强制重新下载所有文件
  $0 -l custom.json     # 使用自定义 links 文件

EOF
}

################################################################################
# 函数：初始化环境
################################################################################
init_environment() {
    print_step "[1/6] 初始化环境"

    # 检查 jq
    if ! command -v jq &> /dev/null; then
        print_error "jq 未安装，请先安装: sudo apt-get install jq"
        exit 1
    fi
    print_success "jq 已安装"

    # 检查 wget
    if ! command -v wget &> /dev/null; then
        print_error "wget 未安装，请先安装: sudo apt-get install wget"
        exit 1
    fi
    print_success "wget 已安装"

    # 检查 html2markdown
    if [ ! -f "${HTML2MD_BIN}" ]; then
        print_error "html2markdown 未找到: ${HTML2MD_BIN}"
        exit 1
    fi
    print_success "html2markdown 已找到"

    # 检查 links.json
    if [ ! -f "${LINKS_FILE}" ]; then
        print_error "links.json 未找到: ${LINKS_FILE}"
        exit 1
    fi
    print_success "links.json 已找到"

    # 创建目录
    mkdir -p "${HTML_DIR}" "${MARKDOWN_DIR}" "${LOGS_DIR}"
    print_success "目录结构已创建"

    # 初始化日志文件
    echo "=== 下载日志 - $(date) ===" >> "${DOWNLOAD_LOG}"
    echo "=== 转换日志 - $(date) ===" >> "${CONVERT_LOG}"
    echo "=== 错误日志 - $(date) ===" >> "${ERROR_LOG}"
    print_success "日志文件已初始化"

    # 显示运行模式
    case "${MODE}" in
        incremental)
            print_info "运行模式: ${CYAN}增量更新${NC} - 只下载有更新的文件"
            ;;
        skip-existing)
            print_info "运行模式: ${CYAN}跳过已存在${NC} - 只下载缺失的文件"
            ;;
        force)
            print_info "运行模式: ${CYAN}强制更新${NC} - 重新下载所有文件"
            ;;
    esac
}

################################################################################
# 函数：解析 URL 列表
################################################################################
parse_urls() {
    print_step "[2/6] 解析 links.json"

    # 读取并去重 URL
    mapfile -t URLS < <(jq -r '.[]' "${LINKS_FILE}" | sort -u)
    TOTAL_URLS=${#URLS[@]}

    if [ ${TOTAL_URLS} -eq 0 ]; then
        print_error "links.json 中没有找到 URL"
        exit 1
    fi

    local original_count=$(jq -r '.[]' "${LINKS_FILE}" | wc -l)
    local duplicate_count=$((original_count - TOTAL_URLS))

    print_success "找到 ${TOTAL_URLS} 个唯一 URL"
    if [ ${duplicate_count} -gt 0 ]; then
        print_info "已自动去重 ${duplicate_count} 个重复 URL"
    fi
}

################################################################################
# 函数：从 URL 提取路径和文件名
################################################################################
get_local_path() {
    local url="$1"
    local path="${url#https://developers.binance.com/}"
    echo "${path}"
}

################################################################################
# 函数：下载单个 HTML 文件
################################################################################
download_html() {
    local url="$1"
    local index="$2"
    local total="$3"
    local retry_count=3

    # 获取本地路径
    local rel_path=$(get_local_path "${url}")
    local filename=$(basename "${rel_path}")
    local dir_path=$(dirname "${rel_path}")

    # 创建目录
    local local_dir="${HTML_DIR}/${dir_path}"
    mkdir -p "${local_dir}"

    # 本地文件路径
    local local_file="${local_dir}/${filename}.html"

    # 显示进度
    printf "\r  进度: [%-40s] %d/%d (%d%%)" \
        "$(printf '#%.0s' $(seq 1 $((index * 40 / total))))" \
        "${index}" "${total}" "$((index * 100 / total))"

    # 检查是否跳过已存在的文件
    if [ "${MODE}" = "skip-existing" ] && [ -f "${local_file}" ]; then
        # 检查文件是否为空
        if [ ! -s "${local_file}" ]; then
            # 空文件，需要重新下载
            echo "[$(date)] EMPTY FILE, re-downloading: ${url}" >> "${DOWNLOAD_LOG}"
        else
            ((DOWNLOAD_SKIPPED++))
            echo "[$(date)] SKIPPED (exists): ${url}" >> "${DOWNLOAD_LOG}"
            return 0
        fi
    fi

    # 构建 wget 参数
    local wget_args=(
        --quiet
        --retry-connrefused
        --waitretry=2
        --timeout=30
        --tries=1
    )

    # 根据模式选择下载方式
    case "${MODE}" in
        incremental)
            # 增量更新模式：使用时间戳比较
            wget_args+=(
                --timestamping              # 只下载比本地新的文件
                --no-use-server-timestamps  # 不使用服务器时间戳
                --directory-prefix="${local_dir}"
            )
            ;;
        force|skip-existing)
            # 强制模式或跳过模式：直接下载
            wget_args+=(
                --output-document="${local_file}"
            )
            ;;
    esac

    # 尝试下载
    local success=false
    local updated=false
    set -x
    for attempt in $(seq 1 ${retry_count}); do
        if [ "${MODE}" = "incremental" ]; then
            # 增量模式：检查文件是否更新
            local old_size=0
            if [ -f "${local_file}" ]; then
                old_size=$(stat -c%s "${local_file}" 2>/dev/null || echo 0)
            fi

            if wget "${wget_args[@]}" "${url}" 2>> "${DOWNLOAD_LOG}"; then
                success=true

                # 重命名下载的文件（wget -N 会使用 URL 最后一段作为文件名）
                local downloaded_file="${local_dir}/${filename}"
                if [ -f "${downloaded_file}" ] && [ "${downloaded_file}" != "${local_file}" ]; then
                    mv "${downloaded_file}" "${local_file}"
                fi

                # 检查文件是否有更新
                local new_size=$(stat -c%s "${local_file}" 2>/dev/null || echo 0)
                if [ ${old_size} -ne ${new_size} ] || [ ${old_size} -eq 0 ]; then
                    updated=true
                    ((DOWNLOAD_UPDATED++))
                    echo "[$(date)] UPDATED: ${url} (${old_size} -> ${new_size} bytes)" >> "${DOWNLOAD_LOG}"
                else
                    ((DOWNLOAD_SKIPPED++))
                    echo "[$(date)] UNCHANGED: ${url}" >> "${DOWNLOAD_LOG}"
                fi
                break
            fi
        else
            # 强制模式或跳过模式：直接下载
            if wget "${wget_args[@]}" "${url}" 2>> "${DOWNLOAD_LOG}"; then
                success=true
                updated=true
                echo "[$(date)] SUCCESS: ${url} -> ${local_file}" >> "${DOWNLOAD_LOG}"
                break
            fi
        fi

        # 重试逻辑
        if [ ${attempt} -lt ${retry_count} ]; then
            echo "[$(date)] RETRY ${attempt}/${retry_count}: ${url}" >> "${DOWNLOAD_LOG}"
            sleep 2
        fi
    done

    if [ "${success}" = true ]; then
        if [ "${updated}" = true ]; then
            # 检查下载的文件是否为空
            if [ ! -s "${local_file}" ]; then
                print_warning "下载的文件为空: ${filename}"
                echo "[$(date)] WARNING: Empty file downloaded: ${url}" >> "${ERROR_LOG}"
                ((DOWNLOAD_FAILED++))
            else
                ((DOWNLOAD_SUCCESS++))
            fi
        fi
    else
        ((DOWNLOAD_FAILED++))
        echo "[$(date)] FAILED after ${retry_count} attempts: ${url}" >> "${ERROR_LOG}"
        echo "  Error: 下载失败" >> "${ERROR_LOG}"
    fi
}

################################################################################
# 函数：下载所有 HTML 文件
################################################################################
download_all_html() {
    print_step "[3/6] 下载 HTML 文件"

    local index=0
    for url in "${URLS[@]}"; do
        ((index++))
        download_html "${url}" "${index}" "${TOTAL_URLS}"
    done

    echo ""  # 换行

    case "${MODE}" in
        incremental)
            print_success "下载完成: 更新 ${DOWNLOAD_UPDATED}, 未变化 ${DOWNLOAD_SKIPPED}, 失败 ${DOWNLOAD_FAILED}"
            ;;
        skip-existing)
            print_success "下载完成: 新增 ${DOWNLOAD_SUCCESS}, 跳过 ${DOWNLOAD_SKIPPED}, 失败 ${DOWNLOAD_FAILED}"
            ;;
        force)
            print_success "下载完成: 成功 ${DOWNLOAD_SUCCESS}, 失败 ${DOWNLOAD_FAILED}"
            ;;
    esac
}

################################################################################
# 函数：转换单个 HTML 文件为 Markdown
################################################################################
convert_to_markdown() {
    local html_file="$1"
    local index="$2"
    local total="$3"

    # 计算相对路径
    local rel_path="${html_file#${HTML_DIR}/}"
    local md_file="${MARKDOWN_DIR}/${rel_path%.html}.md"
    local md_dir=$(dirname "${md_file}")

    # 创建目录
    mkdir -p "${md_dir}"

    # 显示进度
    printf "\r  进度: [%-40s] %d/%d (%d%%)" \
        "$(printf '#%.0s' $(seq 1 $((index * 40 / total))))" \
        "${index}" "${total}" "$((index * 100 / total))"

    # 检查是否需要转换
    local need_convert=false

    # 检查 HTML 文件是否为空
    if [ ! -s "${html_file}" ]; then
        print_warning "HTML 文件为空，跳过转换: $(basename "${html_file}")"
        echo "[$(date)] SKIPPED (empty HTML): ${html_file}" >> "${CONVERT_LOG}"
        ((CONVERT_SKIPPED++))
        return 0
    fi

    if [ ! -f "${md_file}" ]; then
        # Markdown 文件不存在，需要转换
        need_convert=true
    elif [ ! -s "${md_file}" ]; then
        # Markdown 文件为空，需要重新转换
        need_convert=true
    elif [ "${html_file}" -nt "${md_file}" ]; then
        # HTML 文件比 Markdown 文件新，需要重新转换
        need_convert=true
    elif [ "${MODE}" = "force" ]; then
        # 强制模式，需要转换
        need_convert=true
    fi

    if [ "${need_convert}" = false ]; then
        ((CONVERT_SKIPPED++))
        echo "[$(date)] SKIPPED (up-to-date): ${html_file}" >> "${CONVERT_LOG}"
        return 0
    fi

    # 转换
    if "${HTML2MD_BIN}" \
        --input "${html_file}" \
        --output "${md_file}" \
        --output-overwrite \
        --domain="https://developers.binance.com" \
        --include-selector=".theme-doc-markdown.markdown" \
        --plugin-table \
        --plugin-strikethrough \
        2>> "${CONVERT_LOG}"; then

        # 检查转换后的文件是否为空
        if [ ! -s "${md_file}" ]; then
            print_warning "转换后的 Markdown 文件为空: $(basename "${md_file}")"
            echo "[$(date)] WARNING: Empty Markdown file: ${md_file}" >> "${ERROR_LOG}"
            ((CONVERT_FAILED++))
        else
            echo "[$(date)] SUCCESS: ${html_file} -> ${md_file}" >> "${CONVERT_LOG}"
            ((CONVERT_SUCCESS++))
        fi
    else
        echo "[$(date)] FAILED: ${html_file}" >> "${ERROR_LOG}"
        echo "  Error: 转换失败" >> "${ERROR_LOG}"
        ((CONVERT_FAILED++))
    fi
}

################################################################################
# 函数：转换所有 HTML 文件
################################################################################
convert_all_html() {
    print_step "[4/6] 转换为 Markdown"

    # 查找所有 HTML 文件
    mapfile -t HTML_FILES < <(find "${HTML_DIR}" -type f -name "*.html")
    local total_files=${#HTML_FILES[@]}

    if [ ${total_files} -eq 0 ]; then
        print_warning "没有找到 HTML 文件"
        return
    fi

    local index=0
    for html_file in "${HTML_FILES[@]}"; do
        ((index++))
        convert_to_markdown "${html_file}" "${index}" "${total_files}"
    done

    echo ""  # 换行

    if [ ${CONVERT_SKIPPED} -gt 0 ]; then
        print_success "转换完成: 更新 ${CONVERT_SUCCESS}, 跳过 ${CONVERT_SKIPPED}, 失败 ${CONVERT_FAILED}"
    else
        print_success "转换完成: 成功 ${CONVERT_SUCCESS}, 失败 ${CONVERT_FAILED}"
    fi
}

################################################################################
# 函数：生成错误报告
################################################################################
generate_error_report() {
    print_step "[5/6] 生成错误报告"

    local total_errors=$((DOWNLOAD_FAILED + CONVERT_FAILED))

    if [ ${total_errors} -eq 0 ]; then
        print_success "没有错误！"
        echo "" >> "${ERROR_LOG}"
        echo "=== 总结 ===" >> "${ERROR_LOG}"
        echo "所有操作均成功完成，无错误。" >> "${ERROR_LOG}"
    else
        print_warning "发现 ${total_errors} 个错误"
        echo "" >> "${ERROR_LOG}"
        echo "=== 错误总结 ===" >> "${ERROR_LOG}"
        echo "下载失败: ${DOWNLOAD_FAILED}" >> "${ERROR_LOG}"
        echo "转换失败: ${CONVERT_FAILED}" >> "${ERROR_LOG}"
        echo "总错误数: ${total_errors}" >> "${ERROR_LOG}"
        echo "" >> "${ERROR_LOG}"
        echo "详细错误信息请查看上方日志。" >> "${ERROR_LOG}"

        print_info "详细错误日志: ${ERROR_LOG}"
    fi
}

################################################################################
# 函数：显示最终总结
################################################################################
show_summary() {
    print_step "[6/6] 完成"

    echo "================================"
    echo "         执行总结"
    echo "================================"
    echo "运行模式:      ${MODE}"
    echo "总 URL 数:      ${TOTAL_URLS}"
    echo ""

    case "${MODE}" in
        incremental)
            echo "下载统计:"
            echo "  更新:          ${DOWNLOAD_UPDATED}"
            echo "  未变化:        ${DOWNLOAD_SKIPPED}"
            echo "  失败:          ${DOWNLOAD_FAILED}"
            ;;
        skip-existing)
            echo "下载统计:"
            echo "  新增:          ${DOWNLOAD_SUCCESS}"
            echo "  跳过:          ${DOWNLOAD_SKIPPED}"
            echo "  失败:          ${DOWNLOAD_FAILED}"
            ;;
        force)
            echo "下载统计:"
            echo "  成功:          ${DOWNLOAD_SUCCESS}"
            echo "  失败:          ${DOWNLOAD_FAILED}"
            ;;
    esac

    echo ""
    echo "转换统计:"
    echo "  成功:          ${CONVERT_SUCCESS}"
    if [ ${CONVERT_SKIPPED} -gt 0 ]; then
        echo "  跳过:          ${CONVERT_SKIPPED}"
    fi
    echo "  失败:          ${CONVERT_FAILED}"
    echo "================================"
    echo ""
    echo "输出目录:"
    echo "  HTML:        ${HTML_DIR}"
    echo "  Markdown:    ${MARKDOWN_DIR}"
    echo "  日志:        ${LOGS_DIR}"
    echo ""

    if [ $((DOWNLOAD_FAILED + CONVERT_FAILED)) -eq 0 ]; then
        print_success "所有文档处理成功！"
    else
        print_warning "部分文档处理失败，请查看错误日志"
    fi
}

################################################################################
# 主函数
################################################################################
main() {
    # 解析命令行参数
    while [[ $# -gt 0 ]]; do
        case $1 in
            -i|--incremental)
                MODE="incremental"
                shift
                ;;
            -s|--skip-existing)
                MODE="skip-existing"
                shift
                ;;
            -f|--force)
                MODE="force"
                shift
                ;;
            -l|--links-file)
                LINKS_FILE="$2"
                shift 2
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                echo "未知选项: $1"
                show_help
                exit 1
                ;;
        esac
    done

    # 设置默认值
    if [ -z "${LINKS_FILE}" ]; then
        LINKS_FILE="${SCRIPT_DIR}/links.json"
    fi

    local start_time=$(date +%s)

    echo ""
    echo "╔════════════════════════════════════════════╗"
    echo "║   Binance API 文档转换工具 v2.0           ║"
    echo "╚════════════════════════════════════════════╝"
    echo ""

    # 执行各个步骤
    init_environment
    parse_urls
    download_all_html
    convert_all_html
    generate_error_report
    show_summary

    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    local minutes=$((duration / 60))
    local seconds=$((duration % 60))

    echo ""
    print_success "总耗时: ${minutes} 分 ${seconds} 秒"
    echo ""
}

# 执行主函数
main "$@"
