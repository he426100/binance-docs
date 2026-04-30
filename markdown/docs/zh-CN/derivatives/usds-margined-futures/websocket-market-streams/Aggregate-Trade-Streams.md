# 归集交易

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Aggregate-Trade-Streams#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

同一价格、同一方向、同一时间(100ms计算)的trade会被聚合为一条.

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Aggregate-Trade-Streams#url-path "URL PATH的直接链接")

`/market`

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Aggregate-Trade-Streams#stream-name "Stream Name的直接链接")

`<symbol>@aggTrade`

**注意：** 响应消息字段`q`聚合RPI订单数据，但无任何特殊标签区别。

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Aggregate-Trade-Streams#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**100ms**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Aggregate-Trade-Streams#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e": "aggTrade",  // 事件类型
  "E": 123456789,   // 事件时间
  "s": "BNBUSDT",   // 交易对
  "a": 5933014,		  // 归集成交 ID
  "p": "0.001",     // 成交价格
  "q": "100",       // 成交量，包含RPI订单数据
  "nq": "100",      // 普通订单成交量，不包含RPI订单数据
  "f": 100,         // 被归集的首个交易ID
  "l": 105,         // 被归集的末次交易ID
  "T": 123456785,   // 成交时间
  "m": true         // 买方是否是做市方。如true，则此次成交是一个主动卖出单，否则是一个主动买入单。
}
```