# 取消杠杆账户 OCO 订单(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-OCO#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

取消杠杆账户订单列表。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-OCO#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

DELETE /sapi/v1/margin/orderList

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-OCO#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-OCO#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                | 类型     | 是否必需 | 描述                                           |
|-------------------|--------|------|----------------------------------------------|
| symbol            | STRING | YES  |                                              |
| isIsolated        | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE"           |
| orderListId       | LONG   | NO   | `orderListId` 或 `listClientOrderId` 必须被提供    |
| listClientOrderId | STRING | NO   | `orderListId` 或 `listClientOrderId` 必须被提供    |
| newClientOrderId  | STRING | NO   | 用户自定义的本次撤销操作的ID(注意不是被撤销的订单的自定义ID)。如无指定会自动赋值。 |
| recvWindow        | LONG   | NO   | 不能大于 `60000`                                 |
| timestamp         | LONG   | YES  |                                              |

其他注意点:

- 取消单个 leg 将取消整个 OCO 订单。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-OCO#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "orderListId": 0,
  "contingencyType": "OCO",
  "listStatusType": "ALL_DONE",
  "listOrderStatus": "ALL_DONE",
  "listClientOrderId": "C3wyj4WVEktd7u9aVBRXcN",
  "transactionTime": 1574040868128,
  "symbol": "LTCBTC",
  "isIsolated": false,       // 是否是逐仓symbol交易 
  "orders": [
    {
      "symbol": "LTCBTC",
      "orderId": 2,
      "clientOrderId": "pO9ufTiFGg3nw2fOdgeOXa"
    },
    {
      "symbol": "LTCBTC",
      "orderId": 3,
      "clientOrderId": "TXOvglzXuaubXAaENpaRCB"
    }
  ],
  "orderReports": [
    {
      "symbol": "LTCBTC",
      "origClientOrderId": "pO9ufTiFGg3nw2fOdgeOXa",
      "orderId": 2,
      "orderListId": 0,
      "clientOrderId": "unfWT8ig8i0uj6lPuYLez6",
      "price": "1.00000000",
      "origQty": "10.00000000",
      "executedQty": "0.00000000",
      "cummulativeQuoteQty": "0.00000000",
      "status": "CANCELED",
      "timeInForce": "GTC",
      "type": "STOP_LOSS_LIMIT",
      "side": "SELL",
      "stopPrice": "1.00000000",
      "selfTradePreventionMode": "NONE"
    },
    {
      "symbol": "LTCBTC",
      "origClientOrderId": "TXOvglzXuaubXAaENpaRCB",
      "orderId": 3,
      "orderListId": 0,
      "clientOrderId": "unfWT8ig8i0uj6lPuYLez6",
      "price": "3.00000000",
      "origQty": "10.00000000",
      "executedQty": "0.00000000",
      "cummulativeQuoteQty": "0.00000000",
      "status": "CANCELED",
      "timeInForce": "GTC",
      "type": "LIMIT_MAKER",
      "side": "SELL",
      "selfTradePreventionMode": "NONE"
    }
  ]
}
```