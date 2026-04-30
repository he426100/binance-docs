# RPI增量深度信息

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Diff-Book-Depth-Streams-RPI#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

orderbook 的变化部分，包含RPI订单，推送间隔 500 毫秒

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Diff-Book-Depth-Streams-RPI#url-path "URL PATH的直接链接")

`/public`

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Diff-Book-Depth-Streams-RPI#stream-name "Stream Name的直接链接")

`<symbol>@rpiDepth@500ms`

**注意：** 响应消息包含RPI订单数量。如果增量数据的推送出现数量=0时，这意味着该价位的订单全部成交或者全部撤销，亦或该价位的RPI订单因价格交叉而隐藏

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Diff-Book-Depth-Streams-RPI#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**500ms**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Diff-Book-Depth-Streams-RPI#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e": "depthUpdate", 	// 事件类型
  "E": 123456789,     	// 事件时间
  "T": 123456788,     	// 撮合时间
  "s": "BNBUSDT",      	// 交易对
  "U": 157,           	// 从上次推送至今新增的第一个 update Id
  "u": 160,           	// 从上次推送至今新增的最后一个 update Id
  "pu": 149,          	// 上次推送的最后一个update Id(即上条消息的‘u’)
  "b": [              	// 变动的买单深度
    [
      "0.0024",       	// 价格
      "10"           	// 数量
    ]
  ],
  "a": [              	// 变动的卖单深度
    [
      "0.0026",       	// 价格
      "100"          	// 数量
    ]
  ]
}
```