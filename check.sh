#!/bin/bash

################################################################################
# Binance API 文档完整性检查工具
# 功能：检查 links.json 中的所有 URL 是否已下载并转换为 Markdown
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
LINKS_FILE=""  # 将通过命令行参数设置

# 统计变量
TOTAL_URLS=0
UNIQUE_URLS=0
HTML_EXISTS=0
HTML_MISSING=0
HTML_EMPTY=0
MD_EXISTS=0
MD_MISSING=0
MD_EMPTY=0

# 缺失文件列表
declare -a MISSING_HTML_URLS
declare -a MISSING_MD_URLS
declare -a EMPTY_HTML_FILES
declare -a EMPTY_MD_FILES

################################################################################
# 函数：打印带颜色的消息
################################################################################
print_header() {
    echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║   Binance API 文档完整性检查工具          ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
    echo ""
}

print_section() {
    echo -e "\n${BLUE}=== $1 ===${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${CYAN}ℹ${NC} $1"
}

################################################################################
# 函数：从 URL 提取本地路径
################################################################################
get_local_path() {
    local url="$1"
    local path="${url#https://developers.binance.com/}"
    echo "${path}"
}

################################################################################
# 函数：检查依赖
################################################################################
check_dependencies() {
    print_section "检查依赖"

    if ! command -v jq &> /dev/null; then
        print_error "jq 未安装"
        exit 1
    fi
    print_success "jq 已安装"

    if [ ! -f "${LINKS_FILE}" ]; then
        print_error "links.json 未找到: ${LINKS_FILE}"
        exit 1
    fi
    print_success "links.json 已找到"
}

