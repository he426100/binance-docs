# Binance 杠杆交易 API 文档转换工具

## 📖 项目简介

本项目将 Binance 杠杆交易 API 文档从网页格式转换为 Markdown 格式，方便离线阅读和版本管理。

**核心功能**：
- ✅ **增量更新**：只下载有更新的文件
- ✅ **查漏补缺**：跳过已存在的文件
- ✅ **多次执行**：支持重复运行，自动去重
- ✅ **智能转换**：只转换有变化的 HTML 文件

## 📊 转换结果

- **总 URL 数**: 79 个
- **唯一页面**: 72 个（自动去重）
- **下载成功**: 72 个 HTML 文件
- **转换成功**: 72 个 Markdown 文件
- **执行时间**: 约 2 分钟

> **注意**: links.json 中有 7 个重复的 URL（`general-info` 出现 8 次），脚本会自动去重。

## 📁 目录结构

```
binance-margin_trading-api-docs/
├── convert.sh              # 转换脚本（支持多种模式）
├── check.sh                # 完整性检查脚本
├── links.json              # URL 列表
├── html/                   # 下载的 HTML 文件
│   └── docs/zh-CN/margin_trading/
├── markdown/               # 转换后的 Markdown 文件
│   └── docs/zh-CN/margin_trading/
│       ├── account/        # 账户接口
│       ├── borrow-and-repay/  # 借贷还款接口
│       ├── market-data/    # 行情接口
│       ├── trade/          # 交易接口
│       ├── trade-data-stream/  # 账户信息推送
│       ├── risk-data-stream/   # 风控信息推送
│       └── ...
├── logs/                   # 日志文件
│   ├── download.log        # 下载日志
│   ├── convert.log         # 转换日志
│   └── error.log           # 错误日志
└── README.md               # 本文件
```

## 🚀 使用方法

### 前置要求

- `jq` - JSON 处理工具
- `wget` - 文件下载工具
- `html2markdown` - HTML 转 Markdown 工具（位于 `~/go/bin/html2markdown`）

### 基本使用

```bash
# 1. 赋予执行权限（首次运行）
chmod +x convert.sh

# 2. 增量更新（默认模式）- 只下载有更新的文件
./convert.sh

# 3. 查看结果
ls -lh markdown/docs/zh-CN/margin_trading/
```

### 运行模式

```bash
# 增量更新模式（默认）- 只下载有更新的文件
./convert.sh
# 或
./convert.sh -i

# 查漏补缺模式 - 只下载缺失的文件
./convert.sh -s

# 强制更新模式 - 重新下载所有文件
./convert.sh -f

# 查看帮助
./convert.sh -h
```

**运行模式说明**：

| 模式 | 参数 | 说明 | 适用场景 |
|------|------|------|----------|
| 增量更新 | `-i` 或默认 | 使用时间戳比较，只下载更新的文件 | 定期更新文档 |
| 查漏补缺 | `-s` | 跳过所有已存在的文件 | 断点续传、查漏补缺 |
| 强制更新 | `-f` | 重新下载所有文件 | 完全重新获取 |

**脚本特性**：
- ✅ 自动去重 URL
- ✅ 智能跳过未变化的文件
- ✅ 只转换有更新的 HTML
- ✅ 支持多次执行
- ✅ 详细的统计信息

### 检查完整性

```bash
# 1. 赋予执行权限（首次运行）
chmod +x check.sh

# 2. 基本检查
./check.sh

# 3. 详细模式（显示每个文件的检查状态）
./check.sh -v

# 4. 显示重复 URL 详情
./check.sh -d

# 5. 详细模式 + 重复 URL 详情
./check.sh -v -d

# 6. 查看帮助
./check.sh -h
```

**检查脚本功能**：
- ✅ 验证所有 URL 是否已下载 HTML 文件
- ✅ 验证所有 URL 是否已转换为 Markdown
- ✅ 统计完成率和缺失文件
- ✅ 识别重复 URL
- ✅ 提供修复建议

### 查看日志

```bash
# 下载日志
cat logs/download.log

# 转换日志
cat logs/convert.log

# 错误日志（如果有）
cat logs/error.log
```

## 🔄 典型使用场景

### 场景 1：首次下载

```bash
# 下载所有文档
./convert.sh

# 检查完整性
./check.sh
```

### 场景 2：定期更新文档

```bash
# 每天/每周运行一次，只下载有更新的文件
./convert.sh -i

# 检查是否有缺失
./check.sh
```

