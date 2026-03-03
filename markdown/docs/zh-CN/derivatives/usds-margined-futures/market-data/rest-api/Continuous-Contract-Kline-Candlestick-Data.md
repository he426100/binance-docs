# 连续合约K线数据

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Continuous-Contract-Kline-Candlestick-Data#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

每根K线的开盘时间可视为唯一ID

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Continuous-Contract-Kline-Candlestick-Data#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/continuousKlines`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Continuous-Contract-Kline-Candlestick-Data#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

取决于请求中的LIMIT参数

| LIMIT参数      | 权重 |
|--------------|----|
| [1,100)      | 1  |
| [100, 500)   | 2  |
| \[500, 1000] | 5  |
| &gt; 1000    | 10 |

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Continuous-Contract-Kline-Candlestick-Data#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称           | 类型     | 是否必需 | 描述               |
|--------------|--------|------|------------------|
| pair         | STRING | YES  | 标的交易对            |
| contractType | ENUM   | YES  | 合约类型             |
| interval     | ENUM   | YES  | 时间间隔             |
| startTime    | LONG   | NO   | 起始时间             |
| endTime      | LONG   | NO   | 结束时间             |
| limit        | INT    | NO   | 默认值:500 最大值:1500 |

- 缺省返回最近的数据
- 合约类型:
  
  - PERPETUAL 永续合约
  - CURRENT\_QUARTER 当季交割合约
  - NEXT\_QUARTER 次季交割合约
  - TRADIFI\_PERPETUAL 传统金融合约

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Continuous-Contract-Kline-Candlestick-Data#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  [
    1607444700000,    	// 开盘时间
    "18879.99",       	// 开盘价
    "18900.00",       	// 最高价
    "18878.98",       	// 最低价
    "18896.13",       	// 收盘价(当前K线未结束的即为最新价)
    "492.363",  		// 成交量
    1607444759999,   	// 收盘时间
    "9302145.66080",    // 成交额
    1874,               // 成交笔数
    "385.983",    		// 主动买入成交量
    "7292402.33267",    // 主动买入成交额
    "0" 				// 请忽略该参数
  ]
]
```