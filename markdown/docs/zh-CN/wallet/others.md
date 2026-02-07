# 系统状态(System)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/others#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取系统状态。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/others#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/system/status`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/others#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/others#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{ 
    "status": 0,              // 0: normal，1：system maintenance
    "msg": "normal"           // "normal", "system_maintenance"
}
```