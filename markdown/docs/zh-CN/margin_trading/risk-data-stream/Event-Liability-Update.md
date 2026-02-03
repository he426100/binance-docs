# 负债变化事件

## 事件描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Event-Liability-Update#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

当下列情形发生时,会推送此事件:

- 借款
- 计息
- 还款

## 事件类型[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Event-Liability-Update#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`USER_LIABILITY_CHANGE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Event-Liability-Update#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **Payload:**

```javascript
{
   "e": "USER_LIABILITY_CHANGE", // 事件类型
   "E": 1701949801133, // 事件时间
   "a": "BTC", // 资产
   "t": "BORROW", // 负债变更类型
   "p": "0.00000100", // 负债本金数量
   "i": "0.00000000" // 利息数量
}
```