# 发送获取报价请求(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Send-quote-request#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

对所需的币对发送获取报价请求

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Send-quote-request#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/fapi/v1/convert/getQuote`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Send-quote-request#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**50(IP)** **每小时360次，每天500次**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Send-quote-request#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型      | 是否必需   | 描述              |
|------------|---------|--------|-----------------|
| fromAsset  | STRING  | YES    |                 |
| toAsset    | STRING  | YES    |                 |
| fromAmount | DECIMAL | EITHER | 这是成交后将被扣除的金额    |
| toAmount   | DECIMAL | EITHER | 这是成交后将会获得的金额    |
| validTime  | ENUM    | NO     | 可以支持10s，默认值为10s |
| recvWindow | LONG    | NO     | 此值不能大于 60000    |
| timestamp  | LONG    | YES    |                 |

> - 参数fromAmount或者toAmount只需要提供其中一个。
> - `quoteId`仅在账户余额充足时返回。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/Send-quote-request#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
   "quoteId":"12415572564",
   "ratio":"38163.7",
   "inverseRatio":"0.0000262",
   "validTimestamp":1623319461670,
   "toAmount":"3816.37",
   "fromAmount":"0.1"
}
```