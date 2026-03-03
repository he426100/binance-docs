# 全市场强平订单

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/All-Market-Liquidation-Order-Streams#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

推送全市场强平订单快照信息 每个symbol，1000ms内至多仅推送一条最近的强平订单作为快照

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/All-Market-Liquidation-Order-Streams#stream-name "Stream Name的直接链接")

`!forceOrder@arr`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/All-Market-Liquidation-Order-Streams#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**实时**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/All-Market-Liquidation-Order-Streams#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"e":"forceOrder",                   // 事件类型
	"E":1568014460893,                  // 事件时间
	"o":{
		"s":"BTCUSDT",                   // 交易对
		"S":"SELL",                      // 订单方向
		"o":"LIMIT",                     // 订单类型
		"f":"IOC",                       // 有效方式
		"q":"0.014",                     // 订单数量
		"p":"9910",                      // 订单价格
		"ap":"9910",                     // 平均价格
		"X":"FILLED",                    // 订单状态
		"l":"0.014",                     // 订单最近成交量
		"z":"0.014",                     // 订单累计成交量
		"T":1568014460893,          	 // 交易时间
	}
}
```