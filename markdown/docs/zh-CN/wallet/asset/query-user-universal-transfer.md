# 查询用户万向划转历史(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-universal-transfer#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询用户万向划转历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-universal-transfer#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/asset/transfer`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-universal-transfer#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-universal-transfer#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述            |
|------------|--------|------|---------------|
| type       | ENUM   | YES  |               |
| startTime  | LONG   | NO   |               |
| endTime    | LONG   | NO   |               |
| current    | INT    | NO   | 默认 1          |
| size       | INT    | NO   | 默认 10, 最大 100 |
| fromSymbol | STRING | NO   |               |
| toSymbol   | STRING | NO   |               |
| recvWindow | LONG   | NO   |               |
| timestamp  | LONG   | YES  |               |

> - `fromSymbol` 必须要发送，当类型为 ISOLATEDMARGIN\_MARGIN 和 ISOLATEDMARGIN\_ISOLATEDMARGIN
> - `toSymbol` 必须要发送，当类型为 MARGIN\_ISOLATEDMARGIN 和 ISOLATEDMARGIN\_ISOLATEDMARGIN
> - 仅支持查询最近半年（6个月）数据
> - 若`startTime`和`endTime`没传，则默认返回最近7天数据

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-universal-transfer#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "total":2,
    "rows":[
        {
            "asset":"USDT",
            "amount":"1",
            "type":"MAIN_UMFUTURE"
            "status": "CONFIRMED", // status: CONFIRMED / FAILED / PENDING
            "tranId": 11415955596,
            "timestamp":1544433328000
        },
        {
            "asset":"USDT",
            "amount":"2",
            "type":"MAIN_UMFUTURE",
            "status": "CONFIRMED",
            "tranId": 11366865406,
            "timestamp":1544433328000
        }
    ]
}
```