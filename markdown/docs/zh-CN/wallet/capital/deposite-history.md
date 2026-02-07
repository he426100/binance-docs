# 获取充值历史(支持多网络)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/capital/deposite-history#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取充值历史(支持多网络)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/capital/deposite-history#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/capital/deposit/hisrec`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/capital/deposite-history#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/capital/deposite-history#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称            | 类型      | 是否必需 | 描述                                            |
|---------------|---------|------|-----------------------------------------------|
| includeSource | Boolean | NO   | 默认 `false`，如果为`true`时会返回`sourceAddress`字段     |
| coin          | STRING  | NO   |                                               |
| status        | INT     | NO   | 0(0:待确认,6:已上账待解锁,7:错误充值,8:待用户申请确认,1:成功,2:已拒绝) |
| startTime     | LONG    | NO   | 默认当前时间90天前的时间戳                                |
| endTime       | LONG    | NO   | 默认当前时间戳                                       |
| offset        | INT     | NO   | 默认:0                                          |
| limit         | INT     | NO   | 默认：1000，最大1000                                |
| recvWindow    | LONG    | NO   |                                               |
| timestamp     | LONG    | YES  |                                               |
| txId          | STRING  | NO   |                                               |

> - 请注意`startTime` 与 `endTime` 的默认时间戳，保证请求时间间隔不超过90天.
> - 同时提交`startTime` 与 `endTime`间隔不得超过90天.
> - 请注意，由于网络特定的特性，返回的源地址可能不准确。 如果找到多个源地址，则仅返回第一个地址

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/capital/deposite-history#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "id": "769800519366885376",
        "amount": "0.001",
        "coin": "BNB",
        "network": "BNB",
        "status": 1,
        "address": "bnb136ns6lfw4zs5hg4n85vdthaad7hq5m4gtkgf23",
        "addressTag": "101764890",
        "txId": "98A3EA560C6B3336D348B6C83F0F95ECE4F1F5919E94BD006E5BF3BF264FACFC",
        "insertTime": 1661493146000,
        "completeTime":1661493146000,
        "transferType": 0,
        "confirmTimes": "1/1",
        "unlockConfirm": 0,
        "walletType": 0,
        "travelRuleStatus": 0 //0: travel rule not required OR info already provided and funds ready to use, 1: travel rule required to provide deposit info
    },
    {
        "id": "769754833590042625",
        "amount":"0.50000000",
        "coin":"IOTA",
        "network":"IOTA",
        "status":1,
        "address":"SIZ9VLMHWATXKV99LH99CIGFJFUMLEHGWVZVNNZXRJJVWBPHYWPPBOSDORZ9EQSHCZAMPVAPGFYQAUUV9DROOXJLNW",
        "addressTag":"",
        "txId":"ESBFVQUTPIWQNJSPXFNHNYHSQNTGKRVKPRABQWTAXCDWOAKDKYWPTVG9BGXNVNKTLEJGESAVXIKIZ9999",
        "insertTime":1599620082000,
        "completeTime":1599620082000,// 代表充值完成时间，仅适用于2025年03月06日之后的充值。
        "transferType":0,
        "confirmTimes": "1/1",
        "unlockConfirm": 0,
        "walletType": 0,
        "travelRuleStatus": 1 //0: travel rule not required OR info already provided and funds ready to use, 1: travel rule required to provide deposit info
    }
]
```