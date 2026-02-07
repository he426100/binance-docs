# 查询开放币对列表 (MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/open-symbol-list#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询即将开放交易的币对列表。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/open-symbol-list#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/spot/open-symbol-list`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/open-symbol-list#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**100**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/open-symbol-list#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

无需参数。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/open-symbol-list#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "openTime": 1686161202000,
    "symbols": [
      "BNBBTC",
      "BNBETH"
    ]
  },
  {
    "openTime": 1686222232000,
    "symbols": [
      "BTCUSDT"
    ]
  }
]
```