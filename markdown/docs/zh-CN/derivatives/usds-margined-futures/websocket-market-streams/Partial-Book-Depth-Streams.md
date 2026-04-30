# 有限档深度信息

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Partial-Book-Depth-Streams#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

推送有限档深度信息。levels表示几档买卖单信息, 可选 5/10/20档

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Partial-Book-Depth-Streams#url-path "URL PATH的直接链接")

`/public`

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Partial-Book-Depth-Streams#stream-name "Stream Name的直接链接")

`<symbol>@depth<levels>` 或 `<symbol>@depth<levels>@500ms` 或 `<symbol>@depth<levels>@100ms`.

**注意：** 响应消息不包含RPI订单，其不可见。

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Partial-Book-Depth-Streams#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**250ms** 或 **500ms** 或 **100ms**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Partial-Book-Depth-Streams#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e": "depthUpdate", 			// 事件类型
  "E": 1571889248277, 			// 事件时间
  "T": 1571889248276, 			// 交易时间
  "s": "BTCUSDT",
  "U": 390497796,           // 从上次推送至今新增的第一个 update Id
  "u": 390497878,           // 从上次推送至今新增的最后一个 update Id
  "pu": 390497794,          // 上次推送的最后一个update Id(即上条消息的‘u’)
  "b": [             				// 买方
    [
      "7403.89",  	  			// 价格
      "0.002"     		  		// 数量
    ],
    [
      "7403.90",
      "3.906"
    ],
    [
      "7404.00",
      "1.428"
    ],
    [
      "7404.85",
      "5.239"
    ],
    [
      "7405.43",
      "2.562"
    ]
  ],
  "a": [          				// 卖方
    [
      "7405.96",  				// 价格
      "3.340"     				// 数量
    ],
    [
      "7406.63",
      "4.525"
    ],
    [
      "7407.08",
      "2.475"
    ],
    [
      "7407.15",
      "4.800"
    ],
    [
      "7407.20",
      "0.175"
    ]
  ]
}
```