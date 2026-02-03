# 余额更新

## 事件描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream/Event-Balance-Update#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

当下列情形发生时更新:

- 账户发生充值或提取
- 交易账户之间发生划转(例如 现货向杠杆账户划转)

## 事件类型[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream/Event-Balance-Update#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`USER_LIABILITY_CHANGE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream/Event-Balance-Update#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **Payload:**

```javascript
{
  "e": "balanceUpdate",         //Event Type
  "E": 1573200697110,           //Event Time
  "a": "ABC",                   //Asset
  "d": "100.00000000",          //Balance Delta
  "T": 1573200697068            //Clear Time
}
```