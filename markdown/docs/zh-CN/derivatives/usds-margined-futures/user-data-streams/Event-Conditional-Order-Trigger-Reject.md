# 条件订单(TP/SL)触发后拒绝更新推送

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Conditional-Order-Trigger-Reject#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

`CONDITIONAL_ORDER_TRIGGER_REJECT` 在止盈止损单触发后被拒绝时推送

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Conditional-Order-Trigger-Reject#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`CONDITIONAL_ORDER_TRIGGER_REJECT`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Conditional-Order-Trigger-Reject#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "e":"CONDITIONAL_ORDER_TRIGGER_REJECT",      // 事件类型
    "E":1685517224945,      // 事件时间
    "T":1685517224955,      // 撮合时间
    "or":{
      "s":"ETHUSDT",      // 交易对
      "i":155618472834,      // 订单号
      "r":"Due to the order could not be filled immediately, the FOK order has been rejected. The order will not be recorded in the order history",      // 拒绝原因
     }
}
```