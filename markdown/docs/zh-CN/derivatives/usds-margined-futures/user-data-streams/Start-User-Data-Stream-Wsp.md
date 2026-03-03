# Websocket API生成listenKey (USER\_STREAM)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Start-User-Data-Stream-Wsp#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

创建一个新的user data stream，返回值为一个listenKey，即websocket订阅的stream名称。如果该帐户具有有效的`listenKey`，则将返回该`listenKey`并将其有效期延长60分钟。

## 方式[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Start-User-Data-Stream-Wsp#%E6%96%B9%E5%BC%8F "方式的直接链接")

`userDataStream.start`

## 请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Start-User-Data-Stream-Wsp#%E8%AF%B7%E6%B1%82 "请求的直接链接")

```javascript
{
  "id": "d3df8a61-98ea-4fe0-8f4e-0fcea5d418b0",
  "method": "userDataStream.start",
  "params": {
    "apiKey": "vmPUZE6mv9SD5VNHk4HlWFsOr6aKE2zvsw0MuIgwCIPy6utIco14y7Ju91duEh8A"
  }
}
```

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Start-User-Data-Stream-Wsp#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Start-User-Data-Stream-Wsp#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述 |
|--------|--------|------|----|
| apiKey | STRING | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Start-User-Data-Stream-Wsp#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "id": "d3df8a61-98ea-4fe0-8f4e-0fcea5d418b0",
  "status": 200,
  "result": {
    "listenKey": "xs0mRXdAKlIPDRFrlPcw0qI41Eh3ixNntmymGyhrhgqo7L6FuLaWArTD7RLP"
  },
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