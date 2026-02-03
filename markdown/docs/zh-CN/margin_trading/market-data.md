# 全仓币种质押率 (MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

全仓币种质押率

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/crossMarginCollateralRatio`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**100(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

None

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "collaterals": [
      {
        "minUsdValue": "0",
        "maxUsdValue": "13000000",
        "discountRate": "1"
      },
      {
        "minUsdValue": "13000000",
        "maxUsdValue": "20000000",
        "discountRate": "0.975"
      },
      {
        "minUsdValue": "20000000",
        "discountRate": "0"
      }
    ],
    "assetNames": [
      "BNX"
    ]
  },
  {
    "collaterals": [
      {
        "minUsdValue": "0",
        "discountRate": "1"
      }
    ],
    "assetNames": [
      "BTC",
      "BUSD",
      "ETH",
      "USDT"
    ]
  }
]
```