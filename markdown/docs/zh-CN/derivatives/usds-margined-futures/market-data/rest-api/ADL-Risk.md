# 自动减仓风险评级

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/ADL-Risk#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询symbol级别的 ADL 风险评级。 ADL 风险评级用于衡量在发生强平时触发 ADL 的可能性，该评级会综合考虑该symbol的保险基金余额、仓位集中度、盘口深度、价格波动率、平均杠杆水平、未实现盈亏以及保证金利用率。 风险等级分为高、中、低，每半小时更新一次。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/ADL-Risk#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/symbolAdlRisk`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/ADL-Risk#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/ADL-Risk#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | NO   | 交易对 |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/ADL-Risk#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **响应:**

```javascript
{
	"symbol": "BTCUSDT",
	"adlRisk": "low",  // 自动减仓风险评级
	"updateTime": 1597370495002
}
```

> **当不指定symbol时相应**

```javascript
[
	{
	    "symbol": "BTCUSDT",
	    "adlRisk": "low",  // 自动减仓风险评级
	    "updateTime": 1597370495002
	},
	{
	    "symbol": "ETHUSDT",
	    "adlRisk": "high", // 自动减仓风险评级
	    "updateTime": 1597370495004
	}
]
```