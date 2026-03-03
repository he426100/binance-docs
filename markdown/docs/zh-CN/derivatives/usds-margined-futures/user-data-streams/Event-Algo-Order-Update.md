# 条件订单交易更新推送

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Algo-Order-Update#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

当有新订单创建、订单有新成交或者新的状态变化时会推送此类事件 事件类型统一为 `ALGO_UPDATE`

**本次事件的具体执行类型**

- NEW：该状态表示条件订单已提交，但尚未触发。
- CANCELED：该状态表示条件订单已被取消。
- TRIGGERING：该状态表示条件订单已满足触发条件，且已被转发至撮合引擎。
- TRIGGERED：该状态表示条件订单已成功触发并成功进入撮合引擎。
- FINISHED：该状态表示触发的条件订单已在撮合引擎中被成交或取消。
- REJECTED：该状态表示条件订单被撮合引擎拒绝，例如保证金检查失败等情况。
- EXPIRED：该状态表示条件订单被系统取消。例如，用户下了一个GTE\_GTC时效条件订单，但随后关闭了该标的的所有持仓，系统因此取消了该条件订单。

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Algo-Order-Update#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`ALGO_UPDATE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Algo-Order-Update#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e":"ALGO_UPDATE",  // 事件类型
  "T":1750515742297,  // 撮合时间
  "E":1750515742303,  // 事件时间
  "o":{
    "caid":"Q5xaq5EGKgXXa0fD7fs0Ip",  // 客户端自定条件订单ID
    "aid":2148719,  // 条件单 Id
    "at":"CONDITIONAL",  // 条件单类型
    "o":"TAKE_PROFIT",  //订单类型
    "s":"BNBUSDT",  //交易对
    "S":"SELL",  //订单方向
    "ps":"BOTH",  //持仓方向
    "f":"GTC",  //有效方式
    "q":"0.01",  //订单数量
    "X":"CANCELED",  //条件单状态
    "ai":"",  // 触发后普通订单 id
    "ap": "0.00000", // 触发后在撮合引擎中实际订单的平均成交价格，仅在订单被触发并进入撮合引擎时显示
    "aq": "0.00000", // 触发后在撮合引擎中实际订单已成交数量，仅当订单被触发并进入撮合引擎时显示
    "act": "0", // 触发后在撮合引擎中实际的订单类型，仅当订单被触发并进入撮合引擎时显示
    "tp":"750",  //条件单触发价格
    "p":"750", //订单价格
    "V":"EXPIRE_MAKER",  //自成交防止模式
    "wt":"CONTRACT_PRICE", //触发价类型
    "pm":"NONE",  // 价格匹配模式
    "cp":false,  //是否为触发平仓单; 仅在条件订单情况下会推送此字段
    "pP":false, //是否开启条件单触发保护
    "R":false,  // 是否是只减仓单
    "tt":0,  //触发时间
    "gtd":0,       // TIF为GTD的订单自动取消时间
    "rm": "Reduce Only reject"  // 条件单失败原因
}
```