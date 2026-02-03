# 查询目前杠杆账户下单数 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Current-Margin-Order-Count-Usage#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取用户在当前时间区间内的杠杆账户下单总数。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Current-Margin-Order-Count-Usage#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/rateLimit/order`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Current-Margin-Order-Count-Usage#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**20(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Current-Margin-Order-Count-Usage#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                 |
|------------|--------|------|------------------------------------|
| isIsolated | STRING | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE" |
| symbol     | STRING | NO   | 逐仓交易对，查询逐仓杠杆账户必需                   |
| recvWindow | LONG   | NO   | 赋值不能大于 `60000`                     |
| timestamp  | LONG   | YES  |                                    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Current-Margin-Order-Count-Usage#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[

  {
    "rateLimitType": "ORDERS",
    "interval": "SECOND",
    "intervalNum": 10,
    "limit": 10000,
    "count": 0
  },
  {
    "rateLimitType": "ORDERS",
    "interval": "DAY",
    "intervalNum": 1,
    "limit": 20000,
    "count": 0
  }
]
```