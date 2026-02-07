# Wallet Capital 模块 - AI 上下文

> **模块**: 充提币管理
> **路径**: `markdown/docs/zh-CN/wallet/capital/`
> **最后更新**: 2026-02-07

## 📋 模块概述

充提币模块提供充币地址查询、提币操作、历史记录查询等功能，是资金进出的核心通道。

## 🎯 核心功能

### 1. 充币管理
- 充币地址查询（单个/批量）
- 充币历史查询
- 一键到账充币申请

### 2. 提币管理
- 提币操作
- 提币历史查询
- 提币地址查询
- 提币额度查询

### 3. 币种信息
- 所有币种信息查询
- 网络配置查询
- 充提币状态查询

## 📁 文件清单 (9个)

### 充币类
1. `deposite-address.md` - 充币地址查询 ⭐
2. `fetch-deposit-address-list-with-network.md` - 批量查询充币地址
3. `deposite-history.md` - 充币历史查询
4. `one-click-arrival-deposite-apply.md` - 一键到账充币申请

### 提币类
5. `withdraw.md` - 提币操作 ⭐
6. `withdraw-history.md` - 提币历史查询
7. `fetch-withdraw-address.md` - 提币地址查询
8. `fetch-withdraw-quota.md` - 提币额度查询

### 币种信息类
9. `all-coins-info.md` - 所有币种信息 ⭐

## 🔑 关键接口

### 充币地址
```
GET /sapi/v1/capital/deposit/address
权重: 10 (IP)
认证: USER_DATA
参数: coin, network (可选)
```

**响应示例**:
```javascript
{
    "address": "1HPn8Rx2y6nNSfagQBKy27GB99Vbzg89wv",
    "coin": "BTC",
    "tag": "",
    "url": "https://btc.com/1HPn8Rx2y6nNSfagQBKy27GB99Vbzg89wv"
}
```

### 提币操作
```
POST /sapi/v1/capital/withdraw/apply
权重: 900 (UID)
认证: USER_DATA
```

**关键参数**:
- `coin` - 币种
- `network` - 提币网络
- `address` - 提币地址
- `amount` - 提币数量
- `addressTag` - 地址标签（部分币种需要）
- `walletType` - 钱包类型（0=现货，1=资金）

### 所有币种信息
```
GET /sapi/v1/capital/config/getall
权重: 10 (IP)
认证: USER_DATA
```

**响应包含**:
- 币种基本信息
- 充提币开关状态
- 网络列表及配置
- 手续费、最小/最大金额
- 确认数要求

### 充币历史
```
GET /sapi/v1/capital/deposit/hisrec
权重: 1 (IP)
认证: USER_DATA
```

### 提币历史
```
GET /sapi/v1/capital/withdraw/history
权重: 18000 (UID)
认证: USER_DATA
```

## 🔗 与其他模块的关系

### 与资产模块
```
充币流程:
1. capital/deposite-address → 获取充币地址
2. 链上转账到该地址
3. 等待确认
4. 资产自动到账现货钱包
5. asset/user-universal-transfer → 划转到其他账户

提币流程:
1. asset/user-universal-transfer → 划转到现货钱包
2. capital/withdraw → 发起提币
3. 等待审核和链上确认
4. 提币完成
```

### 与账户模块
- 提币需要 API Key 提币权限
- 快速提币开关影响提币速度
- VIP 等级影响提币额度和手续费

### 与杠杆交易模块
- 杠杆交易前需先充币
- 杠杆交易后需划转才能提币

## 📊 数据结构

### 币种信息
```javascript
{
    "coin": "BTC",
    "depositAllEnable": true,
    "withdrawAllEnable": true,
    "name": "Bitcoin",
    "free": "0.00000000",
    "locked": "0.00000000",
    "networkList": [
        {
            "network": "BTC",
            "coin": "BTC",
            "withdrawIntegerMultiple": "0.00000001",
            "isDefault": true,
            "depositEnable": true,
            "withdrawEnable": true,
            "withdrawFee": "0.0005",
            "withdrawMin": "0.001",
            "withdrawMax": "9000",
            "minConfirm": 1,
            "unLockConfirm": 2
        }
    ]
}
```

