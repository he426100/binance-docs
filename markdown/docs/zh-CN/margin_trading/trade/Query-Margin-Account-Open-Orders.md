# 查询杠杆账户挂单记录 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询杠杆账户挂单记录

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/openOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                 |
|------------|--------|------|------------------------------------|
| symbol     | STRING | NO   |                                    |
| isIsolated | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE" |
| recvWindow | LONG   | NO   | 赋值不能大于 `60000`                     |
| timestamp  | LONG   | YES  |                                    |

- 如未发送symbol，返回所有 symbols 订单记录。
- 当返回所有symbols时，针对限速器计数的请求数量等于当前在交易所交易的symbols数量。
- 如果 isIsolated = "TRUE", symbol 为必填

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
   {
       "clientOrderId": "qhcZw71gAkCCTv0t0k8LUK",
       "cummulativeQuoteQty": "0.00000000",
       "executedQty": "0.00000000",
       "icebergQty": "0.00000000",
       "isWorking": true,
       "orderId": 211842552,
       "origQty": "0.30000000",
       "price": "0.00475010",
       "side": "SELL",
       "status": "NEW",
       "stopPrice": "0.00000000",
       "symbol": "BNBBTC",
       "isIsolated": true,       // 是否是逐仓symbol交易
       "time": 1562040170089,
       "timeInForce": "GTC",
       "type": "LIMIT",
       "selfTradePreventionMode": "NONE",
       "updateTime": 1562040170089
	}
]
```