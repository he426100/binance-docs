# 杠杆账户撤销订单 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-Order#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

杠杆账户撤销有效订单。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-Order#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

DELETE /sapi/v1/margin/order

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-Order#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-Order#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                | 类型     | 是否必需 | 描述                                 |
|-------------------|--------|------|------------------------------------|
| symbol            | STRING | YES  |                                    |
| isIsolated        | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE" |
| orderId           | LONG   | NO   |                                    |
| origClientOrderId | STRING | NO   |                                    |
| newClientOrderId  | STRING | NO   | 用于唯一识别此撤销订单，默认自动生成。                |
| recvWindow        | LONG   | NO   | T赋值不能大于 `60000`                    |
| timestamp         | LONG   | YES  |                                    |

- 必须发送 orderId 或 origClientOrderId 其中一个。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-Order#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "symbol": "LTCBTC",
  "orderId": "28",
  "origClientOrderId": "myOrder1",
  "clientOrderId": "cancelMyOrder1",
  "price": "1.00000000",
  "origQty": "10.00000000",
  "executedQty": "8.00000000",
  "cummulativeQuoteQty": "8.00000000",
  "status": "CANCELED",
  "timeInForce": "GTC",
  "type": "LIMIT",
  "side": "SELL",
  "isIsolated": true       // 是否是逐仓symbol交易 
}

```

**常见错误代码：**

- **CANCEL\_REJECTED**
  
  错误提示 {“code”: -2011, “msg”: “Unknown order sent.”} 表示指定的订单（通过 orderId、clientOrderId 或 origClientOrderId）无法在撮合引擎中找到，通常是因为该订单已被完成或取消。建议您通过接口 [GET /sapi/v1/margin/allOrders](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders) 查询所有订单，确认相关订单的当前状态