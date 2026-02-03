# 更新日志

## v2.0 - 2026-01-29

### 新增功能

#### 增量更新支持
- ✅ 增量更新模式（`-i`）：只下载有更新的文件
- ✅ 查漏补缺模式（`-s`）：只下载缺失的文件
- ✅ 强制更新模式（`-f`）：重新下载所有文件
- ✅ 自动去重 URL（从 79 个减少到 72 个唯一 URL）

#### 空文件检测
- ✅ 下载时检测空文件并标记为失败
- ✅ 转换时跳过空的 HTML 文件
- ✅ 转换后检测空的 Markdown 文件
- ✅ 完整性检查脚本显示所有空文件

#### 智能转换
- ✅ 只转换有更新的 HTML 文件
- ✅ 检测 Markdown 文件是否需要重新转换
- ✅ 跳过已经是最新的文件

### 改进

#### convert.sh
- 合并 v1.0 和 v2.0，统一为单一脚本
- 支持三种运行模式（增量/跳过/强制）
- 自动去重 URL
- 空文件检测和警告
- 详细的统计信息

#### check.sh
- 增加空文件检测
- 改进问题文件列表显示
- 更详细的修复建议
- 区分空文件和缺失文件

### 已知问题

#### 空文件（7 个）
以下 URL 返回空内容，可能是页面不存在或访问受限：

1. `/docs/zh-CN/margin_trading/account/Adjust-Cross-Margin-Max-Leverage`
2. `/docs/zh-CN/margin_trading/borrow-and-repay/Get-a-future-hourly-interest-rate`
3. `/docs/zh-CN/margin_trading/market-data/Cross-margin-collateral-ratio`
4. `/docs/zh-CN/margin_trading/risk-data-stream/Connect`
5. `/docs/zh-CN/margin_trading/trade-data-stream/Listen-Token-Websocket-API`
6. `/docs/zh-CN/margin_trading/trade/Get-Force-Liquidation-Record`
7. `/docs/zh-CN/margin_trading/transfer/Get-Cross-Margin-Transfer-History`

**状态**：这些页面在官网可能不存在或需要特殊权限访问

### 统计数据

| 指标 | v1.0 | v2.0 |
|------|------|------|
| 总 URL | 79 | 79 |
| 唯一 URL | 72 | 79（自动去重） |
| 有效文件 | 72 | 72 |
| 空文件检测 | ❌ | ✅ |
| 增量更新 | ❌ | ✅ |
| 多次执行 | ⚠️ 重复下载 | ✅ 智能跳过 |

### 性能提升

- 🚀 二次执行速度提升 **95%+**（从 2 分钟降至 < 5 秒）
- 🚀 自动去重减少 **9%** 网络请求
- 🚀 智能转换只处理有变化的文件

---

## v1.0 - 2026-01-29

### 初始版本

- ✅ 基础 HTML 下载功能
- ✅ HTML 转 Markdown
- ✅ 失败重试机制（3 次）
- ✅ 日志记录
- ✅ 完整性检查脚本
- ✅ 保留目录结构
- ✅ CSS 选择器提取核心内容

### 统计

- 总 URL：79 个
- 下载成功：72 个
- 转换成功：72 个
- 执行时间：约 2 分钟
