# 提币(针对需要旅行规则的本地站)(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

向需要旅行规则的本地站发起提币请求

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/localentity/withdraw/apply`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**600**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                 | 类型      | 是否必需 | 描述                                                                       |
|--------------------|---------|------|--------------------------------------------------------------------------|
| coin               | STRING  | YES  |                                                                          |
| withdrawOrderId    | STRING  | NO   | 客户端内部定义的提币ID.                                                            |
| network            | STRING  | NO   | 提币网络                                                                     |
| address            | STRING  | YES  | 提币地址                                                                     |
| addressTag         | STRING  | NO   | 某些币种例如 XRP,XMR 允许填写次级地址标签                                                |
| amount             | DECIMAL | YES  | 数量                                                                       |
| transactionFeeFlag | BOOLEAN | NO   | 当站内转账时免手续费, `true`: 手续费归资金转入方; `false`: 手续费归资金转出方; . 默认 `false`.         |
| name               | STRING  | NO   | 地址的备注，填写该参数后会加入该币种的提现地址簿。地址簿上限为200，超出后会造成提现失败。地址中的空格需要encode成`%20`       |
| walletType         | INTEGER | NO   | 表示出金使用的钱包，0为现货钱包，1为资金钱包。默认walletType为"充币账户"是您设置在钱包-&gt;现货账户或资金账户-&gt;充值。 |
| recvWindow         | LONG    | NO   |                                                                          |
| timestamp          | LONG    | YES  |                                                                          |
| questionnaire      | STRING  | YES  | JSON 格式的问卷回答。                                                            |

> - 如果没有传入 `network`, 则使用对应币种的默认网络, 如果地址格式不能匹配默认网络, 提币将被拒绝。
> - 网络、默认网络的配置列表可以通过以下接口获取 `Get /sapi/v1/capital/config/getall (HMAC SHA256)`。
> - 每个本地站点的问卷内容都不一样，请参考`提币问卷内容`页。
> - 如果API返回 `Questionnaire format not valid.` 或 `Questionnaire must not be blank` 错误，请尝检查Questionnaire格式并使用 `URL-encoded format`。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "trId": 123456, # Travel Rule记录ID
    "accpted": true, # 提币请求是否被接受
    "info": "Withdraw request accepted" # 提现结果的详细信息
}
```