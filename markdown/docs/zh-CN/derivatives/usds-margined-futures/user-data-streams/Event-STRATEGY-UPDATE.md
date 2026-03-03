# 策略交易更新推送

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-STRATEGY-UPDATE#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

`STRATEGY_UPDATE` 在策略交易创建、取消、失效等等时候更新。

**策略状态**

- NEW
- WORKING
- CANCELLED
- EXPIRED

**opCode**

- 8001: 策略参数更改
- 8002: 用户取消策略
- 8003: 用户手动新增或取消订单
- 8004: 达到 stop limit
- 8005: 用户仓位爆仓
- 8006: 已达最大可挂单数量
- 8007: 新增网格策略
- 8008: 保证金不足
- 8009: 价格超出范围
- 8010: 市场非交易状态
- 8011: 关仓失败，平仓单无法成交
- 8012: 超过最大可交易名目金额
- 8013: 不符合网格交易身份
- 8014: 不符合 Futures Trading Quantitative Rules，策略终止
- 8015: 无仓位或是仓位已经爆仓

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-STRATEGY-UPDATE#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`STRATEGY_UPDATE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-STRATEGY-UPDATE#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"e": "STRATEGY_UPDATE", // 事件类型
	"T": 1669261797627, // 撮合时间
	"E": 1669261797628, // 事件时间
	"su": {
			"si": 176054594, // 策略 ID
			"st": "GRID", // 策略类型
			"ss": "NEW", // 策略状态
			"s": "BTCUSDT", // 交易对
			"ut": 1669261797627, // 更新时间
			"c": 8007 // opCode
		}
}
```