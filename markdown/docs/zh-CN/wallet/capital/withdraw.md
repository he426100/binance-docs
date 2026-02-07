# 提币(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/capital/withdraw#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

提币

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/capital/withdraw#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/capital/withdraw/apply`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/wallet/capital/withdraw#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**900**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/capital/withdraw#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                 | 类型      | 是否必需 | 描述                                                                       |
|--------------------|---------|------|--------------------------------------------------------------------------|
| coin               | STRING  | YES  |                                                                          |
| withdrawOrderId    | STRING  | NO   | 用户自定义提币ID, 后续可以在GET `/sapi/v1/capital/withdraw/history` 中使用这个字段进行查询      |
| network            | STRING  | NO   | 提币网络                                                                     |
| address            | STRING  | YES  | 提币地址                                                                     |
| addressTag         | STRING  | NO   | 某些币种例如 XRP,XMR 允许填写次级地址标签                                                |
| amount             | DECIMAL | YES  | 数量                                                                       |
| transactionFeeFlag | BOOLEAN | NO   | 当站内转账时免手续费, `true`: 手续费归资金转入方; `false`: 手续费归资金转出方; . 默认 `false`.         |
| name               | STRING  | NO   | 地址的备注，填写该参数后会加入该币种的提现地址簿。地址簿上限为200，超出后会造成提现失败。地址中的空格需要encode成`%20`       |
| walletType         | INTEGER | NO   | 表示出金使用的钱包，0为现货钱包，1为资金钱包。默认walletType为"充币账户"是您设置在钱包-&gt;现货账户或资金账户-&gt;充值。 |
| recvWindow         | LONG    | NO   |                                                                          |
| timestamp          | LONG    | YES  |                                                                          |

> - 如果`network`未发送，则返回该币种的默认网络。
> - 您可以在`Get /sapi/v1/capital/config/getall (HMAC SHA256)`的响应中，获取某个币种的`networkList`中的`network`和`isDefault`。
> - 要检查是否需要遵守旅行规则，可以使用接口 `GET /sapi/v1/localentity/questionnaire-requirements`，如果返回结果不是 NIL，则需要使用更新后的 SAPI 接口 `POST /sapi/v1/localentity/withdraw/apply`；否则，可以继续使用 `POST /sapi/v1/capital/withdraw/apply`。请注意，如果需要遵守旅行规则，请参考旅行规则相关的 SAPI 文档。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/capital/withdraw#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "id":"7213fea8e94b4a5593d507237e5a555b"
}
```