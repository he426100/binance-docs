# 当前最优挂单

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Order-Book-Ticker#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

返回当前最优的挂单(最高买单，最低卖单)

## 方式[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Order-Book-Ticker#%E6%96%B9%E5%BC%8F "方式的直接链接")

`ticker.book`

**注意：** 响应消息不包含RPI订单，其不可见。

## 请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Order-Book-Ticker#%E8%AF%B7%E6%B1%82 "请求的直接链接")

```javascript
{
    "id": "9d32157c-a556-4d27-9866-66760a174b57",
    "method": "ticker.book",
    "params": {
        "symbol": "BTCUSDT"
    }
}
```

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Order-Book-Ticker#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

单交易对**2**，无交易对**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Order-Book-Ticker#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | NO   | 交易对 |

> - 不发送交易对参数，则会返回所有交易对信息
> - 该接口返回头中的`X-MBX-USED-WEIGHT-1M`参数不准确，可以忽略

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Order-Book-Ticker#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "id": "9d32157c-a556-4d27-9866-66760a174b57",
  "status": 200,
  "result": {
    "lastUpdateId": 1027024,
    "symbol": "BTCUSDT", // 交易对
    "bidPrice": "4.00000000", //最优买单价
    "bidQty": "431.00000000", //挂单量
    "askPrice": "4.00000200", //最优卖单价
    "askQty": "9.00000000", //挂单量
    "time": 1589437530011   // 撮合引擎时间
  },
  "rateLimits": [
    {
      "rateLimitType": "REQUEST_WEIGHT",
      "interval": "MINUTE",
      "intervalNum": 1,
      "limit": 2400,
      "count": 2
    }
  ]
}
```

> 或(当不发送symbol)

```javascript
{
  "id": "9d32157c-a556-4d27-9866-66760a174b57",
  "status": 200,
  "result": [
	{
      "lastUpdateId": 1027024,
      "symbol": "BTCUSDT", // 交易对
      "bidPrice": "4.00000000", //最优买单价
      "bidQty": "431.00000000", //挂单量
      "askPrice": "4.00000200", //最优卖单价
      "askQty": "9.00000000", //挂单量
      "time": 1589437530011   // 撮合引擎时间
    }
 ]
  "rateLimits": [
    {
      "rateLimitType": "REQUEST_WEIGHT",
      "interval": "MINUTE",
      "intervalNum": 1,
      "limit": 2400,
      "count": 2
    }
  ]
}
```