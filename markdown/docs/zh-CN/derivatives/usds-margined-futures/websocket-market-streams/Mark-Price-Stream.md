# 最新标记价格

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Mark-Price-Stream#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

最新标记价格

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Mark-Price-Stream#url-path "URL PATH的直接链接")

`/market`

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Mark-Price-Stream#stream-name "Stream Name的直接链接")

`<symbol>@markPrice` 或 `<symbol>@markPrice@1s`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Mark-Price-Stream#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**3000ms** 或 **1000ms**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Mark-Price-Stream#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
  {
    "e": "markPriceUpdate",  	// 事件类型
    "E": 1562305380000,      	// 事件时间
    "s": "BTCUSDT",          	// 交易对
    "p": "11794.15000000",   	// 标记价格
    "ap": "11794.15000000",   // 标记价格移动平均
    "i": "11784.62659091",		// 现货指数价格
    "P": "11784.25641265",		// 预估结算价,仅在结算前最后一小时有参考价值
    "r": "0.00038167",       	// 资金费率
    "T": 1562306400000       	// 下次资金时间
  }
```