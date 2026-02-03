# Binance API 文档转换项目执行计划

## 项目概述

**任务**：将 Binance 杠杆交易 API 文档从网页转换为 Markdown 格式

**输入**：links.json（80 个文档 URL）

**输出**：保留目录结构的 Markdown 文档集合

**技术方案**：Bash 脚本 + wget + html2markdown

## 目录结构

```
binance-margin_trading-api-docs/
├── convert.sh                    # 主转换脚本
├── links.json                    # URL 列表
├── html/                         # 下载的 HTML 文件
├── markdown/                     # 转换后的 Markdown 文件
├── logs/                         # 日志目录
│   ├── download.log
│   ├── convert.log
│   └── error.log
└── README.md                     # 使用说明
```

## 核心功能模块

### 1. 初始化环境
- 检查依赖工具（jq, wget, html2markdown）
- 创建目录结构
- 初始化日志文件

### 2. URL 解析
- 使用 jq 解析 links.json
- 提取 URL 列表

### 3. HTML 下载
- wget 下载，保留目录结构
- 失败重试（最多 3 次）
- 记录下载状态

### 4. Markdown 转换
- 使用 html2markdown 转换
- CSS 选择器：`.theme-doc-markdown.markdown`
- 启用表格和删除线插件

### 5. 错误处理
- 记录所有失败的 URL
- 生成错误报告

## 技术细节

### wget 参数
```bash
--retry-connrefused    # 连接被拒绝时重试
--waitretry=2          # 重试间隔 2 秒
--timeout=30           # 超时 30 秒
--tries=3              # 最多尝试 3 次
```

### html2markdown 参数
```bash
--include-selector=".theme-doc-markdown.markdown"
--domain="https://developers.binance.com"
--plugin-table
--plugin-strikethrough
```

## 执行流程

1. 初始化环境 → 2. 解析 URL → 3. 下载 HTML → 4. 转换 Markdown → 5. 生成报告

## 预期结果

- 80 个 Markdown 文件
- 保留原始目录结构
- 完整的错误日志
- 执行时间：5-8 分钟

## 创建时间

2026-01-29
