# 查询历史成交(MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Old-Trades-Lookup#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询订单簿历史成交

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Old-Trades-Lookup#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/historicalTrades`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Old-Trades-Lookup#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**20**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Old-Trades-Lookup#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述                        |
|--------|--------|------|---------------------------|
| symbol | STRING | YES  | 交易对                       |
| limit  | INT    | NO   | 默认值:100 最大值:500.          |
| fromId | LONG   | NO   | 从哪一条成交id开始返回. 缺省返回最近的成交记录 |

> - 仅返回订单簿成交，即不会返回保险基金和自动减仓(ADL)成交
> - 仅支持返回最近1个月的数据

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Old-Trades-Lookup#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "id": 28457,				// 成交ID
    "price": "4.00000100",		// 成交价格
    "qty": "12.00000000",		// 成交量
    "quoteQty": "48.00",		// 成交额
    "time": 1499865549590,		// 时间
    "isBuyerMaker": true		// 买方是否为挂单方
    "isRPITrade": true		// Maker方是否为RPI挂单
  }
]
```