# 获取提币历史(针对需要旅行规则的本地站)(支持多网络)(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-history#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取需要旅行规则的本地站的提币历史记录

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-history#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/localentity/withdraw/history`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-history#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-history#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称               | 类型      | 是否必需 | 描述                               |
|------------------|---------|------|----------------------------------|
| trId             | STRING  | NO   | 旅行规则记录ID, 支持多条查询，以半角逗号(,) 分隔.    |
| txId             | STRING  | NO   | 链上TxId，支持多条查询，以半角逗号(,) 分隔.       |
| withdrawOrderId  | STRING  | NO   | 客户端内部定义的提币ID，支持多条查询，以半角逗号(,) 分隔. |
| network          | STRING  | NO   |                                  |
| coin             | STRING  | NO   |                                  |
| travelRuleStatus | INTEGER | NO   | 0:处理完成,1:处理中,2:请求被拒绝             |
| offset           | INT     | NO   |                                  |
| limit            | INT     | NO   | 默认：1000， 最大：1000                 |
| startTime        | LONG    | NO   | 默认当前时间90天前的时间戳                   |
| endTime          | LONG    | NO   | 默认当前时间戳                          |
| recvWindow       | LONG    | NO   |                                  |
| timestamp        | LONG    | YES  |                                  |

> - 支持多网络提币前的历史记录可能不会返回`network`字段。
> - 请注意`startTime` 与 `endTime` 的默认时间戳，保证请求时间间隔不得超过90天。
> - 同时提交`startTime` 与 `endTime`间隔不得超过90天。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-history#%E5%93%8D%00%00%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "id": "b6ae22b3aa844210a7041aee7589627c",  // 该笔提现在币安的id, 只在sAPI提现的记录中返回
    "trId": 1234456,  // 旅行规则记录Id
    "amount": "8.91000000",   // 提现转出金额
    "transactionFee": "0.004", // 手续费, 只在sAPI提现的记录中返回
    "coin": "USDT",
    "withdrawalStatus": 6, // 提币状态, 只在sAPI提现的记录中返回
    "travelRuleStatus": 0, // 旅行规则处理状态，处理完成(0)之后才会继续提币流程
    "address": "0x94df8b352de7f46f64b01d3666bf6e936e44ce60",
    "txId": "0xb5ef8c13b968a406cc62a93a8bd80f9e9a906ef1b3fcf20a2e48573c17659268",   // 提现交易id
    "applyTime": "2019-10-12 11:12:02",  // UTC 时间
    "network": "ETH",
    "transferType": 0, // 1: 站内转账, 0: 站外转账, 只在sAPI提现的记录中返回
    "withdrawOrderId": "WITHDRAWtest123", // 自定义ID, 如果没有则不返回该字段, 只在sAPI提现的记录中返回
    "info": "The address is not valid. Please confirm with the recipient",  // 提币失败原因
    "confirmNo":3,  // 提现确认数, 只在sAPI提现的记录中返回
    "walletType": 1,  //1: 资金钱包 0:现货钱包, 只在sAPI提现的记录中返回
    "txKey": "", //只在sAPI提现的记录中返回
    "questionnaire": "{\'question1\':\'answer1\',\'question2\':\'answer2\'}", // 问卷回答
    "completeTime": "2023-03-23 16:52:41"  // 提现完成，成功下账时间(UTC)
  },
  {
    "id": "156ec387f49b41df8724fa744fa82719",
    "trId": 22334411,
    "amount": "0.00150000",
    "transactionFee": "0.004",
    "coin": "BTC",
    "withdrawalStatus": 6,
    "travelRuleStatus": 0,
    "address": "1FZdVHtiBqMrWdjPyRPULCUceZPJ2WLCsB",
    "txId": "60fd9007ebfddc753455f95fafa808c4302c836e4d1eebc5a132c36c1d8ac354",
    "applyTime": "2019-09-24 12:43:45",
    "network": "BTC",
    "transferType": 0, 
    "info": "",
    "confirmNo": 2,
    "walletType": 1,
    "txKey": "",
    "questionnaire": "{\'question1\':\'answer1\',\'question2\':\'answer2\'}",
    "completeTime": "2023-03-23 16:52:41" 
  }
]
```