# 查询订单 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Query-Order#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询订单状态

- 请注意，如果订单满足如下条件，不会被查询到：
  
  - 订单的最终状态为 `CANCELED` 或者 `EXPIRED` **并且** 订单没有任何的成交记录 **并且** 订单生成时间 + 3天 &lt; 当前时间
  - 订单创建时间 + 90天 &lt; 当前时间

## 方式[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Query-Order#%E6%96%B9%E5%BC%8F "方式的直接链接")

`order.status`

## 请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Query-Order#%E8%AF%B7%E6%B1%82 "请求的直接链接")

```javascript
{
    "id": "0ce5d070-a5e5-4ff2-b57f-1556741a4204",
    "method": "order.status",
    "params": {
        "apiKey": "HMOchcfii9ZRZnhjp2XjGXhsOBd6msAhKz9joQaWwZ7arcJTlD2hGPHQj1lGdTjR",
        "orderId": 328999071,
        "symbol": "BTCUSDT",
        "timestamp": 1703441060152,
        "signature": "ba48184fc38a71d03d2b5435bd67c1206e3191e989fe99bda1bc643a880dfdbf"
    }
}
```

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Query-Order#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Query-Order#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                | 类型     | 是否必需 | 描述        |
|-------------------|--------|------|-----------|
| symbol            | STRING | YES  | 交易对       |
| orderId           | LONG   | NO   | 系统订单号     |
| origClientOrderId | STRING | NO   | 用户自定义的订单号 |
| recvWindow        | LONG   | NO   |           |
| timestamp         | LONG   | YES  |           |

注意:

> - 至少需要发送 `orderId` 与 `origClientOrderId`中的一个
> - `orderId`在`symbol`维度是自增的

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Query-Order#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  	"avgPrice": "0.00000",				// 平均成交价
  	"clientOrderId": "abc",				// 用户自定义的订单号
  	"cumQuote": "0",					// 成交金额
  	"executedQty": "0",					// 成交量
  	"orderId": 1573346959,				// 系统订单号
  	"origQty": "0.40",					// 原始委托数量
  	"origType": "TRAILING_STOP_MARKET",	// 触发前订单类型
  	"price": "0",						// 委托价格
  	"reduceOnly": false,				// 是否仅减仓
  	"side": "BUY",						// 买卖方向
  	"positionSide": "SHORT", 			// 持仓方向
  	"status": "NEW",					// 订单状态
  	"stopPrice": "9300",			    // 触发价，对`TRAILING_STOP_MARKET`无效
  	"closePosition": false,             // 是否条件全平仓
  	"symbol": "BTCUSDT",				// 交易对
  	"time": 1579276756075,				// 订单时间
  	"timeInForce": "GTC",				// 有效方法
  	"type": "TRAILING_STOP_MARKET",		// 订单类型
  	"activatePrice": "9020",			// 跟踪止损激活价格, 仅`TRAILING_STOP_MARKET` 订单返回此字段
  	"priceRate": "0.3",					// 跟踪止损回调比例, 仅`TRAILING_STOP_MARKET` 订单返回此字段
  	"updateTime": 1579276756075,		// 更新时间
  	"workingType": "CONTRACT_PRICE",    // 条件价格触发类型
 	"priceProtect": false               // 是否开启条件单触发保护
}
```