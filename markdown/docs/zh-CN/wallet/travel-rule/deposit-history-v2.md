# 获取充值历史V2(针对需要旅行规则的本地站)(支持多网络)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-history-v2#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取充值历史(针对需要旅行规则的本地站)(支持多网络)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-history-v2#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v2/localentity/deposit/history`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-history-v2#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-history-v2#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                    | 类型      | 是否必需 | 描述                          |
|-----------------------|---------|------|-----------------------------|
| depositId             | STRING  | NO   | 入金记录ID，支持多条查询，以半角逗号(,) 分隔   |
| txId                  | STRING  | NO   | 链上TxId，支持多条查询，以半角逗号(,) 分隔   |
| network               | STRING  | NO   |                             |
| coin                  | STRING  | NO   |                             |
| retrieveQuestionnaire | BOOLEAN | NO   | true:返回的记录中带有问卷内容，false/缺省. |
| startTime             | LONG    | NO   | 默认当前时间90天前的时间戳              |
| endTime               | LONG    | NO   | 默认当前时间戳                     |
| offset                | INTEGER | NO   | 默认:0                        |
| limit                 | INTEGER | NO   | 默认:1000，最大1000              |
| timestamp             | LONG    | YES  |                             |

> - 请注意`startTime` 与 `endTime` 的默认时间戳，保证请求时间间隔不超过90天。
> - 同时提交`startTime` 与 `endTime`间隔不得超过90天。
> - 请注意，由于网络特定的特性，返回的源地址可能不准确。 如果找到多个源地址，则仅返回第一个地址。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-history-v2#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "depositId": "4615328107052018945",
        "amount": "0.01",
        "network": "AVAXC",
        "coin": "AVAX",
        "depositStatus": 1,
        "travelRuleReqStatus": 0, // 0:PASS,2:REJECTED,3:PENDING,-1:FAILED 
        "address": "0x0010627ab66d69232f4080d54e0f838b4dc3894a",
        "addressTag": "",
        "txId": "0xdde578983015741eed764e7ca10defb5a2caafdca3db5f92872d24a96beb1879",
        "transferType": 0,
        "confirmTimes": "12/12",
        "requireQuestionnaire": false, // true: This deposit require user to answer questionnaire to get it credited
                                       // false: This deposit doesn't require user to answer questionnaire as it's already completed or information has been verified
        "questionnaire": {
            "vaspName": "BINANCE",
            "depositOriginator": 0
        },
        "insertTime": 1753053392000
    }
]
```