################################################################################
# 函数：解析 URL 列表
################################################################################
parse_urls() {
    print_section "解析 URL 列表"

    # 读取所有 URL（包括重复）
    mapfile -t ALL_URLS < <(jq -r '.[]' "${LINKS_FILE}")
    TOTAL_URLS=${#ALL_URLS[@]}

    # 读取唯一 URL
    mapfile -t UNIQUE_URL_LIST < <(jq -r '.[]' "${LINKS_FILE}" | sort -u)
    UNIQUE_URLS=${#UNIQUE_URL_LIST[@]}

    local duplicate_count=$((TOTAL_URLS - UNIQUE_URLS))

    print_info "总 URL 数: ${TOTAL_URLS}"
    print_info "唯一 URL 数: ${UNIQUE_URLS}"

    if [ ${duplicate_count} -gt 0 ]; then
        print_warning "发现 ${duplicate_count} 个重复 URL"
    fi
}

################################################################################
# 函数：检查单个 URL 的文件状态
################################################################################
check_url() {
    local url="$1"
    local index="$2"

    # 获取本地路径
    local rel_path=$(get_local_path "${url}")
    local filename=$(basename "${rel_path}")
    local dir_path=$(dirname "${rel_path}")

    # 构建文件路径
    local html_file="${HTML_DIR}/${dir_path}/${filename}.html"
    local md_file="${MARKDOWN_DIR}/${dir_path}/${filename}.md"

    # 检查 HTML 文件
    local html_status="✗"
    local html_color="${RED}"
    local html_info=""
    if [ -f "${html_file}" ]; then
        # 检查文件是否为空
        if [ ! -s "${html_file}" ]; then
            ((HTML_EMPTY++))
            EMPTY_HTML_FILES+=("${html_file}|${url}")
            html_status="⚠"
            html_color="${YELLOW}"
            html_info=" (空文件)"
        else
            ((HTML_EXISTS++))
            html_status="✓"
            html_color="${GREEN}"
        fi
    else
        ((HTML_MISSING++))
        MISSING_HTML_URLS+=("${url}")
    fi

    # 检查 Markdown 文件
    local md_status="✗"
    local md_color="${RED}"
    local md_info=""
    if [ -f "${md_file}" ]; then
        # 检查文件是否为空
        if [ ! -s "${md_file}" ]; then
            ((MD_EMPTY++))
            EMPTY_MD_FILES+=("${md_file}|${url}")
            md_status="⚠"
            md_color="${YELLOW}"
            md_info=" (空文件)"
        else
            ((MD_EXISTS++))
            md_status="✓"
            md_color="${GREEN}"
        fi
    else
        ((MD_MISSING++))
        MISSING_MD_URLS+=("${url}")
    fi

    # 显示详细信息（可选，默认关闭）
    if [ "${VERBOSE}" = "true" ]; then
        printf "[%3d/%3d] ${html_color}%s${NC} HTML%s | ${md_color}%s${NC} MD%s | %s\n" \
            "${index}" "${UNIQUE_URLS}" "${html_status}" "${html_info}" "${md_status}" "${md_info}" "${filename}"
    fi
}

################################################################################
# 函数：检查所有 URL
################################################################################
check_all_urls() {
    print_section "检查文件状态"

    local index=0
    for url in "${UNIQUE_URL_LIST[@]}"; do
        ((index++))
        check_url "${url}" "${index}"

        # 显示进度（非详细模式）
        if [ "${VERBOSE}" != "true" ]; then
            printf "\r  检查进度: [%-40s] %d/%d (%d%%)" \
                "$(printf '#%.0s' $(seq 1 $((index * 40 / UNIQUE_URLS))))" \
                "${index}" "${UNIQUE_URLS}" "$((index * 100 / UNIQUE_URLS))"
        fi
    done

    if [ "${VERBOSE}" != "true" ]; then
        echo ""  # 换行
    fi
}

################################################################################
# 函数：显示统计信息
################################################################################
show_statistics() {
    print_section "统计信息"

    echo "URL 统计:"
    echo "  总 URL 数:        ${TOTAL_URLS}"
    echo "  唯一 URL 数:      ${UNIQUE_URLS}"
    echo "  重复 URL 数:      $((TOTAL_URLS - UNIQUE_URLS))"
    echo ""

    echo "HTML 文件:"
    printf "  已下载:          ${GREEN}%d${NC} / %d (%.1f%%)\n" \
        "${HTML_EXISTS}" "${UNIQUE_URLS}" \
        "$(awk "BEGIN {printf \"%.1f\", ${HTML_EXISTS}*100/${UNIQUE_URLS}}")"

    if [ ${HTML_EMPTY} -gt 0 ]; then
        printf "  ${YELLOW}空文件:${NC}          %d\n" "${HTML_EMPTY}"
    fi

    if [ ${HTML_MISSING} -gt 0 ]; then
        printf "  ${RED}缺失:${NC}            %d\n" "${HTML_MISSING}"
    fi
    echo ""

    echo "Markdown 文件:"
    printf "  已转换:          ${GREEN}%d${NC} / %d (%.1f%%)\n" \
        "${MD_EXISTS}" "${UNIQUE_URLS}" \
        "$(awk "BEGIN {printf \"%.1f\", ${MD_EXISTS}*100/${UNIQUE_URLS}}")"

    if [ ${MD_EMPTY} -gt 0 ]; then
        printf "  ${YELLOW}空文件:${NC}          %d\n" "${MD_EMPTY}"
    fi

    if [ ${MD_MISSING} -gt 0 ]; then
        printf "  ${RED}缺失:${NC}            %d\n" "${MD_MISSING}"
    fi
}

################################################################################
# 函数：显示缺失文件列表
################################################################################
show_missing_files() {
    local has_issues=false

    if [ ${HTML_MISSING} -gt 0 ] || [ ${MD_MISSING} -gt 0 ] || [ ${HTML_EMPTY} -gt 0 ] || [ ${MD_EMPTY} -gt 0 ]; then
        has_issues=true
    fi

    if [ "${has_issues}" = false ]; then
        print_section "完整性检查"
        print_success "所有文件都已下载并转换！"
        return
    fi

    print_section "问题文件列表"

    if [ ${HTML_EMPTY} -gt 0 ]; then
        echo -e "${YELLOW}空的 HTML 文件 (${HTML_EMPTY} 个):${NC}"
        for entry in "${EMPTY_HTML_FILES[@]}"; do
            local file="${entry%%|*}"
            local url="${entry##*|}"
            local filename=$(basename "${file}")
            echo "  - ${filename}"
            echo "    文件: ${file}"
            echo "    URL: ${url}"
        done
        echo ""
    fi

    if [ ${HTML_MISSING} -gt 0 ]; then
        echo -e "${RED}缺失的 HTML 文件 (${HTML_MISSING} 个):${NC}"
        for url in "${MISSING_HTML_URLS[@]}"; do
            local rel_path=$(get_local_path "${url}")
            local filename=$(basename "${rel_path}")
            echo "  - ${filename}"
            echo "    URL: ${url}"
        done
        echo ""
    fi

    if [ ${MD_EMPTY} -gt 0 ]; then
        echo -e "${YELLOW}空的 Markdown 文件 (${MD_EMPTY} 个):${NC}"
        for entry in "${EMPTY_MD_FILES[@]}"; do
            local file="${entry%%|*}"
            local url="${entry##*|}"
            local filename=$(basename "${file}")
            echo "  - ${filename}"
            echo "    文件: ${file}"
            echo "    URL: ${url}"
        done
        echo ""
    fi

    if [ ${MD_MISSING} -gt 0 ]; then
        echo -e "${RED}缺失的 Markdown 文件 (${MD_MISSING} 个):${NC}"
        for url in "${MISSING_MD_URLS[@]}"; do
            local rel_path=$(get_local_path "${url}")
            local filename=$(basename "${rel_path}")
            echo "  - ${filename}.md"
            echo "    URL: ${url}"
        done
        echo ""
    fi
}

################################################################################
# 函数：生成修复建议
################################################################################
show_fix_suggestions() {
    local has_issues=false

    if [ ${HTML_MISSING} -gt 0 ] || [ ${MD_MISSING} -gt 0 ] || [ ${HTML_EMPTY} -gt 0 ] || [ ${MD_EMPTY} -gt 0 ]; then
        has_issues=true
    fi

    if [ "${has_issues}" = false ]; then
        return
    fi

    print_section "修复建议"

    if [ ${HTML_EMPTY} -gt 0 ]; then
        print_warning "发现空的 HTML 文件"
        print_info "这些文件可能下载失败或页面不存在"
        print_info "运行以下命令重新下载："
        echo "  ./convert.sh -f  # 强制重新下载所有文件"
        echo ""
    fi

    if [ ${MD_EMPTY} -gt 0 ]; then
        print_warning "发现空的 Markdown 文件"
        print_info "这些文件可能转换失败"
        print_info "运行以下命令重新转换："
        echo "  ./convert.sh -f  # 强制重新转换"
        echo ""
    fi

    if [ ${HTML_MISSING} -gt 0 ] || [ ${MD_MISSING} -gt 0 ]; then
        print_info "运行以下命令补全缺失文件："
        echo "  ./convert.sh -s  # 只下载缺失的文件"
        echo ""
    fi

    if [ ${HTML_MISSING} -gt 0 ] && [ ${MD_MISSING} -eq 0 ]; then
        print_warning "HTML 文件缺失但 Markdown 文件存在"
        print_info "这可能是因为 HTML 文件被删除了"
    fi

    if [ ${HTML_MISSING} -eq 0 ] && [ ${MD_MISSING} -gt 0 ]; then
        print_warning "HTML 文件存在但 Markdown 文件缺失"
        print_info "可能是转换过程中出现了错误"
        print_info "检查日志文件: logs/convert.log"
    fi
}

################################################################################
# 函数：显示重复 URL 详情
################################################################################
show_duplicate_urls() {
    if [ $((TOTAL_URLS - UNIQUE_URLS)) -eq 0 ]; then
        return
    fi

    print_section "重复 URL 详情"

    # 找出所有重复的 URL
    local duplicates=$(jq -r '.[]' "${LINKS_FILE}" | sort | uniq -d)

    while IFS= read -r url; do
        if [ -n "${url}" ]; then
            local count=$(jq -r '.[]' "${LINKS_FILE}" | grep -c "^${url}$")
            local filename=$(basename "$(get_local_path "${url}")")
            printf "  ${YELLOW}%s${NC} 出现 ${YELLOW}%d${NC} 次\n" "${filename}" "${count}"
        fi
    done <<< "${duplicates}"
}

################################################################################
# 函数：显示帮助信息
################################################################################
show_help() {
    cat << EOF
用法: $0 [选项]

选项:
  -v, --verbose        显示详细检查信息
  -d, --duplicates     显示重复 URL 详情
  -l, --links-file FILE 指定 links.json 文件路径（默认: ./links.json）
  -h, --help           显示此帮助信息

示例:
  $0                   # 基本检查
  $0 -v                # 详细模式
  $0 -v -d             # 详细模式 + 重复 URL 详情
  $0 -l custom.json    # 使用自定义 links 文件

EOF
}

################################################################################
# 主函数
################################################################################
main() {
    # 解析命令行参数
    VERBOSE=false
    SHOW_DUPLICATES=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -d|--duplicates)
                SHOW_DUPLICATES=true
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

    # 执行检查
    print_header
    check_dependencies
    parse_urls
    check_all_urls
    show_statistics

    if [ "${SHOW_DUPLICATES}" = "true" ]; then
        show_duplicate_urls
    fi

    show_missing_files
    show_fix_suggestions

    echo ""

    # 返回状态码
    if [ ${HTML_MISSING} -eq 0 ] && [ ${MD_MISSING} -eq 0 ] && [ ${HTML_EMPTY} -eq 0 ] && [ ${MD_EMPTY} -eq 0 ]; then
        print_success "检查完成：所有文件完整"
        exit 0
    else
        print_error "检查完成：发现问题文件"
        exit 1
    fi
}

# 执行主函数
main "$@"
