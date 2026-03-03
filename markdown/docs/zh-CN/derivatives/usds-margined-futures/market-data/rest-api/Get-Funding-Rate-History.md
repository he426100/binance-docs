# 查询资金费率历史

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询资金费率历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/fundingRate`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

和GET /fapi/v1/fundingInfo共享500/5min/IP

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称        | 类型     | 是否必需 | 描述               |
|-----------|--------|------|------------------|
| symbol    | STRING | NO   | 交易对              |
| startTime | LONG   | NO   | 起始时间             |
| endTime   | LONG   | NO   | 结束时间             |
| limit     | INT    | NO   | 默认值:100 最大值:1000 |

> - 如果 `startTime` 和 `endTime` 都未发送, 返回最近200条数据.
> - 如果 `startTime` 和 `endTime` 之间的数据量大于 `limit`, 返回 `startTime` + `limit`情况下的数据。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Get-Funding-Rate-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
	{
    	"symbol": "BTCUSDT",			// 交易对
    	"fundingRate": "-0.03750000",	// 资金费率
    	"fundingTime": 1570608000000,	// 资金费时间
        "markPrice": "34287.54619963"   // 资金费对应标记价格
	},
	{
   		"symbol": "BTCUSDT",
    	"fundingRate": "0.00010000",
    	"fundingTime": 1570636800000,
        "markPrice": "34287.54619963"   // 资金费对应标记价格
	}
]
```