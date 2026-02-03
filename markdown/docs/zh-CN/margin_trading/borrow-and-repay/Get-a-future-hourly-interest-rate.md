# 查询下小时预估利率 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-a-future-hourly-interest-rate#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询用户币种下小时预估利率

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-a-future-hourly-interest-rate#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/next-hourly-interest-rate`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-a-future-hourly-interest-rate#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**100**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-a-future-hourly-interest-rate#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型      | 是否必需 | 描述                     |
|------------|---------|------|------------------------|
| assets     | String  | YES  | 资产列表，以逗号分隔，最多20个       |
| isIsolated | Boolean | YES  | 是否逐仓杠杆，"TRUE", "FALSE" |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-a-future-hourly-interest-rate#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "asset": "BTC",
        "nextHourlyInterestRate": "0.00000571"
    },
    {
        "asset": "ETH",
        "nextHourlyInterestRate": "0.00000578"
    }
]
```