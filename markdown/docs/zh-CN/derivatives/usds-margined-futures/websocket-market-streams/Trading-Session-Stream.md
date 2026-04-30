# 当前交易时段

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Trading-Session-Stream#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

每秒返回统金融合约标的资产（美股市场及大宗商品市场）的当前交易时段信息。不同标的市场的交易时段信息由不同消息推送。美股市场的交易时段包括 "PRE\_MARKET"、"REGULAR"、"AFTER\_MARKET"、"OVERNIGHT" 及 "NO\_TRADING"；大宗商品市场的交易时段包括 "REGULAR" 和 "NO\_TRADING"。

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Trading-Session-Stream#url-path "URL PATH的直接链接")

`/market`

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Trading-Session-Stream#stream-name "Stream Name的直接链接")

`tradingSession`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Trading-Session-Stream#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**1s**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Trading-Session-Stream#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
  {
    "e": "EquityUpdate",  	// 事件类型, 也可以是CommodityUpdate
    "E": 1765244143062,     // 事件时间
    "t": 1765242000000,   	// 交易时段开始时间
    "T": 1765270800000,		  // 交易时段结束时间
    "S": "OVERNIGHT"        // 交易时段类型
  }
```