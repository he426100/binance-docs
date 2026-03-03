# 综合指数交易对信息

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Composite-Index-Symbol-Information#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取交易对为综合指数的基础成分信息。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Composite-Index-Symbol-Information#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/indexInfo`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Composite-Index-Symbol-Information#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Composite-Index-Symbol-Information#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述 |
|--------|--------|------|----|
| symbol | STRING | NO   |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Composite-Index-Symbol-Information#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
	{ 
		"symbol": "DEFIUSDT",
		"time": 1589437530011,    // 请求时间
		"component": "baseAsset", //成分资产
		"baseAssetList":[
			{
				"baseAsset":"BAL",	  // 基础资产
				"quoteAsset": "USDT", // 报价资产
				"weightInQuantity":"1.04406228",  //权重(数量)
				"weightInPercentage":"0.02783900" //权重(比例)
			},
			{
				"baseAsset":"BAND",
				"quoteAsset": "USDT", 
				"weightInQuantity":"3.53782729",
				"weightInPercentage":"0.03935200"
			}
		]
	}
]
```