# 一周交易时段

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Trading-Schedule#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

从查询时间的前一日起算、返回为期一周的传统金融合约标的资产的交易时段信息，覆盖美国股票市场和商品市场。美股市场的时段类型包括 "PRE\_MARKET"、"REGULAR"、"AFTER\_MARKET"、"OVERNIGHT" 和 "NO\_TRADING"；商品市场的时段类型包括 "REGULAR" 和 "NO\_TRADING"。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Trading-Schedule#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/tradingSchedule`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Trading-Schedule#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Trading-Schedule#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

NONE

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Trading-Schedule#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "updateTime": 1761286643918,
  "marketSchedules": {
    "EQUITY": {
      "sessions": [
        {
          "startTime": 1761177600000,
          "endTime": 1761206400000,
          "type": "OVERNIGHT"
        },
        {
          "startTime": 1761206400000,
          "endTime": 1761226200000,
          "type": "PRE_MARKET"
        } 
      ]
    },
    "COMMODITY": {
      "sessions": [
        {
          "startTime": 1761724800000,
          "endTime": 1761744600000,
          "type": "NO_TRADING"
        },
        {
          "startTime": 1761744600000,
          "endTime": 1761768000000,
          "type": "REGULAR"
        }
      ]
    }
  }
}
```