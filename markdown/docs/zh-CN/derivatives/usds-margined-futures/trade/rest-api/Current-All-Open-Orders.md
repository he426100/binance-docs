# 查看当前全部挂单 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Open-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查看当前全部挂单

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Open-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/openOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Open-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

- 带symbol ***1***
- 不带 ***40*** 请小心使用不带symbol参数的调用

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Open-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述  |
|------------|--------|------|-----|
| symbol     | STRING | NO   | 交易对 |
| recvWindow | LONG   | NO   |     |
| timestamp  | LONG   | YES  |     |

> - 不带symbol参数，会返回所有交易对的挂单

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Current-All-Open-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
  	"avgPrice": "0.00000",				// 平均成交价
  	"clientOrderId": "abc",				// 用户自定义的订单号
  	"cumQuote": "0",						// 成交金额
  	"executedQty": "0",					// 成交量
  	"orderId": 1917641,					// 系统订单号
  	"origQty": "0.40",					// 原始委托数量
  	"origType": "TRAILING_STOP_MARKET",	// 触发前订单类型
  	"price": "0",					// 委托价格
  	"reduceOnly": false,				// 是否仅减仓
  	"side": "BUY",						// 买卖方向
  	"positionSide": "SHORT", // 持仓方向
  	"status": "NEW",					// 订单状态
  	"stopPrice": "9300",					// 触发价，对`TRAILING_STOP_MARKET`无效
  	"closePosition": false,   // 是否条件全平仓
  	"symbol": "BTCUSDT",				// 交易对
  	"time": 1579276756075,				// 订单时间
  	"timeInForce": "GTC",				// 有效方法
  	"type": "TRAILING_STOP_MARKET",		// 订单类型
  	"activatePrice": "9020", // 跟踪止损激活价格, 仅`TRAILING_STOP_MARKET` 订单返回此字段
  	"priceRate": "0.3",	// 跟踪止损回调比例, 仅`TRAILING_STOP_MARKET` 订单返回此字段
  	"updateTime": 1579276756075,		// 更新时间
  	"workingType": "CONTRACT_PRICE", // 条件价格触发类型
 	"priceProtect": false,           // 是否开启条件单触发保护
	"priceMatch": "NONE",              //price match mode
    "selfTradePreventionMode": "NONE", //self trading preventation mode
    "goodTillDate": 0      //order pre-set auot cancel time for TIF GTD order
  }
]
```