# 获取合约交易历史下载Id(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Download-Id-For-Futures-Trade-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取合约交易历史下载Id

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Download-Id-For-Futures-Trade-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/trade/asyn`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Download-Id-For-Futures-Trade-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1000**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Download-Id-For-Futures-Trade-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述           |
|------------|------|------|--------------|
| startTime  | LONG | YES  | 起始时间，ms格式时间戳 |
| endTime    | LONG | YES  | 结束时间，ms格式时间戳 |
| recvWindow | LONG | NO   |              |
| timestamp  | LONG | YES  |              |

> - 存在每月5次的请求限制，网页端和Rest接口下载次数共用。
> - `startTime`与`endTime`间隔不能超过1年

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Download-Id-For-Futures-Trade-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"avgCostTimestampOfLast30d":7241837, //过去30天平均数据下载时间
  	"downloadId":"546975389218332672",   //下载Id
}
```