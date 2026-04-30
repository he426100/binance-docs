# 查询所有条件订单(包括历史订单) (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Query-All-Algo-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询所有条件订单（Algo / Conditional Order），包括活跃、已撤销、已触发与已完成订单，覆盖 U 本位合约的止盈止损（TP/SL, Take Profit / Stop Loss）与追踪止损（Trailing Stop）。

- 请注意，如果订单满足如下条件，不会被查询到：
  
  - 订单的最终状态为 `CANCELED` 或者 `EXPIRED` **并且** 订单没有任何的成交记录 **并且** 订单生成时间 + 3天 &lt; 当前时间
  - 订单创建时间 + 90天 &lt; 当前时间

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Query-All-Algo-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/allAlgoOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Query-All-Algo-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Query-All-Algo-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                          |
|------------|--------|------|-----------------------------|
| symbol     | STRING | YES  |                             |
| algoId     | LONG   | NO   | 只返回此orderID及之后的订单，缺省返回最近的订单 |
| startTime  | LONG   | NO   |                             |
| endTime    | LONG   | NO   |                             |
| limit      | INT    | NO   | 返回的结果集数量 默认值:500 最大值:1000   |
| recvWindow | LONG   | NO   |                             |
| timestamp  | LONG   | YES  |                             |

> - 查询时间范围最大不得超过7天
> - 默认查询最近7天内的数据

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Query-All-Algo-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
   {
       "algoId": 2146760,
       "clientAlgoId": "6B2I9XVcJpCjqPAJ4YoFX7",
       "algoType": "CONDITIONAL",
       "orderType": "TAKE_PROFIT",
       "symbol": "BNBUSDT",
       "side": "SELL",
       "positionSide": "BOTH",
       "timeInForce": "GTC",
       "quantity": "0.01",
       "algoStatus": "CANCELED",
       "actualOrderId": "",
       "actualPrice": "0.00000",
       "triggerPrice": "750.000",
       "price": "750.000",
       "icebergQuantity": null,
       "tpTriggerPrice": "0.000",
       "tpPrice": "0.000",
       "slTriggerPrice": "0.000",
       "slPrice": "0.000",
       "tpOrderType": "",
       "selfTradePreventionMode": "EXPIRE_MAKER",
       "workingType": "CONTRACT_PRICE",
       "priceMatch": "NONE",
       "closePosition": false,
       "priceProtect": false,
       "reduceOnly": false,
       "createTime": 1750485492076,
       "updateTime": 1750514545091,
       "triggerTime": 0,
       "goodTillDate": 0
   }
]
```