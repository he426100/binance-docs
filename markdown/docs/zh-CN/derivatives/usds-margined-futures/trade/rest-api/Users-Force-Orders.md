# 用户强平单历史 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Users-Force-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询用户强平单历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Users-Force-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/forceOrders`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Users-Force-Orders#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

带symbol **20**, 不带symbol **50**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Users-Force-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称            | 类型     | 是否必需 | 描述                                  |
|---------------|--------|------|-------------------------------------|
| symbol        | STRING | NO   |                                     |
| autoCloseType | ENUM   | NO   | "LIQUIDATION": 强平单, "ADL": ADL 减仓单. |
| startTime     | LONG   | NO   |                                     |
| endTime       | LONG   | NO   |                                     |
| limit         | INT    | NO   | Default 50; max 100.                |
| recvWindow    | LONG   | NO   |                                     |
| timestamp     | LONG   | YES  |                                     |

> - 如果没有传 "autoCloseType", 强平单和 ADL 减仓单都会被返回
> - 如果没有传"startTime", 只会返回"endTime"之前 7 天内的数据
> - 本接口仅支持最近90天数据的查询

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Users-Force-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
  	"orderId": 6071832819,
  	"symbol": "BTCUSDT",
  	"status": "FILLED",
  	"clientOrderId": "autoclose-1596107620040000020",
  	"price": "10871.09",
  	"avgPrice": "10913.21000",
  	"origQty": "0.001",
  	"executedQty": "0.001",
  	"cumQuote": "10.91321",
  	"timeInForce": "IOC",
  	"type": "LIMIT",
  	"reduceOnly": false,
  	"closePosition": false,
  	"side": "SELL",
  	"positionSide": "BOTH",
  	"stopPrice": "0",
  	"workingType": "CONTRACT_PRICE",
  	"origType": "LIMIT",
  	"time": 1596107620044,
  	"updateTime": 1596107620087
  }
  {
   	"orderId": 6072734303,
   	"symbol": "BTCUSDT",
   	"status": "FILLED",
   	"clientOrderId": "adl_autoclose",
   	"price": "11023.14",
   	"avgPrice": "10979.82000",
   	"origQty": "0.001",
   	"executedQty": "0.001",
   	"cumQuote": "10.97982",
   	"timeInForce": "GTC",
   	"type": "LIMIT",
   	"reduceOnly": false,
   	"closePosition": false,
   	"side": "BUY",
   	"positionSide": "SHORT",
   	"stopPrice": "0",
   	"workingType": "CONTRACT_PRICE",
   	"origType": "LIMIT",
   	"time": 1596110725059,
   	"updateTime": 1596110725071
  }
]
```