### 充币记录
```javascript
{
    "id": "769800519366885376",
    "amount": "0.001",
    "coin": "BNB",
    "network": "BNB",
    "status": 1,  // 0:pending, 6:credited, 1:success
    "address": "bnb136ns6lfw4zs5hg4n85vdthaad7hq5m4gtkgf23",
    "txId": "98A3EA560C6B3336D348...",
    "insertTime": 1661493146000,
    "confirmTimes": "1/1"
}
```

### 提币记录
```javascript
{
    "id": "b6ae22b3aa844210a7041aee7589627c",
    "amount": "8.91000000",
    "transactionFee": "0.004",
    "coin": "USDT",
    "status": 6,  // 0-6 不同状态
    "address": "0x94df8b352de7f46f64b01d3666bf6e936e44ce60",
    "txId": "0xb5ef8c13b968a406cc62a93a8bd80f9e9a906ef1b3fcf20a2e48573c17659268",
    "applyTime": "2019-10-12 11:12:02",
    "network": "ETH",
    "info": "The address is not valid. Please confirm with the recipient"
}
```

## ⚠️ 重要注意事项

1. **网络选择**: 必须选择正确的网络，否则资产可能丢失
2. **地址标签**: XRP、XMR 等币种需要填写 addressTag/memo
3. **最小金额**: 提币金额必须大于 withdrawMin
4. **确认数**: 不同网络需要不同确认数才能到账
5. **提币审核**: 首次提币地址可能需要人工审核
6. **手续费**: 提币手续费从提币金额中扣除
7. **权重限制**: 提币历史查询权重很高（18000），谨慎使用

## 🔧 使用建议

### 充币流程
```bash
# 1. 查询币种信息（获取支持的网络）
GET /sapi/v1/capital/config/getall?coin=USDT

# 2. 获取充币地址
GET /sapi/v1/capital/deposit/address?coin=USDT&network=ETH

# 3. 链上转账到该地址

# 4. 查询充币历史（确认到账）
GET /sapi/v1/capital/deposit/hisrec?coin=USDT
```

### 提币流程
```bash
# 1. 查询提币额度
GET /sapi/v1/capital/withdraw/quota?coin=USDT&network=ETH

# 2. 发起提币
POST /sapi/v1/capital/withdraw/apply
{
    "coin": "USDT",
    "network": "ETH",
    "address": "0x...",
    "amount": "100"
}

# 3. 查询提币状态
GET /sapi/v1/capital/withdraw/history?coin=USDT
```

### 网络选择建议
- **USDT**: 推荐 TRC20（手续费低）或 ERC20（兼容性好）
- **BTC**: 使用 BTC 网络
- **ETH**: 使用 ETH 网络
- **BNB**: 可选 BSC 或 BNB Chain

## 📈 性能指标

- **充币地址**: 权重 10，可适度调用
- **提币操作**: 权重 600，控制频率
- **币种信息**: 权重 10，建议缓存
- **充币历史**: 权重 1，可频繁查询
- **提币历史**: 权重 18000，严格限制

## 🔍 常见问题

**Q: 充币多久到账？**
A: 取决于网络确认数，通常 1-30 分钟

**Q: 提币失败怎么办？**
A: 检查地址、网络、金额是否正确，查看 info 字段错误信息

**Q: 如何选择提币网络？**
A: 根据目标地址支持的网络选择，注意手续费差异

**Q: 提币需要多久？**
A: 审核通过后 5-30 分钟，首次地址可能需要人工审核

**Q: 充币地址会变吗？**
A: 一般不变，但建议每次充币前确认

**Q: 内部转账免手续费吗？**
A: 币安用户间转账可免手续费（需设置 transactionFeeFlag）

---

**文档数量**: 9 个
**核心接口**: 5 个
**关联模块**: asset, account, margin_trading
**安全等级**: 高（涉及资金进出）
