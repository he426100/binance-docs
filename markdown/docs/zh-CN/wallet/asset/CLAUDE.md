# Wallet Asset 模块 - AI 上下文

**导航**: [根目录](../../../../../CLAUDE.md) > [wallet](../../CLAUDE.md) > asset

> **模块**: 钱包资产管理
> **路径**: `markdown/docs/zh-CN/wallet/asset/`
> **最后更新**: 2026-02-07

## 📋 模块概述

资产管理模块提供用户资产查询、划转、小额资产转换等核心功能，是钱包系统的基础模块。

## 🎯 核心功能

### 1. 资产查询
- 用户资产列表查询
- 钱包余额查询
- 资产详情查询
- 资金钱包余额

### 2. 资产划转
- **万向划转**: 支持现货、杠杆、合约、期权、资金钱包间互转
- 划转历史查询
- 支持 30+ 种划转类型

### 3. 小额资产管理 (Dust)
- 小额资产转换为 BNB
- 可转换资产查询
- 转换历史记录

### 4. 费率与设置
- 交易手续费查询
- BNB 抵扣设置（现货交易、杠杆利息）

### 5. 其他功能
- 资产分红记录
- 云算力支付记录
- 用户委托查询
- 上架币种列表

## 📁 文件清单 (18个)

### 资产查询类
1. `user-assets.md` - 用户资产查询
2. `query-user-wallet-balance.md` - 查询用户钱包余额
3. `asset-detail.md` - 上架资产详情
4. `funding-wallet.md` - 资金钱包余额

### 划转类
5. `user-universal-transfer.md` - 用户万向划转 ⭐
6. `query-user-universal-transfer.md` - 查询用户万向划转历史

### 小额资产类
7. `dust-convert.md` - 小额资产兑换
8. `dust-convertible-assets.md` - 可转换小额资产查询
9. `dust-log.md` - 小额资产兑换历史
10. `dust-transfer.md` - 小额资产划转
11. `assets-can-convert-bnb.md` - 可转换为 BNB 的资产

### 费率与设置类
12. `trade-fee.md` - 交易手续费查询
13. `Toggle-BNB-Burn-On-Spot-Trade-And-Margin-Interest.md` - BNB 抵扣开关

### 其他类
14. `assets-divided-record.md` - 资产分红记录
15. `cloud-mining-payment-and-refund-history.md` - 云算力支付记录
16. `query-user-delegation.md` - 查询用户委托
17. `spot-delist-schedule.md` - 现货下架时间表
18. `open-symbol-list.md` - 开放交易对列表

## 🔑 关键接口

### 万向划转
```
POST /sapi/v1/asset/transfer
权重: 900 (UID)
权限: 需开通"允许万向划转"
```

**支持的划转类型**:
- `MAIN_MARGIN` - 现货 → 杠杆全仓
- `MARGIN_MAIN` - 杠杆全仓 → 现货
- `MAIN_ISOLATED_MARGIN` - 现货 → 杠杆逐仓
- `ISOLATED_MARGIN_MAIN` - 杠杆逐仓 → 现货
- `MAIN_FUNDING` - 现货 → 资金钱包
- `FUNDING_MAIN` - 资金钱包 → 现货
- 以及 30+ 种其他类型

### 小额资产转换
```
POST /sapi/v1/asset/dust-convert/convert
权重: 10 (UID)
```

### 资产查询
```
POST /sapi/v3/asset/getUserAsset
权重: 5 (IP)
```

### 交易手续费
```
GET /sapi/v1/asset/tradeFee
权重: 1 (IP)
```

## 🔗 与其他模块的关系

### 与杠杆交易模块
```
杠杆交易资金流:
1. wallet/capital → 充币到现货
2. wallet/asset (万向划转) → 现货转杠杆账户 ⭐
3. margin_trading/borrow-and-repay → 借币
4. margin_trading/trade → 交易
5. margin_trading/borrow-and-repay → 还币
6. wallet/asset (万向划转) → 杠杆转现货 ⭐
7. wallet/capital → 提币
```

### 与账户模块
- 资产查询需要账户权限验证
- BNB 抵扣设置影响账户费率

### 与充提币模块
- 充币后资产进入现货钱包
- 提币前需从其他钱包划转到现货

## 📊 数据结构

### 万向划转响应
```javascript
{
    "tranId": 13526853623  // 划转交易ID
}
```

### 小额资产转换响应
```javascript
{
    "totalTransfered": "3.5971223",
    "totalServiceCharge": "0.0794964",
    "transferResult": [...]
}
```

### 用户资产响应
```javascript
[
    {
        "asset": "USDT",
        "free": "1000.00000000",
        "locked": "0.00000000",
        "freeze": "0.00000000",
        "withdrawing": "0.00000000"
    }
]
```

## ⚠️ 重要注意事项

1. **万向划转权限**: 必须在 API Key 中开通"允许万向划转"权限
2. **划转类型**: 不同划转类型可能需要额外参数（fromSymbol/toSymbol）
3. **小额资产**: 只能转换为 BNB，不可逆
4. **费率查询**: 返回的是用户实际费率，包含 VIP 等级优惠
5. **BNB 抵扣**: 开启后自动使用 BNB 支付手续费和杠杆利息

## 🔧 使用建议

### 杠杆交易前准备
```bash
# 1. 查询现货余额
POST /sapi/v3/asset/getUserAsset

# 2. 划转到杠杆账户
POST /sapi/v1/asset/transfer
{
    "type": "MAIN_MARGIN",
    "asset": "USDT",
    "amount": "1000"
}
```

### 小额资产清理
```bash
# 1. 查询可转换资产
POST /sapi/v1/asset/dust-btc

# 2. 执行转换
POST /sapi/v1/asset/dust-convert/convert
{
    "asset": ["ADA", "XRP", "DOT"]
}
```

## 📈 性能指标

- **万向划转**: 权重 900，建议控制频率
- **资产查询**: 权重 5，可频繁调用
- **小额转换**: 权重 10，适中
- **费率查询**: 权重 1，可缓存结果

## 🔍 常见问题

**Q: 万向划转失败？**
A: 检查 API Key 是否开通"允许万向划转"权限

**Q: 逐仓划转需要什么参数？**
A: 需要指定 fromSymbol 或 toSymbol（交易对）

**Q: 小额资产转换有限制吗？**
A: 只能转换为 BNB，且有最小金额限制

**Q: 如何查询历史划转记录？**
A: 使用 `GET /sapi/v1/asset/transfer` 查询

---

**文档数量**: 18 个
**核心接口**: 4 个
**关联模块**: margin_trading, capital, account
