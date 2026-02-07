# 市场数据模块 - AI 上下文

**导航**: [根目录](../../../../../CLAUDE.md) > [margin_trading](../../CLAUDE.md) > market-data

## 📍 模块定位

市场数据模块提供杠杆交易相关的静态配置和动态市场信息，是其他模块的数据基础。

## 🔌 接口清单

### 交易对信息
- `Get-All-Cross-Margin-Pairs.md` - 获取所有全仓交易对
- `Get-All-Isolated-Margin-Symbol.md` - 获取所有逐仓交易对
- `Get-Limit-Price-Pairs.md` - 获取限价交易对

### 资产信息
- `Get-All-Margin-Assets.md` - 获取所有杠杆资产
- `Get-Margin-Asset-Risk-Based-Liquidation-Ratio.md` - 获取资产风险清算比率

### 价格与指数
- `Query-Margin-PriceIndex.md` - 查询价格指数
- `Cross-margin-collateral-ratio.md` - 全仓抵押率（⚠️ 空文件）

### 杠杆配置
- `Query-Isolated-Margin-Tier-Data.md` - 查询逐仓杠杆分层数据
- `Query-Liability-Coin-Leverage-Bracket-in-Cross-Margin-Pro-Mode.md` - 查询全仓 Pro 模式杠杆档位

### 库存与可用性
- `Query-margin-avaliable-inventory.md` - 查询可用库存

### 上下架信息
- `Get-List-Schedule.md` - 获取上架计划
- `Get-Delist-Schedule.md` - 获取下架计划

## 🔗 依赖关系

### 上游依赖
- Binance 现货市场数据
- 风控系统配置

### 下游影响
- 为交易模块提供交易对配置
- 为借贷模块提供资产信息
- 为账户模块提供风险参数

## 📊 接口特征

### 数据类型
- **静态数据**: 交易对配置、资产列表（变化较少）
- **准静态数据**: 杠杆档位、风险参数（定期调整）
- **动态数据**: 价格指数、库存（实时变化）

### 权重分布
- 轻量级查询: 1-10 权重
- 中等查询: 20-50 权重
- 无需签名的公开接口

### 缓存策略
- 静态数据: 可缓存 1 小时以上
- 准静态数据: 建议缓存 5-15 分钟
- 动态数据: 建议缓存 1 分钟或实时查询

## 🧪 测试要点

### 功能测试
- 交易对列表完整性
- 价格指数准确性
- 杠杆档位配置正确性

### 数据一致性
- 全仓与逐仓交易对的关系
- 资产列表与交易对的匹配
- 上下架计划的时效性

### 异常场景
- 不存在的交易对查询
- 已下架资产的处理
- 网络超时重试

## 📝 使用示例

### 获取全仓交易对
```bash
GET /sapi/v1/margin/allPairs
```

### 查询价格指数
```bash
GET /sapi/v1/margin/priceIndex?symbol=BTCUSDT
```

### 查询逐仓分层数据
```bash
GET /sapi/v1/margin/isolatedMarginTier?symbol=BTCUSDT
```

## ⚠️ 注意事项

1. **空文件警告**: `Cross-margin-collateral-ratio.md` 为空
2. **数据时效性**: 静态数据建议定期更新缓存
3. **交易对状态**: 注意 `isBorrowable` 和 `isTradable` 标志
4. **杠杆限制**: 不同 VIP 等级有不同的杠杆倍数限制
5. **上下架通知**: 关注上下架计划，及时调整策略

## 📊 数据结构

### 交易对信息
```json
{
  "symbol": "BTCUSDT",
  "base": "BTC",
  "quote": "USDT",
  "isMarginTrade": true,
  "isBuyAllowed": true,
  "isSellAllowed": true
}
```

### 资产信息
```json
{
  "assetFullName": "Bitcoin",
  "assetName": "BTC",
  "isBorrowable": true,
  "isMortgageable": true,
  "userMinBorrow": "0.00000001",
  "userMinRepay": "0.00000001"
}
```

### 杠杆分层
```json
{
  "symbol": "BTCUSDT",
  "tier": 1,
  "effectiveMaxLeverage": "10",
  "initialRiskRatio": "1.10",
  "liquidationRiskRatio": "1.05",
  "baseAssetMaxBorrowable": "100",
  "quoteAssetMaxBorrowable": "1000000"
}
```

## 🔄 数据更新频率

| 数据类型 | 更新频率 | 建议缓存时间 |
|---------|---------|------------|
| 交易对列表 | 每周 | 1 小时 |
| 资产列表 | 每周 | 1 小时 |
| 价格指数 | 实时 | 1 分钟 |
| 杠杆档位 | 不定期 | 15 分钟 |
| 上下架计划 | 每日 | 1 小时 |
| 库存数据 | 实时 | 实时查询 |

## 📈 最佳实践

### 初始化流程
1. 获取所有交易对列表
2. 获取所有资产信息
3. 查询杠杆档位配置
4. 建立本地缓存

### 运行时策略
1. 定期刷新静态数据缓存
2. 实时查询价格指数
3. 监控上下架通知
4. 处理交易对状态变化

### 错误处理
1. 缓存降级策略
2. 数据校验机制
3. 异常交易对过滤
4. 日志记录与告警

---

**文件数量**: 13
**有效文件**: 12
**空文件**: 1
**最后更新**: 2026-02-07
