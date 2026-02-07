# 账户管理模块 - AI 上下文

**导航**: [根目录](../../../../../CLAUDE.md) > [margin_trading](../../CLAUDE.md) > account

## 📍 模块定位

账户管理模块提供全仓和逐仓杠杆账户的查询、配置和管理功能。

## 🔌 接口清单

### 账户查询
- `Query-Cross-Margin-Account-Details.md` - 查询全仓账户详情
- `Query-Isolated-Margin-Account-Info.md` - 查询逐仓账户信息
- `Get-Summary-Of-Margin-Account.md` - 获取账户摘要

### 账户配置
- `Enable-Isolated-Margin-Account.md` - 启用逐仓账户
- `Disable-Isolated-Margin-Account.md` - 禁用逐仓账户
- `Adjust-Cross-Margin-Max-Leverage.md` - 调整全仓最大杠杆（⚠️ 空文件）

### 费率查询
- `Query-Cross-Margin-Fee-Data.md` - 查询全仓费率数据
- `Query-Isolated-Margin-Fee-Data.md` - 查询逐仓费率数据

### 资金流水
- `Query-Cross-Isolated-Margin-Capital-Flow.md` - 查询全仓/逐仓资金流水

### 账户限制
- `Query-Enabled-Isolated-Margin-Account-Limit.md` - 查询逐仓账户限制

### 其他功能
- `Get-BNB-Burn-Status.md` - 获取 BNB 抵扣状态

## 🔗 依赖关系

### 上游依赖
- 需要有效的 API Key 和签名
- 依赖用户认证系统（USER_DATA 权限）

### 下游影响
- 为交易模块提供账户状态
- 为借贷模块提供可用余额信息
- 为风控模块提供账户风险数据

## 📊 接口特征

### 权重分布
- 轻量级查询: 10-20 权重
- 中等查询: 50-100 权重
- 重量级操作: 3000 权重（如调整杠杆）

### 访问限制
- 大部分接口无特殊限制
- 杠杆调整: 1次/分钟/IP

### 数据类型
- **全仓账户**: 统一保证金池，共享风险
- **逐仓账户**: 独立保证金，风险隔离

## 🧪 测试要点

### 功能测试
- 账户信息查询准确性
- 启用/禁用逐仓账户状态切换
- 费率数据实时性

### 边界测试
- 未启用逐仓账户的查询行为
- 杠杆调整的风险率限制
- 资金流水的分页查询

### 异常场景
- 无效交易对查询
- 权限不足的操作
- 频率限制触发

## 📝 使用示例

### 查询全仓账户
```bash
GET /sapi/v1/margin/account
```

### 启用逐仓账户
```bash
POST /sapi/v1/margin/isolated/account
symbol=BTCUSDT
```

### 查询费率数据
```bash
GET /sapi/v1/margin/crossMarginData
```

## ⚠️ 注意事项

1. **空文件警告**: `Adjust-Cross-Margin-Max-Leverage.md` 为空，可能接口已下线
2. **杠杆调整**: 需满足风险率要求（3x: 1.5, 5x: 1.25）
3. **逐仓限制**: 每个账户最多可启用的逐仓交易对数量有限
4. **费率变化**: 费率数据可能实时变化，建议定期查询

## 🔄 更新频率

- 账户余额: 实时更新（通过 WebSocket 推送）
- 费率数据: 每小时更新
- 账户限制: 不定期调整

---

**文件数量**: 11
**有效文件**: 10
**空文件**: 1
**最后更新**: 2026-02-07
