# 调整开仓杠杆 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Change-Initial-Leverage#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

调整用户在指定symbol合约的开仓杠杆。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Change-Initial-Leverage#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/fapi/v1/leverage`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Change-Initial-Leverage#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Change-Initial-Leverage#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                |
|------------|--------|------|-------------------|
| symbol     | STRING | YES  | 交易对               |
| leverage   | INT    | YES  | 目标杠杆倍数：1 到 125 整数 |
| recvWindow | LONG   | NO   |                   |
| timestamp  | LONG   | YES  |                   |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Change-Initial-Leverage#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
 	"leverage": 21,	// 杠杆倍数
 	"maxNotionalValue": "1000000", // 当前杠杆倍数下允许的最大名义价值
 	"symbol": "BTCUSDT"	// 交易对
}
```