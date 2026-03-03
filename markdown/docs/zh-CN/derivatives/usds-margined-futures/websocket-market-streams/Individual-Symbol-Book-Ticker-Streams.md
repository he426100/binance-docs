# 按Symbol的最优挂单信息

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Book-Ticker-Streams#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

实时推送指定交易对最优挂单信息

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Book-Ticker-Streams#stream-name "Stream Name的直接链接")

`<symbol>@bookTicker`

**注意：** 响应消息不包含RPI订单，其不可见。

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Book-Ticker-Streams#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**实时**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Book-Ticker-Streams#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e":"bookTicker",		// 事件类型
  "u":400900217,     	// 更新ID
  "E": 1568014460893,	// 事件推送时间
  "T": 1568014460891,	// 撮合时间
  "s":"BNBUSDT",     	// 交易对
  "b":"25.35190000", 	// 买单最优挂单价格
  "B":"31.21000000", 	// 买单最优挂单数量
  "a":"25.36520000", 	// 卖单最优挂单价格
  "A":"40.66000000"  	// 卖单最优挂单数量
}
```