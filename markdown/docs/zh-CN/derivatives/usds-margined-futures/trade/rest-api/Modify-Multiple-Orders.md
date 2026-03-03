# 批量修改订单(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Multiple-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

批量修改订单

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Multiple-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

PUT `/fapi/v1/batchOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Multiple-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

10s order rate limit(X-MBX-ORDER-COUNT-10S)为5; 1min order rate limit(X-MBX-ORDER-COUNT-1M)为1; IP rate limit(x-mbx-used-weight-1m)为5;

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Multiple-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称          | 类型               | 是否必需 | 描述            |
|-------------|------------------|------|---------------|
| batchOrders | list&lt;JSON&gt; | YES  | 订单列表,最多支持5个订单 |
| recvWindow  | LONG             | NO   |               |
| timestamp   | LONG             | YES  |               |

**其中`batchOrders`应以list of JSON格式填写订单参数**

| 名称                | 类型      | 是否必需 | 描述                                                                                                            |
|-------------------|---------|------|---------------------------------------------------------------------------------------------------------------|
| orderId           | LONG    | NO   | 系统订单号，orderId 与 origClientOrderId 至少要传一个                                                                      |
| origClientOrderId | STRING  | NO   | 用户自定义的订单号，orderId 与 origClientOrderId 至少要传一个                                                                  |
| symbol            | STRING  | YES  | 交易对                                                                                                           |
| side              | ENUM    | YES  | 买卖方向 `SELL`, `BUY`                                                                                            |
| quantity          | DECIMAL | YES  | 下单数量,使用`closePosition`不支持此参数。                                                                                 |
| price             | DECIMAL | YES  | 委托价格                                                                                                          |
| priceMatch        | ENUM    | NO   | `OPPONENT`/ `OPPONENT_5`/ `OPPONENT_10`/ `OPPONENT_20`/`QUEUE`/ `QUEUE_5`/ `QUEUE_10`/ `QUEUE_20`；不能与price同时传 |
| stopPrice         | DECIMAL | NO   | 触发价, 仅 `STOP`, `STOP_MARKET`, `TAKE_PROFIT`, `TAKE_PROFIT_MARKET` 需要此参数                                       |
| recvWindow        | LONG    | NO   |                                                                                                               |
| timestamp         | LONG    | YES  |                                                                                                               |

> - 具体订单条件规则,与普通修改订单一致
> - 批量修改订单采取并发处理,不保证订单撮合顺序
> - 批量修改订单的返回内容顺序,与订单列表顺序一致
> - 同一订单修改次数最多10000次

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Multiple-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
	{
		"orderId": 20072994037,
		"symbol": "BTCUSDT",
		"pair": "BTCUSDT",
		"status": "NEW",
		"clientOrderId": "LJ9R4QZDihCaS8UAOOLpgW",
		"price": "30005",
		"avgPrice": "0.0",
		"origQty": "1",
		"executedQty": "0",
		"cumQty": "0",
		"cumBase": "0",
		"timeInForce": "GTC",
		"type": "LIMIT",
		"reduceOnly": false,
		"closePosition": false,
		"side": "BUY",
		"positionSide": "LONG",
		"stopPrice": "0",
		"workingType": "CONTRACT_PRICE",
		"priceProtect": false,
		"origType": "LIMIT",
        "priceMatch": "NONE",              //盘口价格下单模式
        "selfTradePreventionMode": "NONE", //订单自成交保护模式
        "goodTillDate": 0,                 //订单TIF为GTD时的自动取消时间
		"updateTime": 1629182711600
	},
	{
		"code": -2022, 
		"msg": "ReduceOnly Order is rejected."
	}
]
```