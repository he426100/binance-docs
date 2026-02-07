# 一键上账(充值到过期地址)(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/capital/one-click-arrival-deposite-apply#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

申请充值到过期地址的一键上账.

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/capital/one-click-arrival-deposite-apply#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/capital/deposit/credit-apply`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/capital/one-click-arrival-deposite-apply#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/capital/one-click-arrival-deposite-apply#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称           | 类型     | 是否必需 | 描述                      |
|--------------|--------|------|-------------------------|
| depositId    | LONG   | NO   | 充值记录Id，优先使用             |
| txId         | STRING | NO   | 充值txId，当depositId没指定时使用 |
| subAccountId | LONG   | NO   | Cloud的子账户ID             |
| subUserId    | LONG   | NO   | 母账户的子账户userId           |

> - 参数应在POST BODY

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/capital/one-click-arrival-deposite-apply#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "code": "000000",
    "message": "success",
    "data":true,
    "success": true
}
```