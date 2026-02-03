# 全仓杠杆小额负债转换 (MARGIN)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Small-Liability-Exchange#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

全仓杠杆小额负债转换

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Small-Liability-Exchange#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/exchange-small-liability`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Small-Liability-Exchange#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**3000(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Small-Liability-Exchange#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型    | 是否必需 | 描述                                 |
|------------|-------|------|------------------------------------|
| assetNames | ARRAY | YES  | 小额转换的资产列表，举例: assetNames = BTC,ETH |
| recvWindow | LONG  | NO   |                                    |
| timestamp  | LONG  | YES  |                                    |

- 兑换请求限流6小时一次
- 币种负债小于10USDT
- 币种数量最大10个

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Small-Liability-Exchange#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")