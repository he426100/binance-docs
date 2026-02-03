# 查询杠杆账户订单 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Order#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询杠杆账户订单

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Order#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/order`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Order#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Order#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                | 类型     | 是否必需 | 描述                                 |
|-------------------|--------|------|------------------------------------|
| symbol            | STRING | YES  |                                    |
| isIsolated        | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE" |
| orderId           | LONG   | NO   |                                    |
| origClientOrderId | STRING | NO   |                                    |
| recvWindow        | LONG   | NO   | 赋值不能大于 `60000`                     |
| timestamp         | LONG   | YES  |                                    |

- 必须发送 orderId 或 origClientOrderId 其中一个。
- 一些历史订单的 cummulativeQuoteQty &lt; 0, 是指当前数据不存在。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Order#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
   "clientOrderId": "ZwfQzuDIGpceVhKW5DvCmO",
   "cummulativeQuoteQty": "0.00000000",
   "executedQty": "0.00000000",
   "icebergQty": "0.00000000",
   "isWorking": true,
   "orderId": 213205622,
   "origQty": "0.30000000",
   "price": "0.00493630",
   "side": "SELL",
   "status": "NEW",
   "stopPrice": "0.00000000",
   "symbol": "BNBBTC",
   "isIsolated": true,
   "time": 1562133008725,
   "timeInForce": "GTC",
   "type": "LIMIT",
   "selfTradePreventionMode": "NONE",
   "updateTime": 1562133008725
}
```