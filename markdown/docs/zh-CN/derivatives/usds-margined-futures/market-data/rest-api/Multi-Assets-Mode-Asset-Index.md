# 多资产模式资产汇率指数

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Multi-Assets-Mode-Asset-Index#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

多资产模式资产汇率指数

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Multi-Assets-Mode-Asset-Index#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/assetIndex`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Multi-Assets-Mode-Asset-Index#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1** for a single symbol; **10** when the symbol parameter is omitted

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Multi-Assets-Mode-Asset-Index#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| Name   | Type   | Mandatory | Description |
|--------|--------|-----------|-------------|
| symbol | STRING | NO        | Asset pair  |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Multi-Assets-Mode-Asset-Index#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"symbol": "ADAUSD",
	"time": 1635740268004,
	"index": "1.92957370",
	"bidBuffer": "0.10000000", 
	"askBuffer": "0.10000000", 
	"bidRate": "1.73661633",
	"askRate": "2.12253107",
	"autoExchangeBidBuffer": "0.05000000",
	"autoExchangeAskBuffer": "0.05000000",
	"autoExchangeBidRate": "1.83309501",
	"autoExchangeAskRate": "2.02605238"
}
```

> 或(当不发送交易对信息)

```javascript
[
	{
		"symbol": "ADAUSD",
		"time": 1635740268004,
		"index": "1.92957370",
		"bidBuffer": "0.10000000", 
		"askBuffer": "0.10000000", 
		"bidRate": "1.73661633",
		"askRate": "2.12253107",
		"autoExchangeBidBuffer": "0.05000000",
		"autoExchangeAskBuffer": "0.05000000",
		"autoExchangeBidRate": "1.83309501",
		"autoExchangeAskRate": "2.02605238"
	}
]
```