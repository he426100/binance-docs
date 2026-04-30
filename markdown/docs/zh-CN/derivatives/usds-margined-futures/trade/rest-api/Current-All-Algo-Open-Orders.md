# 查看当前全部条件挂单 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Algo-Open-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查看某个交易对下当前所有的条件挂单（Algo / Conditional Order），包括 U 本位合约的止盈止损（TP/SL, Take Profit / Stop Loss）与追踪止损（Trailing Stop）订单。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Algo-Open-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/openAlgoOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Algo-Open-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

- 带symbol ***1***
- 不带 ***40*** 请小心使用不带symbol参数的调用

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Algo-Open-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述 |
|------------|--------|------|----|
| algoType   | STRING | NO   |    |
| symbol     | STRING | NO   |    |
| algoId     | LONG   | NO   |    |
| recvWindow | LONG   | NO   |    |
| timestamp  | LONG   | YES  |    |

> - 不带symbol参数，会返回所有交易对的挂单

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Algo-Open-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
   {
       "algoId": 2148627,
       "clientAlgoId": "MRumok0dkhrP4kCm12AHaB",
       "algoType": "CONDITIONAL",
       "orderType": "TAKE_PROFIT",
       "symbol": "BNBUSDT",
       "side": "SELL",
       "positionSide": "BOTH",
       "timeInForce": "GTC",
       "quantity": "0.01",
       "algoStatus": "NEW",
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
       "createTime": 1750514941540,
       "updateTime": 1750514941540,
       "triggerTime": 0,
       "goodTillDate": 0
   }
]
```