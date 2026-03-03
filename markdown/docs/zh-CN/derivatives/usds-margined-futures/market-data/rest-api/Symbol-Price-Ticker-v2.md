# 最新价格V2

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Symbol-Price-Ticker-v2#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

返回最近价格

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Symbol-Price-Ticker-v2#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v2/ticker/price`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Symbol-Price-Ticker-v2#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

单交易对**1**，无交易对**2**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Symbol-Price-Ticker-v2#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | NO   | 交易对 |

> - 不发送交易对参数，则会返回所有交易对信息
> - 该接口返回头中的`X-MBX-USED-WEIGHT-1M`参数不准确，可以忽略

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Symbol-Price-Ticker-v2#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **响应:**

```javascript
{
  "symbol": "LTCBTC",		// 交易对
  "price": "4.00000200",		// 价格
  "time": 1589437530011   // 撮合引擎时间
}
```

> 或(当不发送symbol)

```javascript
[
	{
  		"symbol": "BTCUSDT",	// 交易对
  		"price": "6000.01",		// 价格
  		"time": 1589437530011   // 撮合引擎时间
	}
]
```