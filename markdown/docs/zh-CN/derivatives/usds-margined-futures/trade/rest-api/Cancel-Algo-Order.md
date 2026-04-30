# 撤销条件订单 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Algo-Order#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

撤销当前有效的条件单（Algo / Conditional Order），覆盖 U 本位合约的止盈止损（TP/SL, Take Profit / Stop Loss）与追踪止损（Trailing Stop）订单。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Algo-Order#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

DELETE `/fapi/v1/algoOrder`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Algo-Order#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Algo-Order#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称           | 类型     | 是否必需 | 描述        |
|--------------|--------|------|-----------|
| algoId       | LONG   | NO   | 系统订单号     |
| clientAlgoId | STRING | NO   | 用户自定义的订单号 |
| recvWindow   | LONG   | NO   |           |
| timestamp    | LONG   | YES  |           |

> - `algoId` 与 `clientAlgoId` 必须至少发送一个

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-Algo-Order#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
   "algoId": 2146760,
   "clientAlgoId": "6B2I9XVcJpCjqPAJ4YoFX7",
   "code": "200",
   "msg": "success"
}
```