# 用户持仓(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-assets#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取用户持仓，仅返回&gt;0的数据。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-assets#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v3/asset/getUserAsset`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-assets#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-assets#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称               | 类型      | 是否必需 | 描述                  |
|------------------|---------|------|---------------------|
| asset            | STRING  | NO   | 如果资产为空，则查询用户所有的正资产。 |
| needBtcValuation | BOOLEAN | NO   | 是否需要返回兑换成BTC的估值     |
| recvWindow       | LONG    | NO   |                     |
| timestamp        | LONG    | YES  |                     |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-assets#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "asset": "AVAX",
    "free": "1",
    "locked": "0",
    "freeze": "0",
    "withdrawing": "0",
    "ipoable": "0",
    "btcValuation": "0"
  },
  {
    "asset": "BCH",
    "free": "0.9",
    "locked": "0",
    "freeze": "0",
    "withdrawing": "0",
    "ipoable": "0",
    "btcValuation": "0"
  },
  {
    "asset": "BNB",
    "free": "887.47061626",
    "locked": "0",
    "freeze": "10.52",
    "withdrawing": "0.1",
    "ipoable": "0",
    "btcValuation": "0"
  },
  {
    "asset": "BUSD",
    "free": "9999.7",
    "locked": "0",
    "freeze": "0",
    "withdrawing": "0",
    "ipoable": "0",
    "btcValuation": "0"
  },
  {
    "asset": "SHIB",
    "free": "532.32",
    "locked": "0",
    "freeze": "0",
    "withdrawing": "0",
    "ipoable": "0",
    "btcValuation": "0"
  },
  {
    "asset": "USDT",
    "free": "50300000001.44911105",
    "locked": "0",
    "freeze": "0",
    "withdrawing": "0",
    "ipoable": "0",
    "btcValuation": "0"
  },
  {
    "asset": "WRZ",
    "free": "1",
    "locked": "0",
    "freeze": "0",
    "withdrawing": "0",
    "ipoable": "0",
    "btcValuation": "0"
  }
]
```