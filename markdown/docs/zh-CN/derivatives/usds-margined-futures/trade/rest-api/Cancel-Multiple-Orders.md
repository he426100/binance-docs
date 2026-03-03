# 批量撤销订单(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Multiple-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

批量撤销订单 (TRADE)

## HTTP Request[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Multiple-Orders#http-request "HTTP Request的直接链接")

DELETE `/fapi/v1/batchOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Multiple-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Multiple-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

名称类型是否必需描述

symbolSTRINGYES交易对

orderIdListLIST&lt;LONG&gt;NO系统订单号, 最多支持10个订单

比如`[1234567,2345678]`

origClientOrderIdListLIST&lt;STRING&gt;NO用户自定义的订单号, 最多支持10个订单

比如`["my_id_1","my_id_2"]` 需要encode双引号。逗号后面没有空格。

recvWindowLONGNO

timestampLONGYES

> - `orderIdList` 与 `origClientOrderIdList` 必须至少发送一个，不可同时发送

## Response Example[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Multiple-Orders#response-example "Response Example的直接链接")

```javascript
[
	{
	 	"clientOrderId": "myOrder1", // 用户自定义的订单号
	 	"cumQty": "0",
	 	"cumQuote": "0", // 成交金额
	 	"executedQty": "0", // 成交量
	 	"orderId": 283194212, // 系统订单号
	 	"origQty": "11", // 原始委托数量
	 	"price": "0", // 委托价格
		"reduceOnly": false, // 仅减仓
		"side": "BUY", // 买卖方向
		"positionSide": "SHORT", // 持仓方向
	 	"status": "CANCELED", // 订单状态
	 	"stopPrice": "9300", // 触发价，对`TRAILING_STOP_MARKET`无效
	 	"closePosition": false,   // 是否条件全平仓
	 	"symbol": "BTCUSDT", // 交易对
	 	"timeInForce": "GTC", // 有效方法
	 	"origType": "TRAILING_STOP_MARKET", // 触发前订单类型
 		"type": "TRAILING_STOP_MARKET", // 订单类型
	 	"activatePrice": "9020", // 跟踪止损激活价格, 仅`TRAILING_STOP_MARKET` 订单返回此字段
  		"priceRate": "0.3",	// 跟踪止损回调比例, 仅`TRAILING_STOP_MARKET` 订单返回此字段
	 	"updateTime": 1571110484038, // 更新时间
	 	"workingType": "CONTRACT_PRICE", // 条件价格触发类型
	 	"priceProtect": false            // 是否开启条件单触发保护
	 	"priceMatch": "NONE",              //盘口价格下单模式
	 	"selfTradePreventionMode": "NONE", //订单自成交保护模式
 		"goodTillDate": 0      //订单TIF为GTD时的自动取消时间
	},
	{
		"code": -2011,
		"msg": "Unknown order sent."
	}
]
```