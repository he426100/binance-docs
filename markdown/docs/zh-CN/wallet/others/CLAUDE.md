# Wallet Others 模块 - AI 上下文

> **模块**: 其他功能
> **路径**: `markdown/docs/zh-CN/wallet/others/`
> **最后更新**: 2026-02-07

## 📋 模块概述

其他功能模块提供系统状态查询和币种下架信息等辅助功能。

## 🎯 核心功能

### 1. 系统状态
- 查询币安系统运行状态
- 系统维护通知

### 2. 下架信息
- 币种下架时间表
- 提前规划资产处理

## 📁 文件清单 (2个)

1. `system-status.md` - 系统状态查询 ⭐
2. `delist-schedule.md` - 下架时间表

## 🔑 关键接口

### 系统状态
```
GET /sapi/v1/system/status
权重: 1 (IP)
认证: NONE (无需认证)
```

**响应示例**:
```javascript
{
    "status": 0,              // 0: normal, 1: system maintenance
    "msg": "normal"           // "normal", "system_maintenance"
}
```

**状态说明**:
- `0` / `"normal"` - 系统正常运行
- `1` / `"system_maintenance"` - 系统维护中

### 下架时间表
```
GET /sapi/v1/spot/delist-schedule
权重: 100 (IP)
认证: MARKET_DATA
```

**响应示例**:
```javascript
[
    {
        "delistTime": 1686895200000,
        "symbols": [
            "BNBUSDT",
            "BTCUSDT"
        ]
    }
]
```

## 🔗 与其他模块的关系

### 与所有模块
- **系统状态**: 所有 API 调用前建议先检查系统状态
- 系统维护期间 API 可能不可用

### 与 Capital 模块
- 币种下架前需要及时提币
- 下架后可能无法充提

### 与 Asset 模块
- 下架币种需要及时转换或提币
- 可能需要使用小额资产转换

### 与 Margin Trading 模块
- 下架币种的杠杆交易对会提前关闭
- 需要提前平仓和还款

## 📊 使用场景

### 系统状态检查
```bash
# 在关键操作前检查系统状态
GET /sapi/v1/system/status

if (status == 0) {
    // 系统正常，继续操作
    执行交易/充提币等操作
} else {
    // 系统维护中，稍后重试
    等待系统恢复
}
```

### 下架币种处理
```bash
# 1. 查询下架时间表
GET /sapi/v1/spot/delist-schedule

# 2. 检查持有的币种是否在下架列表
if (持有下架币种) {
    # 3. 在下架前处理资产
    - 卖出换成其他币种
    - 或提币到其他平台
    - 或转换为小额资产
}
```

## ⚠️ 重要注意事项

1. **系统维护**:
   - 定期维护通常提前公告
   - 紧急维护可能无预警
   - 维护期间 API 可能完全不可用

2. **下架处理**:
   - 下架通常提前 1-2 周公告
   - 下架后无法交易和充币
   - 提币通常会保留一段时间
   - 小额资产可能无法提币

3. **监控建议**:
   - 定期检查下架时间表
   - 设置下架提醒
   - 及时处理即将下架的币种

## 🔧 使用建议

### 健壮的 API 调用
```javascript
// 1. 检查系统状态
const status = await getSystemStatus();
if (status.status !== 0) {
    throw new Error('System under maintenance');
}

// 2. 执行业务操作
try {
    await executeTradeOrWithdraw();
} catch (error) {
    // 3. 错误处理
    if (error.code === -1001) {
        // 系统维护，稍后重试
        await sleep(60000);
        retry();
    }
}
```

### 下架监控
```javascript
// 定期检查下架时间表（每天一次）
const schedule = await getDelistSchedule();

for (const item of schedule) {
    const daysUntilDelist = (item.delistTime - Date.now()) / 86400000;

    if (daysUntilDelist < 7) {
        // 7天内下架，发送警告
        alert(`${item.symbols} will be delisted in ${daysUntilDelist} days`);
    }
}
```

## 📈 性能指标

- **系统状态**: 权重 1，可频繁调用
- **下架时间表**: 权重 100，建议每天查询一次并缓存

## 🔍 常见问题

**Q: 系统维护多久？**
A: 通常 1-4 小时，具体看公告

**Q: 维护期间能提币吗？**
A: 不能，所有 API 都不可用

**Q: 下架后币还在吗？**
A: 在，但无法交易，需要尽快提币

**Q: 下架币种能转换为 BNB 吗？**
A: 可以使用小额资产转换功能

**Q: 如何获取维护通知？**
A: 关注币安公告或定期调用系统状态接口

**Q: 下架时间表多久更新？**
A: 实时更新，建议每天查询一次

## 💡 最佳实践

### 1. 系统状态监控
```javascript
// 每分钟检查一次系统状态
setInterval(async () => {
    const status = await getSystemStatus();
    if (status.status === 1) {
        // 暂停所有自动化操作
        pauseAllBots();
    } else {
        // 恢复操作
        resumeAllBots();
    }
}, 60000);
```

### 2. 下架预警系统
```javascript
// 每天检查一次下架时间表
cron.schedule('0 0 * * *', async () => {
    const schedule = await getDelistSchedule();
    const myAssets = await getUserAssets();

    // 检查持有的币种是否即将下架
    for (const asset of myAssets) {
        const delistInfo = schedule.find(s =>
            s.symbols.includes(asset.coin)
        );

        if (delistInfo) {
            // 发送通知
            notify(`${asset.coin} will be delisted soon!`);
        }
    }
});
```

### 3. 容错处理
```javascript
async function robustApiCall(apiFunction) {
    // 先检查系统状态
    const status = await getSystemStatus();
    if (status.status !== 0) {
        throw new Error('System maintenance');
    }

    // 执行 API 调用
    try {
        return await apiFunction();
    } catch (error) {
        // 如果是系统维护错误，等待后重试
        if (error.code === -1001) {
            await sleep(300000); // 等待 5 分钟
            return await robustApiCall(apiFunction);
        }
        throw error;
    }
}
```

## 📚 相关资源

- [币安系统状态页面](https://www.binance.com/en/system-status)
- [币安公告中心](https://www.binance.com/en/support/announcement)

---

**文档数量**: 2 个
**核心接口**: 2 个
**关联模块**: 所有模块
**重要性**: 辅助但关键
**建议调用频率**: 系统状态（高频）、下架时间表（每日）
