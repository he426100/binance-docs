# 撤销订单 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Order#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

撤销订单

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Order#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

DELETE `/fapi/v1/order`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Order#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Order#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                | 类型     | 是否必需 | 描述        |
|-------------------|--------|------|-----------|
| symbol            | STRING | YES  | 交易对       |
| orderId           | LONG   | NO   | 系统订单号     |
| origClientOrderId | STRING | NO   | 用户自定义的订单号 |
| recvWindow        | LONG   | NO   |           |
| timestamp         | LONG   | YES  |           |

> - `orderId` 与 `origClientOrderId` 必须至少发送一个

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Order#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
 	"clientOrderId": "myOrder1", // 用户自定义的订单号
 	"cumQty": "0",
 	"cumQuote": "0", // 成交金额
 	"executedQty": "0", // 成交量
 	"orderId": 283194212, // 系统订单号
 	"origQty": "11", // 原始委托数量
 	"price": "0", // 委托价格
  	"avgPrice": "0.00",
	"reduceOnly": false, // 仅减仓
	"side": "BUY", // 买卖方向
	"positionSide": "SHORT", // 持仓方向
 	"status": "CANCELED", // 订单状态
 	"stopPrice": "9300", // 触发价，对`TRAILING_STOP_MARKET`无效
 	"closePosition": false,   // 是否条件全平仓
 	"symbol": "BTCUSDT", // 交易对
 	"timeInForce": "GTC", // 有效方法
 	"origType": "TRAILING_STOP_MARKET",	// 触发前订单类型
 	"type": "TRAILING_STOP_MARKET", // 订单类型
 	"activatePrice": "9020", // 跟踪止损激活价格, 仅`TRAILING_STOP_MARKET` 订单返回此字段
  	"priceRate": "0.3",	// 跟踪止损回调比例, 仅`TRAILING_STOP_MARKET` 订单返回此字段
 	"updateTime": 1571110484038, // 更新时间
 	"workingType": "CONTRACT_PRICE", // 条件价格触发类型
 	"priceProtect": false,            // 是否开启条件单触发保护
  	"priceMatch": "NONE",              //盘口价格下单模式
  	"selfTradePreventionMode": "NONE", //订单自成交保护模式
  	"goodTillDate": 0      //订单TIF为GTD时的自动取消时间
}
```