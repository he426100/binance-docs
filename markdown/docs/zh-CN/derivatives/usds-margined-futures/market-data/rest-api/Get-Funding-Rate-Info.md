# 查询资金费率信息

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-Info#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询资金费率信息，接口仅返回FundingRateCap/FundingRateFloor/fundingIntervalHours等被特殊调整过的交易对，没调整过的不返回。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-Info#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/fundingInfo`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-Info#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**0**

和`GET /fapi/v1/fundingRate`共享500/5min/IP

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-Info#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-Info#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "symbol": "BLZUSDT",
        "adjustedFundingRateCap": "0.02500000",
        "adjustedFundingRateFloor": "-0.02500000",
        "fundingIntervalHours": 8,
        "disclaimer": false
    }
]
```