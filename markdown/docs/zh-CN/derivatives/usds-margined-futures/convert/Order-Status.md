# 查询订单状态(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Order-Status#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

通过 order ID 来查询订单状态。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Order-Status#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/convert/orderStatus`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Order-Status#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**50(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Order-Status#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称      | 类型     | 是否必需 | 描述                      |
|---------|--------|------|-------------------------|
| orderId | STRING | NO   | orderId 和quoteId需要填其中一个 |
| quoteId | STRING | NO   | orderId 和quoteId需要填其中一个 |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Order-Status#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "orderId":933256278426274426,
  "orderStatus":"SUCCESS",
  "fromAsset":"BTC",
  "fromAmount":"0.00054414",
  "toAsset":"USDT",
  "toAmount":"20",
  "ratio":"36755",
  "inverseRatio":"0.00002721",
  "createTime":1623381330472
}
```