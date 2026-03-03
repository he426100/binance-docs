# 接受报价(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Accept-Quote#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

通过 quote ID 来接受报价。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Accept-Quote#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/fapi/v1/convert/acceptQuote`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Accept-Quote#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**200(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Accept-Quote#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述           |
|------------|--------|------|--------------|
| quoteId    | STRING | YES  |              |
| recvWindow | LONG   | NO   | 此值不能大于 60000 |
| timestamp  | LONG   | YES  |              |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Accept-Quote#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "orderId":"933256278426274426",
  "createTime":1623381330472,
  "orderStatus":"PROCESS" //PROCESS/ACCEPT_SUCCESS/SUCCESS/FAIL
}
```