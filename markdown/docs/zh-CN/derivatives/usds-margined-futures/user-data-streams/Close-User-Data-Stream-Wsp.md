# Websocket API关闭listenKey (USER\_STREAM)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Close-User-Data-Stream-Wsp#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

关闭某账户数据流

## 方式[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Close-User-Data-Stream-Wsp#%E6%96%B9%E5%BC%8F "方式的直接链接")

`userDataStream.stop`

## 请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Close-User-Data-Stream-Wsp#%E8%AF%B7%E6%B1%82 "请求的直接链接")

```javascript
{
  "id": "819e1b1b-8c06-485b-a13e-131326c69599",
  "method": "userDataStream.stop",
  "params": {
    "apiKey": "vmPUZE6mv9SD5VNHk9HlWFsOr9aLE2zvsw0MuIgwCIPy8atIco14y7Ju91duEh8A"
  }
}
```

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Close-User-Data-Stream-Wsp#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Close-User-Data-Stream-Wsp#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

None

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Close-User-Data-Stream-Wsp#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "id": "819e1b1b-8c06-485b-a13e-131326c69599",
  "status": 200,
  "result": {},
   "rateLimits": [
    {
      "rateLimitType": "REQUEST_WEIGHT",
      "interval": "MINUTE",
      "intervalNum": 1,
      "limit": 2400,
      "count": 2
    }
  ]
}
```