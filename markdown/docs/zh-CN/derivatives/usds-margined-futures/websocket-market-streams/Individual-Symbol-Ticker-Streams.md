# 按Symbol的完整Ticker

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Ticker-Streams#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

按Symbol刷新的24小时完整ticker信息

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Ticker-Streams#stream-name "Stream Name的直接链接")

`<symbol>@ticker`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Ticker-Streams#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**2000ms**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Individual-Symbol-Ticker-Streams#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e": "24hrTicker",  // 事件类型
  "E": 123456789,     // 事件时间
  "s": "BNBUSDT",      // 交易对
  "p": "0.0015",      // 24小时价格变化
  "P": "250.00",      // 24小时价格变化(百分比)
  "w": "0.0018",      // 平均价格
  "c": "0.0025",      // 最新成交价格
  "Q": "10",          // 最新成交价格上的成交量
  "o": "0.0010",      // 24小时内第一比成交的价格
  "h": "0.0025",      // 24小时内最高成交价
  "l": "0.0010",      // 24小时内最低成交价
  "v": "10000",       // 24小时内成交量
  "q": "18",          // 24小时内成交额
  "O": 0,             // 统计开始时间
  "C": 86400000,      // 统计关闭时间
  "F": 0,             // 24小时内第一笔成交交易ID
  "L": 18150,         // 24小时内最后一笔成交交易ID
  "n": 18151          // 24小时内成交数
}
```