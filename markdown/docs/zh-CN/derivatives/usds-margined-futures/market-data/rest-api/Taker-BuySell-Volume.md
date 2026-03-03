# 合约主动买卖量

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Taker-BuySell-Volume#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

合约主动买卖量

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Taker-BuySell-Volume#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/futures/data/takerlongshortRatio`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Taker-BuySell-Volume#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**0**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Taker-BuySell-Volume#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称        | 类型     | 是否必需 | 描述                                              |
|-----------|--------|------|-------------------------------------------------|
| symbol    | STRING | YES  |                                                 |
| period    | ENUM   | YES  | "5m","15m","30m","1h","2h","4h","6h","12h","1d" |
| limit     | LONG   | NO   | default 30, max 500                             |
| startTime | LONG   | NO   |                                                 |
| endTime   | LONG   | NO   |                                                 |

> - 若无 startime 和 endtime 限制， 则默认返回当前时间往前的 limit 值
> - 仅支持最近 30 天的数据
> - IP限频为1000次/5min

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Taker-BuySell-Volume#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    buySellRatio: "1.5586",
    buyVol: "387.3300", // 主动买入量
    sellVol: "248.5030", // 主动卖出量
    timestamp: "1585614900000",
  },

  {
    buySellRatio: "1.3104",
    buyVol: "343.9290",
    sellVol: "248.5030",
    timestamp: "1583139900000",
  },
]
```