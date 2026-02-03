# 获取所有杠杆资产信息 (MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取所有杠杆资产信息

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/allAssets`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| Name  | Type   | Mandatory | Description |
|-------|--------|-----------|-------------|
| asset | STRING | NO        |             |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "assetFullName": "USD coin",
    "assetName": "USDC",
    "isBorrowable": true,
    "isMortgageable": true,
    "userMinBorrow": "0.00000000",
    "userMinRepay": "0.00000000",
    "delistTime": 1704973040
  }
]
```