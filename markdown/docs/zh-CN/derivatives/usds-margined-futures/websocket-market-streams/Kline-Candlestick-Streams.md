# K线

## Stream Description[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Kline-Candlestick-Streams#stream-description "Stream Description的直接链接")

K线stream逐秒推送所请求的K线种类(最新一根K线)的更新。推送间隔250毫秒(如有刷新)

**订阅 Kline 需要提供间隔参数，最短为分钟线，最长为月线。支持以下间隔:**

m -&gt; 分钟; h -&gt; 小时; d -&gt; 天; w -&gt; 周; M -&gt; 月

- 1m
- 3m
- 5m
- 15m
- 30m
- 1h
- 2h
- 4h
- 6h
- 8h
- 12h
- 1d
- 3d
- 1w
- 1M

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Kline-Candlestick-Streams#stream-name "Stream Name的直接链接")

`<symbol>@kline_<interval>`

## Update Speed[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Kline-Candlestick-Streams#update-speed "Update Speed的直接链接")

**250ms**

## Response Example[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Kline-Candlestick-Streams#response-example "Response Example的直接链接")

```javascript
{
  "e": "kline",     // 事件类型
  "E": 123456789,   // 事件时间
  "s": "BNBUSDT",    // 交易对
  "k": {
    "t": 123400000, // 这根K线的起始时间
    "T": 123460000, // 这根K线的结束时间
    "s": "BNBUSDT",  // 交易对
    "i": "1m",      // K线间隔
    "f": 100,       // 这根K线期间第一笔成交ID
    "L": 200,       // 这根K线期间末一笔成交ID
    "o": "0.0010",  // 这根K线期间第一笔成交价
    "c": "0.0020",  // 这根K线期间末一笔成交价
    "h": "0.0025",  // 这根K线期间最高成交价
    "l": "0.0015",  // 这根K线期间最低成交价
    "v": "1000",    // 这根K线期间成交量
    "n": 100,       // 这根K线期间成交笔数
    "x": false,     // 这根K线是否完结(是否已经开始下一根K线)
    "q": "1.0000",  // 这根K线期间成交额
    "V": "500",     // 主动买入的成交量
    "Q": "0.500",   // 主动买入的成交额
    "B": "123456"   // 忽略此参数
  }
}
```