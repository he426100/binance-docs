# 查询杠杆价格指数 (MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Margin-PriceIndex#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询杠杆价格指数

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Margin-PriceIndex#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/priceIndex`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Margin-PriceIndex#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Margin-PriceIndex#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述 |
|--------|--------|------|----|
| symbol | STRING | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Margin-PriceIndex#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
   "calcTime": 1562046418000,
   "price": "0.00333930",
   "symbol": "BNBBTC"
}
```