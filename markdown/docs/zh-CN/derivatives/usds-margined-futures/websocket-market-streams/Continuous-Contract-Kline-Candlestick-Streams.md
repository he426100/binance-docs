# 连续合约K线

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Continuous-Contract-Kline-Candlestick-Streams#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

K线stream逐秒推送所请求的K线种类(最新一根K线)的更新。

**合约类型:**

- perpetual 永续合约
- current\_quarter 当季交割合约
- next\_quarter 次季交割合约
- tradifi\_perpetual 传统金融合约

**订阅Kline需要提供间隔参数,最短为分钟线,最长为月线。支持以下间隔:**

s -&gt; 秒; m -&gt; 分钟; h -&gt; 小时; d -&gt; 天; w -&gt; 周; M -&gt; 月

- 1s
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

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Continuous-Contract-Kline-Candlestick-Streams#url-path "URL PATH的直接链接")

`/market`

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Continuous-Contract-Kline-Candlestick-Streams#stream-name "Stream Name的直接链接")

`<pair>_<contractType>@continuousKline_<interval>`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Continuous-Contract-Kline-Candlestick-Streams#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**250ms**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Continuous-Contract-Kline-Candlestick-Streams#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e":"continuous_kline",	// 事件类型
  "E":1607443058651,		// 事件时间
  "ps":"BTCUSDT",			// 标的交易对
  "ct":"PERPETUAL",			// 合约类型 
  "k":{
    "t":1607443020000,		// 这根K线的起始时间
    "T":1607443079999,		// 这根K线的结束时间
    "i":"1m",				// K线间隔
    "f":116467658886,		// 这根K线期间第一笔更新ID
    "L":116468012423,		// 这根K线期间末一笔更新ID
    "o":"18787.00",			// 这根K线期间第一笔成交价
    "c":"18804.04",			// 这根K线期间末一笔成交价
    "h":"18804.04",			// 这根K线期间最高成交价
    "l":"18786.54",			// 这根K线期间最低成交价
    "v":"197.664",			// 这根K线期间成交量
    "n":543,				// 这根K线期间成交笔数
    "x":false,				// 这根K线是否完结(是否已经开始下一根K线)
    "q":"3715253.19494",	// 这根K线期间成交额
    "V":"184.769",			// 主动买入的成交量
    "Q":"3472925.84746",	// 主动买入的成交额
    "B":"0"					// 忽略此参数
  }
}
```