# 调整逐仓保证金 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Isolated-Position-Margin#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

针对逐仓模式下的仓位，调整其逐仓保证金资金。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Isolated-Position-Margin#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/fapi/v1/positionMargin`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Isolated-Position-Margin#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Isolated-Position-Margin#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称           | 类型      | 是否必需 | 描述                                                             |
|--------------|---------|------|----------------------------------------------------------------|
| symbol       | STRING  | YES  | 交易对                                                            |
| positionSide | ENUM    | NO   | 持仓方向，单向持仓模式下非必填，默认且仅可填`BOTH`;在双向持仓模式下必填,且仅可选择 `LONG` 或 `SHORT` |
| amount       | DECIMAL | YES  | 保证金资金                                                          |
| type         | INT     | YES  | 调整方向 1: 增加逐仓保证金，2: 减少逐仓保证金                                     |
| recvWindow   | LONG    | NO   |                                                                |
| timestamp    | LONG    | YES  |                                                                |

> - 只针对逐仓symbol 与 positionSide(如有)

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Modify-Isolated-Position-Margin#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"amount": 100.0,
  	"code": 200,
  	"msg": "Successfully modify position margin.",
  	"type": 1
}
```