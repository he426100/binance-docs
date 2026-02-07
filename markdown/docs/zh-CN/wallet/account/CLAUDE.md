# Wallet Account 模块 - AI 上下文

> **模块**: 钱包账户信息
> **路径**: `markdown/docs/zh-CN/wallet/account/`
> **最后更新**: 2026-02-07

## 📋 模块概述

账户信息模块提供用户账户状态、权限、快照等查询功能，是账户管理的核心模块。

## 🎯 核心功能

### 1. 账户信息查询
- 账户基本信息（VIP等级、功能开通状态）
- 账户状态查询
- API 交易状态

### 2. API 权限管理
- API Key 权限查询
- 查看现货、杠杆、合约等权限

### 3. 快速提币
- 开启快速提币开关
- 关闭快速提币开关

### 4. 账户快照
- 每日账户快照
- 现货、杠杆、合约账户快照

## 📁 文件清单 (7个)

1. `account-info.md` - 账户信息查询 ⭐
2. `account-status.md` - 账户状态查询
3. `account-api-trading-status.md` - API 交易状态
4. `api-key-permission.md` - API Key 权限查询 ⭐
5. `enable-fast-withdraw-switch.md` - 开启快速提币
6. `disable-fast-withdraw-switch.md` - 关闭快速提币
7. `daily-account-snapshoot.md` - 每日账户快照

## 🔑 关键接口

### 账户信息
```
GET /sapi/v1/account/info
权重: 1 (IP)
认证: USER_DATA
```

**响应示例**:
```javascript
{
  "vipLevel": 0,
  "isMarginEnabled": true,
  "isFutureEnabled": true,
  "isOptionsEnabled": true,
  "isPortfolioMarginRetailEnabled": true
}
```

### API Key 权限
```
GET /sapi/v1/account/apiRestrictions
权重: 1 (IP)
认证: USER_DATA
```

**响应字段**:
- `enableSpotAndMarginTrading` - 现货和杠杆交易
- `enableFutures` - 合约交易
- `enableVanillaOptions` - 期权交易
- `enableWithdrawals` - 提币权限
- `enableInternalTransfer` - 内部划转
- `enableMargin` - 杠杆交易
- `enableReading` - 读取权限

### 账户状态
```
GET /sapi/v1/account/status
权重: 1 (IP)
认证: USER_DATA
```

### 每日快照
```
GET /sapi/v1/accountSnapshot
权重: 2400 (IP)
认证: USER_DATA
参数: type (SPOT/MARGIN/FUTURES)
```

## 🔗 与其他模块的关系

### 与资产模块
- 账户信息决定可用功能
- VIP 等级影响交易费率
- 杠杆开通状态影响资产划转

### 与充提币模块
- 快速提币开关影响提币速度
- 账户状态影响充提币权限

### 与杠杆交易模块
- `isMarginEnabled` 决定是否可使用杠杆
- API 权限控制杠杆交易能力

## 📊 数据结构

### 账户信息
```javascript
{
  "vipLevel": 0,              // VIP 等级
  "isMarginEnabled": true,    // 杠杆已开通
  "isFutureEnabled": true,    // 合约已开通
  "isOptionsEnabled": true,   // 期权已开通
  "isPortfolioMarginRetailEnabled": true  // 统一账户
}
```

### API 权限
```javascript
{
  "ipRestrict": false,
  "createTime": 1623840271000,
  "enableWithdrawals": false,
  "enableInternalTransfer": true,
  "permitsUniversalTransfer": true,
  "enableVanillaOptions": false,
  "enableReading": true,
  "enableFutures": false,
  "enableMargin": true,
  "enableSpotAndMarginTrading": true
}
```

### 账户快照
```javascript
{
  "code": 200,
  "msg": "",
  "snapshotVos": [
    {
      "type": "spot",
      "updateTime": 1576281599000,
      "data": {
        "totalAssetOfBtc": "0.09905021",
        "balances": [...]
      }
    }
  ]
}
```

## ⚠️ 重要注意事项

1. **VIP 等级**: 影响交易手续费率和提币额度
2. **功能开通**: 需要在网页端先开通杠杆、合约等功能
3. **API 权限**: 不同操作需要不同权限，创建 API Key 时设置
4. **快速提币**: 开启后提币更快，但安全性略降
5. **账户快照**: 权重很高（2400），不建议频繁调用

## 🔧 使用建议

### 交易前检查
```bash
# 1. 查询账户信息
GET /sapi/v1/account/info

# 2. 检查 API 权限
GET /sapi/v1/account/apiRestrictions

# 3. 确认杠杆已开通
if (isMarginEnabled == true && enableMargin == true) {
    // 可以进行杠杆交易
}
```

### 权限验证流程
```
1. 查询 API Key 权限
2. 检查所需权限是否开通
3. 如未开通，提示用户重新创建 API Key
```

## 📈 性能指标

- **账户信息**: 权重 1，可频繁调用
- **API 权限**: 权重 1，建议缓存
- **账户状态**: 权重 1，轻量级
- **账户快照**: 权重 2400，谨慎使用

## 🔍 常见问题

**Q: 如何开通杠杆交易？**
A: 需要在币安网页端先开通杠杆账户，API 无法直接开通

**Q: API Key 权限不足怎么办？**
A: 需要重新创建 API Key 并勾选所需权限

**Q: 快速提币有什么风险？**
A: 跳过部分安全检查，建议大额提币时关闭

**Q: 账户快照多久更新一次？**
A: 每日更新，可查询历史 30 天数据

**Q: VIP 等级如何提升？**
A: 根据交易量和 BNB 持仓自动计算，无法通过 API 修改

---

**文档数量**: 7 个
**核心接口**: 4 个
**关联模块**: asset, capital, margin_trading
