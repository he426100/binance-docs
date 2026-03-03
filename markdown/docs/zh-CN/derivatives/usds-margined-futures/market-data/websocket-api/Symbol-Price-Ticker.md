# 最新价格

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Price-Ticker#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

返回最近价格

## 方式[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Price-Ticker#%E6%96%B9%E5%BC%8F "方式的直接链接")

`ticker.price`

## 请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Price-Ticker#%E8%AF%B7%E6%B1%82 "请求的直接链接")

```javascript
{
   	"id": "9d32157c-a556-4d27-9866-66760a174b57",
    "method": "ticker.price",
    "params": {
        "symbol": "BTCUSDT"
    }
}
```

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Price-Ticker#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

单交易对**1**，无交易对**2**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Price-Ticker#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | NO   | 交易对 |

> - 不发送交易对参数，则会返回所有交易对信息

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/websocket-api/Symbol-Price-Ticker#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "id": "9d32157c-a556-4d27-9866-66760a174b57",
  "status": 200,
  "result": {
	"symbol": "BTCUSDT",
	"price": "6000.01",
	"time": 1589437530011   
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
	   "symbol": "BTCUSDT",
	   "price": "6000.01",
	   "time": 1589437530011  
    }  
  ],
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