### 场景 3：下载中断后继续

```bash
# 只下载缺失的文件
./convert.sh -s

# 检查完整性
./check.sh
```

### 场景 4：完全重新获取

```bash
# 强制重新下载所有文件
./convert.sh -f
```

### 场景 5：查漏补缺

```bash
# 1. 检查哪些文件缺失
./check.sh

# 2. 只下载缺失的文件
./convert.sh -s

# 3. 再次检查
./check.sh
```

## 📝 文档分类

### 核心文档
- `change-log.md` - 更新日志
- `general-info.md` - 基本信息
- `Introduction.md` - 概述
- `common-definition.md` - 通用枚举定义
- `error-code.md` - 错误代码
- `best-practice.md` - 最佳实践

### API 接口文档

#### 行情接口 (market-data/)
- 获取全仓杠杆交易对
- 获取逐仓杠杆交易对
- 获取杠杆资产
- 查询价格指数
- 等...

#### 借贷还款接口 (borrow-and-repay/)
- 杠杆账户借贷还款
- 查询借贷记录
- 查询利率历史
- 查询最大可借
- 等...

#### 交易接口 (trade/)
- 杠杆账户下单
- 取消订单
- 查询订单
- OCO 订单
- 小额负债兑换
- 等...

#### 账户接口 (account/)
- 查询全仓账户详情
- 查询逐仓账户信息
- 启用/禁用逐仓账户
- 查询费率数据
- 等...

#### 数据推送 (trade-data-stream/ & risk-data-stream/)
- 账户更新事件
- 订单更新事件
- 余额更新事件
- 风控信息推送
- 等...

## 🔧 技术细节

### 转换参数

```bash
html2markdown \
  --include-selector=".theme-doc-markdown.markdown" \
  --domain="https://developers.binance.com" \
  --plugin-table \
  --plugin-strikethrough
```

### 重试机制

- 下载失败时自动重试 3 次
- 每次重试间隔 2 秒
- 超时时间 30 秒

### CSS 选择器

使用 `.theme-doc-markdown.markdown` 选择器提取核心文档内容，自动排除：
- 导航栏
- 侧边栏
- 页脚
- 面包屑导航

### 增量更新原理

**增量模式 (`-i`)**：
- 使用 `wget -N` 时间戳比较
- 比较本地文件和远程文件的修改时间
- 只下载远程文件比本地新的文件
- 转换时检查 HTML 文件是否比 Markdown 新

**查漏补缺模式 (`-s`)**：
- 检查本地文件是否存在
- 存在则跳过，不存在则下载
- 适合断点续传和查漏补缺

**强制模式 (`-f`)**：
- 重新下载所有文件
- 覆盖已存在的文件
- 适合完全重新获取

## 📈 转换统计

| 类型 | 数量 |
|------|------|
| 总 URL | 79 |
| 唯一页面 | 72 |
| HTML 文件 | 72 |
| Markdown 文件 | 72 |
| 下载成功率 | 100% |
| 转换成功率 | 100% |

## 🐛 已知问题

1. **重复 URL**
   - 问题：`general-info` 在 links.json 中出现 8 次
   - 解决：脚本自动去重
   - 状态：✅ 已解决

2. **目录页面**
   - 问题：某些目录页面（如 `/account`、`/trade`）可能不存在
   - 影响：下载时会失败，但不影响子页面
   - 状态：正常行为，可忽略

## ❓ 常见问题

**Q: 如何更新到最新版本的文档？**
```bash
./convert.sh -i  # 增量更新模式
```

**Q: 下载中断了怎么办？**
```bash
./convert.sh -s  # 查漏补缺模式
```

**Q: 如何检查是否所有文件都下载完成？**
```bash
./check.sh  # 完整性检查
```

**Q: 如何完全重新下载？**
```bash
./convert.sh -f  # 强制更新模式
```

**Q: 脚本可以多次执行吗？**

可以！默认的增量模式会智能跳过未变化的文件，不会重复下载。

## 📄 许可证

本工具仅用于个人学习和研究目的。文档内容版权归 Binance 所有。

## 🔗 相关链接

- [Binance API 官方文档](https://developers.binance.com/docs/zh-CN/margin_trading)
- [html2markdown 工具](https://github.com/JohannesKaufmann/html-to-markdown)

---

**生成时间**: 2026-01-29
**最后更新**: 2026-01-29
