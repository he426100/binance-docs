# 撤销全部条件订单(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-All-Algo-Open-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

撤销某个交易对下的全部条件挂单（Algo / Conditional Order），覆盖 U 本位合约的止盈止损（TP/SL, Take Profit / Stop Loss）与追踪止损（Trailing Stop）订单。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-All-Algo-Open-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

DELETE `/fapi/v1/algoOpenOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-All-Algo-Open-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-All-Algo-Open-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述  |
|------------|--------|------|-----|
| symbol     | STRING | YES  | 交易对 |
| recvWindow | LONG   | NO   |     |
| timestamp  | LONG   | YES  |     |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Cancel-All-Algo-Open-Orders#%E5%93%8D%E5%BA%94%00%00%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"code": 200, 
	"msg": "The operation of cancel all open order is done."
}
```