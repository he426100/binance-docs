# 查询杠杆账户的所有订单 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询杠杆账户的所有订单

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/allOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**200(IP)**

## 访问限制[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders#%E8%AE%BF%E9%97%AE%E9%99%90%E5%88%B6 "访问限制的直接链接")

**60次/分钟/IP**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                 |
|------------|--------|------|------------------------------------|
| symbol     | STRING | YES  |                                    |
| isIsolated | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE" |
| orderId    | LONG   | NO   |                                    |
| startTime  | LONG   | NO   |                                    |
| endTime    | LONG   | NO   |                                    |
| limit      | INT    | NO   | 默认 500;最大500.                      |
| recvWindow | LONG   | NO   | 赋值不能大于 `60000`                     |
| timestamp  | LONG   | YES  |                                    |

- 如果设置 orderId , 获取订单 &gt;= orderId ， 否则返回24小时内的订单历史。
- 一些历史订单的 cummulativeQuoteQty &lt; 0, 是指当前数据不存在。
- startTime和endTime的时间间隔不可超过24小时

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
      {
          "clientOrderId": "D2KDy4DIeS56PvkM13f8cP",
          "cummulativeQuoteQty": "0.00000000",
          "executedQty": "0.00000000",
          "icebergQty": "0.00000000",
          "isWorking": false,
          "orderId": 41295,
          "origQty": "5.31000000",
          "price": "0.22500000",
          "side": "SELL",
          "status": "CANCELED",
          "stopPrice": "0.18000000",
          "symbol": "BNBBTC",
          "isIsolated": false,       // 是否是逐仓symbol交易 
          "time": 1565769338806,
          "timeInForce": "GTC",
          "type": "TAKE_PROFIT_LIMIT",
          "selfTradePreventionMode": "NONE",
          "updateTime": 1565769342148
      },
      {
          "clientOrderId": "gXYtqhcEAs2Rn9SUD9nRKx",
          "cummulativeQuoteQty": "0.00000000",
          "executedQty": "0.00000000",
          "icebergQty": "1.00000000",
          "isWorking": true,
          "orderId": 41296,
          "origQty": "6.65000000",
          "price": "0.18000000",
          "side": "SELL",
          "status": "CANCELED",
          "stopPrice": "0.00000000",
          "symbol": "BNBBTC",
          "isIsolated": false,       // 是否是逐仓symbol交易 
          "time": 1565769348687,
          "timeInForce": "GTC",
          "type": "LIMIT",
          "selfTradePreventionMode": "NONE",
          "updateTime": 1565769352226
      }

]
```