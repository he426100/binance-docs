# 最新标记价格和资金费率

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Mark-Price#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

采集各大交易所数据加权平均

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Mark-Price#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/premiumIndex`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Mark-Price#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

带symbol **1**, 不带symbol **10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Mark-Price#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | NO   | 交易对 |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Mark-Price#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **响应:**

```javascript
{
    "symbol": "BTCUSDT",				// 交易对
    "markPrice": "11793.63104562",		// 标记价格
    "indexPrice": "11781.80495970",		// 指数价格
    "estimatedSettlePrice": "11781.16138815",  // 预估结算价,仅在交割开始前最后一小时有意义
    "lastFundingRate": "0.00038246",	// 最近更新的资金费率
    "interestRate": "0.00010000",		// 标的资产基础利率
    "nextFundingTime": 1597392000000,	// 下次资金费时间
    "time": 1597370495002				// 更新时间
}
```

> **当不指定symbol时相应**

```javascript
[
	{
    	"symbol": "BTCUSDT",			// 交易对
    	"markPrice": "11793.63104562",	// 标记价格
    	"indexPrice": "11781.80495970",	// 指数价格
    	"estimatedSettlePrice": "11781.16138815",  // 预估结算价,仅在交割开始前最后一小时有意义
    	"lastFundingRate": "0.00038246",	// 最近更新的资金费率
    	"interestRate": "0.00010000",		// 标的资产基础利率
    	"nextFundingTime": 1597392000000,	// 下次资金费时间
    	"time": 1597370495002				// 更新时间
	}
]
```