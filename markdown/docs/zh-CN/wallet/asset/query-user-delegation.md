# 查询用户委托资金历史(适用主账户)(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-delegation#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询用户委托资金历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-delegation#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/asset/custody/transfer-history`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-delegation#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**60**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-delegation#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型      | 是否必需 | 描述                  |
|------------|---------|------|---------------------|
| email      | STRING  | YES  |                     |
| startTime  | LONG    | YES  |                     |
| endTime    | LONG    | YES  |                     |
| type       | ENUM    | NO   | Delegate/Undelegate |
| asset      | STRING  | NO   |                     |
| current    | INTEGER | NO   | 默认 1                |
| size       | INTEGER | NO   | 默认 10, 最大 100       |
| recvWindow | LONG    | NO   |                     |
| timestamp  | LONG    | YES  |                     |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/query-user-delegation#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "total": 3316,
    "rows": [
      {
        "clientTranId": "293915932290879488",
        "transferType": "Undelegate",
        "asset": "ETH",
        "amount": "1",
        "time": 1695205406000
      }, 
      {
        "clientTranId": "293915892281413632",
        "transferType": "Delegate",
        "asset": "ETH",
        "amount": "1",
        "time": 1695205396000
      }
    ]
}
```