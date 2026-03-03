# 杠杆倍数等账户配置 更新推送

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Account-Configuration-Update-previous-Leverage-Update#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

当账户配置发生变化时会推送此类事件类型统一为`ACCOUNT_CONFIG_UPDATE` 当交易对杠杆倍数发生变化时推送消息体会包含对象`ac`表示交易对账户配置，其中`s`代表具体的交易对，`l`代表杠杆倍数 当用户联合保证金状态发生变化时推送消息体会包含对象`ai`表示用户账户配置，其中`j`代表用户联合保证金状态

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Account-Configuration-Update-previous-Leverage-Update#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`ACCOUNT_CONFIG_UPDATE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Account-Configuration-Update-previous-Leverage-Update#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **Payload:**

```javascript
{
    "e":"ACCOUNT_CONFIG_UPDATE",       // 事件类型
    "E":1611646737479,		           // 事件时间
    "T":1611646737476,		           // 撮合时间
    "ac":{
    "s":"BTCUSDT",					   // 交易对
    "l":25						       // 杠杆倍数
    }
}

```

> **Or**

```javascript
{
    "e":"ACCOUNT_CONFIG_UPDATE",       // 事件类型
    "E":1611646737479,		           // 事件时间
    "T":1611646737476,		           // 撮合时间
    "ai":{							   // 用户账户配置
    "j":true						   // 联合保证金状态
    }
}
```