# listenToken订阅用户数据流

## 生成杠杆账户listenToken(USER\_STREAM)[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E7%94%9F%E6%88%90%E6%9D%A0%E6%9D%86%E8%B4%A6%E6%88%B7listentokenuser_stream "生成杠杆账户listenToken(USER_STREAM)的直接链接")

### 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

创建一个新的listenToken，授权用户在限定时间内访问当前账户的用户数据流。数据流的有效期由validity参数指定（毫秒） ，数据流的有效期由 validity 参数（毫秒）指定，默认为 24 小时，最长为 24 小时。响应中包含 listenToken 和相应的 expirationTime（以毫秒为单位）。

### HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

**POST** `/sapi/v1/userListenToken`

**请求权重(UID)**: 1

### 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型      | 是否必需        | 描述                                   |
|------------|---------|-------------|--------------------------------------|
| symbol     | STRING  | CONDITIONAL | 交易对名称，当isIsolated为true时必填，例如：BNBUSDT |
| isIsolated | BOOLEAN | NO          | 是否为逐仓杠杆，true表示逐仓，默认为全仓               |
| validity   | LONG    | NO          | 有效期（毫秒） ，默认24小时，最大24小时               |

### 说明[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AF%B4%E6%98%8E "说明的直接链接")

- 数据流的有效期由validity参数指定，默认24小时，最大24小时。过期时间 = 当前时间 + 有效期。
- 返回token和过期时间expirationTime。

### 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```json
{
  "token": "6xXxePXwZRjVSHKhzUCCGnmN3fkvMTXru+pYJS8RwijXk9Vcyr3rkwfVOTcP2OkONqciYA",
  "expirationTime": 1758792204196
}
```

## 订阅用户数据流使用listenToken (USER\_STREAM)[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AE%A2%E9%98%85%E7%94%A8%E6%88%B7%E6%95%B0%E6%8D%AE%E6%B5%81%E4%BD%BF%E7%94%A8listentoken-user_stream "订阅用户数据流使用listenToken (USER_STREAM)的直接链接")

### 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0-1 "接口描述的直接链接")

使用 listenToken 订阅用户数据流。

该方法必需由WebSocket API调用。关于WebSocket API的更多信息请参考:[WebSocket API](https://developers.binance.com/docs/zh-CN/binance-spot-api-docs/websocket-api/general-api-information) 。

### 请求示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AF%B7%E6%B1%82%E7%A4%BA%E4%BE%8B "请求示例的直接链接")

```json
{
  "id": "f3a8f7a29f2e54df796db582f3d",
  "method": "userDataStream.subscribe.listenToken",
   "params": {
      "listenToken": "5DbylArkmImhyHkpG6s9tbiFy5uAMTFwzx9vwsFjDv9dC3GkKxSuoTCj0HvcJC0WYi8
  }
}
```

### 请求权重(UID)：2[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid2 "请求权重(UID)：2的直接链接")

### 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0-1 "请求参数的直接链接")

| 名称          | 类型     | 是否必需 | 描述      |
|-------------|--------|------|---------|
| listenToken | STRING | YES  | 监听token |

### 说明[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AF%B4%E6%98%8E-1 "说明的直接链接")

- 允许非登录会话使用此功能。
- 如果 listenToken 无效，将返回错误代码 **-1209** 。
- WebSocket API 不会自动续订订阅。要延长订阅的有效期，您必须在当前订阅到期前调用 `/sapi/v1/userListenToken`，获取一个包含更新后的 expirationTime 的新 listenToken，然后再次调用 `userDataStream.subscribe.listenToken` 并传入新的 listenToken。这样可以无缝地将您的订阅续订至新的 expirationDate。
- 如果订阅未延长，它将过期，您将收到“eventStreamTerminated”事件（见下面的示例）。
- 如果您需要更佳性能，可以使用 SBE 格式而非 JSON 格式接收事件。更多详情，请参阅[简单二进制编码 (SBE) 常见问题解答](https://developers.binance.com/docs/zh-CN/binance-spot-api-docs/faqs/sbe_faq)

### 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B-1 "响应示例的直接链接")

```json
{
  "subscriptionId": 0,
  "expirationTime": 1749094553955907
}
```

### 订阅过期示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream#%E8%AE%A2%E9%98%85%E8%BF%87%E6%9C%9F%E7%A4%BA%E4%BE%8B "订阅过期示例的直接链接")

```json
{
  "subscriptionId": 0,
  "event": {
    "e": "eventStreamTerminated",
    "E": 1759089357377
  }
}
```
