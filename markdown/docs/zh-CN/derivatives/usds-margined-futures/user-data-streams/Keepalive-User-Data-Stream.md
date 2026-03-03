# 延长listenKey有效期(USER\_STREAM)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Keepalive-User-Data-Stream#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

有效期延长至本次调用后60分钟

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Keepalive-User-Data-Stream#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

PUT `/fapi/v1/listenKey`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Keepalive-User-Data-Stream#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Keepalive-User-Data-Stream#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

None

```javascript
{
    "listenKey": "3HBntNTepshgEdjIwSUIBgB9keLyOCg5qv3n6bYAtktG8ejcaW5HXz9Vx1JgIieg" // 被延长的listenkey
}
```