# 查询上架计划 (MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-List-Schedule#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询全仓和逐仓的币种或币对的上架计划

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-List-Schedule#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/list-schedule`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-List-Schedule#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**100**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-List-Schedule#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-List-Schedule#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "listTime": 1686161202000,
    "crossMarginAssets": [
      "BTC",
      "USDT"
    ],
    "isolatedMarginSymbols": [
      "ADAUSDT",
      "BNBUSDT"
    ]
  },
  {
    "listTime": 1686222232000,
    "crossMarginAssets": [
      "ADA"
    ],
    "isolatedMarginSymbols": []
  }
]
```