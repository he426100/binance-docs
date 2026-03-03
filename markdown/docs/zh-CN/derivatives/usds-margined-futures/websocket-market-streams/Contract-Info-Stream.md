# 多资产模式资产汇率指数

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Contract-Info-Stream#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

多资产模式资产价格指数

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Contract-Info-Stream#stream-name "Stream Name的直接链接")

`!assetIndex@arr`OR `<assetSymbol>@assetIndex`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Contract-Info-Stream#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**1s**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Contract-Info-Stream#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
      "e":"assetIndexUpdate",
      "E":1686749230000,
      "s":"ADAUSD",         // asset index symbol
      "i":"0.27462452",     // 指数价格
      "b":"0.10000000",     // bid估值折扣
      "a":"0.10000000",     // ask估值折扣
      "B":"0.24716207",     // bid价格
      "A":"0.30208698",     // ask价格
      "q":"0.05000000",     // 自动兑换bid估值折扣
      "g":"0.05000000",     // 自动兑换ask估值折扣
      "Q":"0.26089330",     // 自动兑换bid价格
      "G":"0.28835575"      // 自动兑换ask价格
    },
    {
      "e":"assetIndexUpdate",
      "E":1686749230000,
      "s":"USDTUSD",
      "i":"0.99987691",
      "b":"0.00010000",
      "a":"0.00010000",
      "B":"0.99977692",
      "A":"0.99997689",
      "q":"0.00010000",
      "g":"0.00010000",
      "Q":"0.99977692",
      "G":"0.99997689"
    }
]
```