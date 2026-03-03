# 逐仓保证金变动历史(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Position-Margin-Change-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询逐仓保证金变动历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Position-Margin-Change-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/positionMargin/history`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Position-Margin-Change-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Position-Margin-Change-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                         |
|------------|--------|------|----------------------------|
| symbol     | STRING | YES  | 交易对                        |
| type       | INT    | NO   | 调整方向 1: 增加逐仓保证金，2: 减少逐仓保证金 |
| startTime  | LONG   | NO   | 起始时间                       |
| endTime    | LONG   | NO   | 结束时间，默认为当前时间               |
| limit      | INT    | NO   | 返回的结果集数量 默认值: 500          |
| recvWindow | LONG   | NO   |                            |
| timestamp  | LONG   | YES  |                            |

> - `startTime`与`endTime`间隔不能超过30天
> - 支持查询不超过1个月的合约数据

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Position-Margin-Change-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
	{
	    "symbol": "BTCUSDT", // 交易对
	  	"type": 1, 	// 调整方向
		"deltaType": "USER_ADJUST", // 划转类型
		"amount": "23.36332311", // 数量
	  	"asset": "USDT", // 资产
	  	"time": 1578047897183, // 时间
	  	"positionSide": "BOTH"  // 持仓方向
	},
	{
		"symbol": "BTCUSDT",
	  	"type": 1, 
		"deltaType": "USER_ADJUST",
		"amount": "100",
	  	"asset": "USDT",
	  	"time": 1578047900425,
	  	"positionSide": "LONG" 
	}
]
```