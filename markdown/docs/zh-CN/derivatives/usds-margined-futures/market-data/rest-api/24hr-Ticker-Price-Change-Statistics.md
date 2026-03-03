# 24hr价格变动情况

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/24hr-Ticker-Price-Change-Statistics#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

请注意，不携带symbol参数会返回全部交易对数据，不仅数据庞大，而且权重极高

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/24hr-Ticker-Price-Change-Statistics#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/ticker/24hr`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/24hr-Ticker-Price-Change-Statistics#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

带symbol为**1**, 不带为**40**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/24hr-Ticker-Price-Change-Statistics#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | NO   | 交易对 |

> - 不发送交易对参数，则会返回所有交易对信息

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/24hr-Ticker-Price-Change-Statistics#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "symbol": "BTCUSDT",
  "priceChange": "-94.99999800",    //24小时价格变动
  "priceChangePercent": "-95.960",  //24小时价格变动百分比
  "weightedAvgPrice": "0.29628482", //加权平均价
  "lastPrice": "4.00000200",        //最近一次成交价
  "lastQty": "200.00000000",        //最近一次成交额
  "openPrice": "99.00000000",       //24小时内第一次成交的价格
  "highPrice": "100.00000000",      //24小时最高价
  "lowPrice": "0.10000000",         //24小时最低价
  "volume": "8913.30000000",        //24小时成交量
  "quoteVolume": "15.30000000",     //24小时成交额
  "openTime": 1499783499040,        //24小时内，第一笔交易的发生时间
  "closeTime": 1499869899040,       //24小时内，最后一笔交易的发生时间
  "firstId": 28385,   // 首笔成交id
  "lastId": 28460,    // 末笔成交id
  "count": 76         // 成交笔数
}
```

> 或(当不发送交易对信息)

```javascript
[
	{
  		"symbol": "BTCUSDT",
  		"priceChange": "-94.99999800",    //24小时价格变动
  		"priceChangePercent": "-95.960",  //24小时价格变动百分比
  		"weightedAvgPrice": "0.29628482", //加权平均价
  		"lastPrice": "4.00000200",        //最近一次成交价
  		"lastQty": "200.00000000",        //最近一次成交额
  		"openPrice": "99.00000000",       //24小时内第一次成交的价格
  		"highPrice": "100.00000000",      //24小时最高价
  		"lowPrice": "0.10000000",         //24小时最低价
  		"volume": "8913.30000000",        //24小时成交量
  		"quoteVolume": "15.30000000",     //24小时成交额
  		"openTime": 1499783499040,        //24小时内，第一笔交易的发生时间
  		"closeTime": 1499869899040,       //24小时内，最后一笔交易的发生时间
  		"firstId": 28385,   // 首笔成交id
  		"lastId": 28460,    // 末笔成交id
  		"count": 76         // 成交笔数
    }
]
```