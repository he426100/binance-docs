# 查询杠杆账户 OCO 挂单 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-OCO#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询杠杆账户 OCO 挂单

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-OCO#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/openOrderList`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-OCO#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-OCO#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                 |
|------------|--------|------|------------------------------------|
| isIsolated | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE" |
| symbol     | STRING | NO   | 逐仓杠杆必填，全仓杠杆不支持该参数                  |
| recvWindow | LONG   | NO   | 赋值不能大于 `60000`                     |
| timestamp  | LONG   | YES  |                                    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-OCO#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "orderListId": 31,
    "contingencyType": "OCO",
    "listStatusType": "EXEC_STARTED",
    "listOrderStatus": "EXECUTING",
    "listClientOrderId": "wuB13fmulKj3YjdqWEcsnp",
    "transactionTime": 1565246080644,
    "symbol": "LTCBTC",
    "isIsolated": true,       // 是否是逐仓symbol交易 
    "orders": [
      {
        "symbol": "LTCBTC",
        "orderId": 4,
        "clientOrderId": "r3EH2N76dHfLoSZWIUw1bT"
      },
      {
        "symbol": "LTCBTC",
        "orderId": 5,
        "clientOrderId": "Cv1SnyPD3qhqpbjpYEHbd2"
      }
    ]
  }
]
```