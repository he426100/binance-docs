# 生成listenKey (USER\_STREAM)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Start-User-Data-Stream#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

创建一个新的user data stream，返回值为一个listenKey

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Start-User-Data-Stream#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/listen-key`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Start-User-Data-Stream#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Start-User-Data-Stream#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

None

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/risk-data-stream/Start-User-Data-Stream#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "listenKey": "T3ee22BIYuWqmvne0HNq2A2WsFlEtLhvWCtItw6ffhhd"
}
```