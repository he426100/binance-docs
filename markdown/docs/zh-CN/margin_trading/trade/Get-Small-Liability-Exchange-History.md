# 查询全仓杠杆小额负债转换历史 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Small-Liability-Exchange-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询全仓杠杆小额负债转换历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Small-Liability-Exchange-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/exchange-small-liability-history`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Small-Liability-Exchange-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**100(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Small-Liability-Exchange-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述                |
|------------|------|------|-------------------|
| current    | INT  | YES  | 当前页面，默认1，最小值为1    |
| size       | INT  | YES  | 页面大小，默认10，最大值为100 |
| startTime  | LONG | NO   | 默认当前时间30天前的时间戳    |
| endTime    | LONG | NO   | 默认当前时间戳           |
| recvWindow | LONG | NO   |                   |
| timestamp  | LONG | YES  |                   |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Small-Liability-Exchange-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "total": 1,
    "rows": [
      {
        "asset": "ETH",
        "amount": "0.00083434",
        "targetAsset": "BUSD",
        "targetAmount": "1.37576819",
        "bizType": "EXCHANGE_SMALL_LIABILITY",
        "timestamp": 1672801339253
      }
    ]
}
```