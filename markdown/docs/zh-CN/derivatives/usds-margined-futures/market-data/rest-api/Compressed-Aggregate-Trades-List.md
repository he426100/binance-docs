# 近期成交(归集)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Compressed-Aggregate-Trades-List#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

归集交易与逐笔交易的区别在于，同一价格、同一方向、同一时间(100ms计算)的订单簿trade会被聚合为一条

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Compressed-Aggregate-Trades-List#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/aggTrades`

**注意：** 响应消息聚合RPI订单数据，但无任何特殊标签区别。

**权重:** 20

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Compressed-Aggregate-Trades-List#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称        | 类型     | 是否必需 | 描述                 |
|-----------|--------|------|--------------------|
| symbol    | STRING | YES  | 交易对                |
| fromId    | LONG   | NO   | 从包含fromID的成交开始返回结果 |
| startTime | LONG   | NO   | 从该时刻之后的成交记录开始返回结果  |
| endTime   | LONG   | NO   | 返回该时刻为止的成交记录       |
| limit     | INT    | NO   | 默认 500; 最大 1000.   |

> - 接口仅支持查询最近24小时的交易数据
> - 如果同时发送`startTime`和`endTime`，间隔必须小于一小时
> - 如果没有发送任何筛选参数(`fromId`, `startTime`, `endTime`)，默认返回最近的成交记录
> - 保险基金和自动减仓(ADL)成交不属于订单簿成交，故不会被归并聚合
> - 同时发送`startTime`/`endTime`和`fromId`可能导致请求超时，建议仅发送`fromId`或仅发送`startTime`和`endTime`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Compressed-Aggregate-Trades-List#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "a": 26129,         // 归集成交ID
    "p": "0.01633102",  // 成交价
    "q": "4.70443515",  // 成交量
    "f": 27781,         // 被归集的首个成交ID
    "l": 27781,         // 被归集的末个成交ID
    "T": 1498793709153, // 成交时间
    "m": true,          // 是否为主动卖出单
  }
]
```