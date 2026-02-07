# Fetch address verification list (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/address-verification-list#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取地址验证列表，以便用户检查地址簿中存储的地址的状态和其他详细信息。

## HTTP 请求[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/address-verification-list#http-%E8%AF%B7%E6%B1%82 "HTTP 请求的直接链接")

GET `/sapi/v1/addressVerify/list`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/address-verification-list#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/address-verification-list#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必须 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/address-verification-list#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "status": "PENDING",
    "token": "AVAX",
    "network": "AVAXC",
    "walletAddress": "0xc03a6aa728a8dde7464c33828424ede7553a0021",
    "addressQuestionnaire": { 
      "sendTo": 1,
      "satoshiToken": "AVAX",
      "isAddressOwner": 1,
      "verifyMethod": 1
    }
  }
]
```

1. `status`：指地址验证的状态。响应将返回以下状态之一 - 已验证、未验证、待验证。
2. `token` 和 `network`：已验证此特定代币/网络提现的地址。
3. `walletAddress`：已添加到地址簿的钱包地址。
4. `addressQuestionaire`：您在验证问卷中回答的详细信息。