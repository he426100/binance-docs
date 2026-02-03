# 获取所有全仓杠杆交易对(MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Cross-Margin-Pairs#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取所有全仓杠杆交易对

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Cross-Margin-Pairs#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/allPairs`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Cross-Margin-Pairs#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Cross-Margin-Pairs#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述 |
|--------|--------|------|----|
| symbol | STRING | NO   |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Cross-Margin-Pairs#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "base": "BNB",
        "id": 351637150141315861,
        "isBuyAllowed": true,
        "isMarginTrade": true,
        "isSellAllowed": true,
        "quote": "BTC",
        "symbol": "BNBBTC"
    },
    {
        "base": "TRX",
        "id": 351637923235429141,
        "isBuyAllowed": true,
        "isMarginTrade": true,
        "isSellAllowed": true,
        "quote": "BTC",
        "symbol": "TRXBTC",
        "delistTime": 1704973040
    },
    {
        "base": "XRP",
        "id": 351638112213990165,
        "isBuyAllowed": true,
        "isMarginTrade": true,
        "isSellAllowed": true,
        "quote": "BTC",
        "symbol": "XRPBTC"
    },
    {
        "base": "ETH",
        "id": 351638524530850581,
        "isBuyAllowed": true,
        "isMarginTrade": true,
        "isSellAllowed": true,
        "quote": "BTC",
        "symbol": "ETHBTC"
    }
]
```