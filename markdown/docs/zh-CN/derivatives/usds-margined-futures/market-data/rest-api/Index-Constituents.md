# 查询指数价格成分

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Index-Constituents#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询指数价格成分

**注意：** 传统金融合约的成分价格将被隐藏，并统一显示为 -1。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Index-Constituents#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/constituents`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Index-Constituents#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**2**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Index-Constituents#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | YES  | 交易对 |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Index-Constituents#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "symbol": "BTCUSDT",
    "time": 1745401553408,
    "constituents": [
        {
            "exchange": "binance",
            "symbol": "BTCUSDT",
            "price": "94057.03000000",
            "weight": "0.51282051"
        },
        {
            "exchange": "coinbase",
            "symbol": "BTC-USDT",
            "price": "94140.58000000",
            "weight": "0.15384615"
        },
        {
            "exchange": "gateio",
            "symbol": "BTC_USDT",
            "price": "94060.10000000",
            "weight": "0.02564103"
        },
        {
            "exchange": "kucoin",
            "symbol": "BTC-USDT",
            "price": "94096.70000000",
            "weight": "0.07692308"
        },
        {
            "exchange": "mxc",
            "symbol": "BTCUSDT",
            "price": "94057.02000000",
            "weight": "0.07692308"
        },
        {
            "exchange": "bitget",
            "symbol": "BTCUSDT",
            "price": "94064.03000000",
            "weight": "0.07692308"
        },
        {
            "exchange": "bybit",
            "symbol": "BTCUSDT",
            "price": "94067.90000000",
            "weight": "0.07692308"
        }
    ]
}
```