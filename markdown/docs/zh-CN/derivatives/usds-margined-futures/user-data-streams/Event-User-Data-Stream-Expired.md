# listenKey过期推送

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-User-Data-Stream-Expired#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

当前连接使用的有效listenKey过期时，user data stream 将会推送此事件。

**注意:**

- 此事件与 websocket 连接中断没有必然联系
- 只有正在连接中的有效`listenKey`过期时才会收到此消息
- 收到此消息后 user data stream 将不再更新，直到用户使用新的有效的`listenKey`

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-User-Data-Stream-Expired#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`listenKeyExpired`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-User-Data-Stream-Expired#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "e": "listenKeyExpired",    // 事件类型
    "E": "1736996475556",       // 事件时间
    "listenKey":"WsCMN0a4KHUPTQuX6IUnqEZfB1inxmv1qR4kbf1LuEjur5VdbzqvyxqG9TSjVVxv"
}
```