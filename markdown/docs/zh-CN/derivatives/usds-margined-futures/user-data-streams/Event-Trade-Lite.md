# 精简交易推送

精简交易推送相比原有的`ORDER_TRADE_UPDATE`流减少了数据延迟，但该交易推送仅推送和交易相关的字段。

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Trade-Lite#url-path "URL PATH的直接链接")

`/private`

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Trade-Lite#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`TRADE_LITE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Trade-Lite#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e":"TRADE_LITE",             // 事件类型
  "E":1721895408092,            // 事件时间
  "T":1721895408214,            // 交易时间
  "s":"BTCUSDT",                // 交易对
  "q":"0.001",                  // 订单原始数量
  "p":"0",                      // 订单原始价格
  "m":false,                    // 该成交是作为挂单成交吗？
  "c":"z8hcUoOsqEdKMeKPSABslD", // 客户端自定订单ID
      // 特殊的自定义订单ID:
      // "autoclose-"开头的字符串: 系统强平订单
      // "adl_autoclose": ADL自动减仓订单
      // "settlement_autoclose-": 下架或交割的结算订单
  "S":"BUY",                    // 订单方向
  "L":"64089.20",               // 订单末次成交价格
  "l":"0.040",                  // 订单末次成交量
  "t":109100866,                // 成交ID
  "i":8886774,                  // 订单ID
}
```