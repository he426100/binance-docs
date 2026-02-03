# 查询杠杆账户交易历史 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Trade-List#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询杠杆账户交易历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Trade-List#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/myTrades`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Trade-List#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Trade-List#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                 |
|------------|--------|------|------------------------------------|
| symbol     | STRING | YES  |                                    |
| isIsolated | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE" |
| orderId    | LONG   | NO   |                                    |
| startTime  | LONG   | NO   |                                    |
| endTime    | LONG   | NO   |                                    |
| fromId     | LONG   | NO   | 获取TradeId，默认获取近期交易历史。              |
| limit      | INT    | NO   | 默认 500; 最大 1000.                   |
| recvWindow | LONG   | NO   | 默认值不能大于 `60000`                    |
| timestamp  | LONG   | YES  |                                    |

- 如果设置 fromId , 获取订单 id &gt;= fromId， 否则返回近期24小时内的订单历史。
- startTime和endTime的时间间隔不可超过24小时

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Trade-List#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
	{
		"commission": "0.00006000",
		"commissionAsset": "BTC",
		"id": 34,
		"isBestMatch": true,
		"isBuyer": false,
		"isMaker": false,
		"orderId": 39324,
		"price": "0.02000000",
		"qty": "3.00000000",
		"symbol": "BNBBTC",
		"isIsolated": false,      // 是否是逐仓symbol交易
		"time": 1561973357171
	},
	{
		"commission": "0.00002950",
		"commissionAsset": "BTC",
		"id": 32,
		"isBestMatch": true,
		"isBuyer": false,
		"isMaker": true,
		"orderId": 39319,
		"price": "0.00590000",
		"qty": "5.00000000",
		"symbol": "BNBBTC",
		"isIsolated": false,      // 是否是逐仓symbol交易
		"time": 1561964645345
	}
]
```