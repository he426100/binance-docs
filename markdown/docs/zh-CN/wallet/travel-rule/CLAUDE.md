# Wallet Travel-Rule 模块 - AI 上下文

> **模块**: 旅行规则合规
> **路径**: `markdown/docs/zh-CN/wallet/travel-rule/`
> **最后更新**: 2026-02-07

## 📋 模块概述

旅行规则（Travel Rule）模块专门用于满足特定地区的反洗钱（AML）合规要求，针对本地站点的充提币操作需要额外的问卷调查和信息验证。

## 🎯 核心功能

### 1. 合规提币
- 针对本地站的提币申请
- 提币问卷调查
- 问卷要求查询

### 2. 合规充币
- 充币信息提供
- 充币问卷调查
- 充币历史查询（V2）

### 3. VASP 管理
- 已接入 VASP 列表
- 地址验证列表

### 4. Broker 接口
- Broker 提币
- Broker 充币信息提供

## 📁 文件清单 (15个)

### 提币相关
1. `withdraw.md` - 旅行规则提币 ⭐
2. `withdraw-questionnaire.md` - 提币问卷内容
3. `questionnaire-requirements.md` - 问卷要求查询 ⭐
4. `withdraw-history.md` - 提币历史
5. `withdraw-history-v2.md` - 提币历史 V2
6. `broker-withdraw.md` - Broker 提币

### 充币相关
7. `deposit-provide-info.md` - 充币信息提供
8. `deposit-provide-info-v2.md` - 充币信息提供 V2
9. `deposit-questionnaire.md` - 充币问卷内容
10. `deposit-history.md` - 充币历史
11. `deposit-history-v2.md` - 充币历史 V2
12. `broker-deposit-provide-info.md` - Broker 充币信息

### VASP 管理
13. `onboarded-vasp-list.md` - 已接入 VASP 列表
14. `address-verification-list.md` - 地址验证列表

### 附录
15. `appendix.md` - 附录说明

## 🔑 关键接口

### 问卷要求查询
```
GET /sapi/v1/localentity/questionnaire-requirements
权重: 1 (IP)
认证: USER_DATA
```

**用途**: 检查是否需要遵守旅行规则
- 返回 NIL: 使用普通提币接口
- 返回非 NIL: 必须使用旅行规则提币接口

### 旅行规则提币
```
POST /sapi/v1/localentity/withdraw/apply
权重: 600 (UID)
认证: USER_DATA
```

**关键参数**:
- `coin`, `network`, `address`, `amount` - 基本提币信息
- `questionnaire` - JSON 格式的问卷回答 ⭐

**响应示例**:
```javascript
{
    "trId": 123456,           // Travel Rule 记录 ID
    "accepted": true,         // 提币请求是否被接受
    "info": "Withdraw request accepted"
}
```

### 充币信息提供
```
POST /sapi/v1/localentity/deposit/provide-info
权重: 1 (IP)
认证: USER_DATA
```

### VASP 列表
```
GET /sapi/v1/localentity/onboarded-vasp-list
权重: 1 (IP)
认证: USER_DATA
```

## 🔗 与其他模块的关系

### 与 Capital 模块
```
提币流程选择:
1. 查询问卷要求 (travel-rule/questionnaire-requirements)
2. 如果需要旅行规则:
   → 使用 travel-rule/withdraw
3. 如果不需要:
   → 使用 capital/withdraw

充币流程:
1. 正常充币 (capital/deposite-address)
2. 如需合规，提供额外信息 (travel-rule/deposit-provide-info)
```

### 与 Asset 模块
- 提币前需要划转到现货钱包
- 充币后可能需要提供额外信息

### 适用地区
- 主要针对有 AML/KYC 严格要求的本地站
- 不同地区问卷内容不同

## 📊 数据结构

### 问卷格式
```javascript
{
    "questionnaire": {
        "purpose": "investment",
        "sourceOfFunds": "salary",
        "relationship": "self",
        // ... 其他问卷字段
    }
}
```

### VASP 信息
```javascript
{
    "vaspCode": "VASP001",
    "vaspName": "Example VASP",
    "status": "active"
}
```

## ⚠️ 重要注意事项

1. **强制性**: 如果问卷要求返回非 NIL，必须使用旅行规则接口
2. **问卷格式**: 必须使用 URL-encoded JSON 格式
3. **地区差异**: 不同本地站问卷内容不同，需参考具体文档
4. **错误处理**:
   - `Questionnaire format not valid` - 检查 JSON 格式
   - `Questionnaire must not be blank` - 确保问卷完整
5. **合规要求**: 提供虚假信息可能导致账户冻结

## 🔧 使用建议

### 提币前检查
```bash
# 1. 检查是否需要旅行规则
GET /sapi/v1/localentity/questionnaire-requirements

# 2. 如果需要，准备问卷
questionnaire = {
    "purpose": "investment",
    "sourceOfFunds": "salary",
    ...
}

# 3. 使用旅行规则提币
POST /sapi/v1/localentity/withdraw/apply
{
    "coin": "USDT",
    "address": "0x...",
    "amount": "100",
    "questionnaire": JSON.stringify(questionnaire)
}
```

### 问卷填写建议
- 如实填写，不要提供虚假信息
- 保存常用问卷模板
- 注意 JSON 格式正确性
- 使用 URL-encode 处理特殊字符

## 📈 性能指标

- **问卷要求查询**: 权重 1，可频繁调用
- **旅行规则提币**: 权重 600，与普通提币相同
- **充币信息提供**: 权重 1，轻量级
- **VASP 列表**: 权重 1，建议缓存

## 🔍 常见问题

**Q: 什么是旅行规则？**
A: FATF（金融行动特别工作组）制定的反洗钱规则，要求虚拟资产服务提供商（VASP）在转账时交换客户信息

**Q: 哪些地区需要遵守旅行规则？**
A: 主要是欧盟、新加坡、日本等有严格 AML 要求的地区

**Q: 问卷内容是什么？**
A: 通常包括资金来源、转账目的、与收款人关系等信息

**Q: 不填问卷会怎样？**
A: 提币请求会被拒绝

**Q: 问卷信息会被保存吗？**
A: 是的，用于合规审计

**Q: 如何知道我的地区是否需要？**
A: 调用 questionnaire-requirements 接口检查

## 🌍 地区特殊说明

### 欧盟地区
- 需要详细的资金来源证明
- 可能需要额外的 KYC 文件

### 新加坡
- 严格的 VASP 验证
- 需要提供收款人信息

### 日本
- 需要声明转账目的
- 大额转账可能需要额外审核

## 📚 相关文档

- `withdraw-questionnaire.md` - 各地区问卷模板
- `appendix.md` - 详细说明和示例
- `questionnaire-requirements.md` - 检查接口文档

---

**文档数量**: 15 个
**核心接口**: 4 个
**关联模块**: capital, asset, account
**合规等级**: 最高
**适用范围**: 特定本地站
