# 查询用户钱包余额(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-wallet-balance#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询用户钱包余额

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-wallet-balance#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/asset/wallet/balance`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-wallet-balance#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**60**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-wallet-balance#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                        |
|------------|--------|------|-------------------------------------------|
| quoteAsset | STRING | NO   | `USDT`, `ETH`, `USDC`, `BNB`, 等。 默认 `BTC` |
| recvWindow | LONG   | NO   |                                           |
| timestamp  | LONG   | YES  |                                           |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-wallet-balance#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "activate": true,
    "balance": "0",
    "walletName": "Spot"
  }, 
  {
    "activate": true,
    "balance": "0",
    "walletName": "Funding"
  }, 
  {
    "activate": true,
    "balance": "0",
    "walletName": "Cross Margin"
  }, 
  {
    "activate": true,
    "balance": "0",
    "walletName": "Isolated Margin"
  }, 
  {
    "activate": true,
    "balance": "0.71842752",
    "walletName": "USDⓈ-M Futures"
  }, 
  {
    "activate": true,
    "balance": "0",
    "walletName": "COIN-M Futures"
  }, 
  {
    "activate": true,
    "balance": "0",
    "walletName": "Earn"
  }, 
  {
    "activate": false,
    "balance": "0",
    "walletName": "Options"
  },
  {
      "activate": true,
      "balance": "0",
      "walletName": "Trading Bots"
  },
  {
      "activate": true,
      "balance": "0",
      "walletName": "Copy Trading"
  }
]
```