# 追加保证金通知

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Margin-Call#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

- 当用户持仓风险过高，会推送此消息。
- 此消息仅作为风险指导信息，不建议用于投资策略。
- 在大波动市场行情下，不排除此消息发出的同时用户仓位已被强平的可能。

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Margin-Call#url-path "URL PATH的直接链接")

`/private`

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Margin-Call#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`MARGIN_CALL`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Margin-Call#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "e":"MARGIN_CALL",    	// 事件类型
    "E":1587727187525,		// 事件时间
    "cw":"3.16812045",		// 除去逐仓仓位保证金的钱包余额, 仅在全仓 margin call 情况下推送此字段
    "p":[					// 涉及持仓
      {
        "s":"ETHUSDT",		// symbol
        "ps":"LONG",		// 持仓方向
        "pa":"1.327",		// 仓位
        "mt":"CROSSED",		// 保证金模式
        "iw":"0",			// 若为逐仓，仓位保证金
        "mp":"187.17127",	// 标记价格
        "up":"-1.166074",	// 未实现盈亏
        "mm":"1.614445"		// 持仓需要的维持保证金
      }
    ]
}
```