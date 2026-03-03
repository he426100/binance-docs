# 持仓ADL队列估算(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-ADL-Quantile-Estimation#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

持仓ADL队列估算

> - 每30秒更新数据
> - 队列分数0，1，2，3，4，分数越高说明在ADL队列中的位置越靠前
> - 对于单向持仓模式或者是逐仓状态下的双向持仓模式的交易对，会返回 "LONG", "SHORT" 和 "BOTH" 分别表示不同持仓方向上持仓的adl队列分数
> - 对于全仓状态下的双向持仓模式的交易对，会返回 "LONG", "SHORT" 和 "HEDGE", 其中"HEDGE"的存在仅作为标记;其中如果多空均有持仓的情况下,"LONG"和"SHORT"返回共同计算后相同的队列分数。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-ADL-Quantile-Estimation#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/adlQuantile`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-ADL-Quantile-Estimation#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-ADL-Quantile-Estimation#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述 |
|------------|--------|------|----|
| symbol     | STRING | NO   |    |
| recvWindow | LONG   | NO   |    |
| timestamp  | LONG   | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-ADL-Quantile-Estimation#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
	{
		"symbol": "ETHUSDT", 
		"adlQuantile": 
			{
				// 对于全仓状态下的双向持仓模式的交易对，会返回 "LONG", "SHORT" 和 "HEDGE", 其中"HEDGE"的存在仅作为标记;如果多空均有持仓的情况下,"LONG"和"SHORT"应返回共同计算后相同的队列分数。
				"LONG": 3,  
				"SHORT": 3, 
				"HEDGE": 0   // HEDGE 仅作为指示出现，请忽略数值
			}
		},
 	{
 		"symbol": "BTCUSDT", 
 		"adlQuantile": 
 			{
 				// 对于单向持仓模式或者是逐仓状态下的双向持仓模式的交易对，会返回 "LONG", "SHORT" 和 "BOTH" 分别表示不同持仓方向上持仓的adl队列分数
 				"LONG": 1, 	// 双开模式下多头持仓的ADL队列估算分
 				"SHORT": 2, 	// 双开模式下空头持仓的ADL队列估算分
 				"BOTH": 0		// 单开模式下持仓的ADL队列估算分
 			}
 	}
 ]
```