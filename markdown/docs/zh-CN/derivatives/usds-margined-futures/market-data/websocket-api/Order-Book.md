# 深度信息

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Order-Book#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取有限档订单薄信息

## 方式[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Order-Book#%E6%96%B9%E5%BC%8F "方式的直接链接")

`depth`

**注意：** 响应消息不包含RPI订单，其不可见。

## 请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Order-Book#%E8%AF%B7%E6%B1%82 "请求的直接链接")

```javascript
{
    "id": "51e2affb-0aba-4821-ba75-f2625006eb43",
    "method": "depth",
    "params": {
      "symbol": "BTCUSDT"
    }
}
```

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Order-Book#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

| limit         | 权重 |
|---------------|----|
| 5, 10, 20, 50 | 2  |
| 100           | 5  |
| 500           | 10 |
| 1000          | 20 |

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Order-Book#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述                                           |
|--------|--------|------|----------------------------------------------|
| symbol | STRING | YES  | 交易对                                          |
| limit  | INT    | NO   | 默认 500; 可选值:\[5, 10, 20, 50, 100, 500, 1000] |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Order-Book#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "id": "51e2affb-0aba-4821-ba75-f2625006eb43",
  "status": 200,
  "result": {
    "lastUpdateId": 1027024,
    "E": 1589436922972,   // 消息时间
    "T": 1589436922959,   // 撮合引擎时间
    "bids": [				// 买单
      [
        "4.00000000",     // 价格
        "431.00000000"    // 数量
      ]
    ],
    "asks": [				// 卖单
      [
        "4.00000200",		// 价格
        "12.00000000"		// 数量
      ]
    ]
  },
  "rateLimits": [
    {
      "rateLimitType": "REQUEST_WEIGHT",
      "interval": "MINUTE",
      "intervalNum": 1,
      "limit": 2400,
      "count": 5
    }
  ]
}
```