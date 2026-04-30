# 综合指数交易对信息流

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Composite-Index-Symbol-Information-Streams#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

获取交易对为综合指数的基础成分信息。 推送间隔1000毫秒(如有刷新)

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Composite-Index-Symbol-Information-Streams#url-path "URL PATH的直接链接")

`/market`

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Composite-Index-Symbol-Information-Streams#stream-name "Stream Name的直接链接")

`<symbol>@compositeIndex`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Composite-Index-Symbol-Information-Streams#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**1000ms**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Composite-Index-Symbol-Information-Streams#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e":"compositeIndex",		// 事件类型
  "E":1602310596000,		// 事件事件
  "s":"DEFIUSDT",			// 交易对
  "p":"554.41604065",		// 价格
  "C":"baseAsset",
  "c":[					// 成分信息
  	{
  		"b":"BAL",			// 基础资产
  		"q":"USDT",         // 报价资产
  		"w":"1.04884844",	// 权重(数量)
  		"W":"0.01457800",   // 权重(比例)
  		"i":"24.33521021"   // 指数价格
  	},
  	{
  		"b":"BAND",
  		"q":"USDT",        
  		"w":"3.53782729",
  		"W":"0.03935200",
  		"i":"7.26420084"
    }
  ]
}
```