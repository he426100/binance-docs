# 查询杠杆账户 OCO (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-OCO#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

根据提供的可选参数检索特定的杠杆账户 OCO 订单。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-OCO#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/orderList`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-OCO#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-OCO#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                | 类型     | 是否必需 | 描述                                          |
|-------------------|--------|------|---------------------------------------------|
| isIsolated        | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE"          |
| symbol            | STRING | NO   | 逐仓杠杆必填，全仓杠杆不支持该参数                           |
| orderListId       | LONG   | NO   | `orderListId` 或 `origClientOrderId` 必须提供一个。 |
| origClientOrderId | STRING | NO   | `orderListId` 或 `origClientOrderId` 必须提供一个。 |
| recvWindow        | LONG   | NO   | 赋值不得大于 `60000`                              |
| timestamp         | LONG   | YES  |                                             |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-OCO#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "orderListId": 27,
    "contingencyType": "OCO",
    "listStatusType": "EXEC_STARTED",
    "listOrderStatus": "EXECUTING",
    "listClientOrderId": "h2USkA5YQpaXHPIrkd96xE",
    "transactionTime": 1565245656253,
    "symbol": "LTCBTC",
    "isIsolated": true,       // 是否是逐仓symbol交易 
    "orders": [
        {
            "symbol": "LTCBTC",
            "orderId": 4,
            "clientOrderId": "qD1gy3kc3Gx0rihm9Y3xwS"
        },
        {
            "symbol": "LTCBTC",
            "orderId": 5,
            "clientOrderId": "ARzZ9I00CPM8i3NhmU9Ega"
        }
    ]
}
```