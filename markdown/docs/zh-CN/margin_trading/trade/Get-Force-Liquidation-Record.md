# 获取账户强制平仓记录(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Force-Liquidation-Record#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取账户强制平仓记录

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Force-Liquidation-Record#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/forceLiquidationRec`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Force-Liquidation-Record#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Force-Liquidation-Record#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称             | 类型     | 是否必需 | 描述                 |
|----------------|--------|------|--------------------|
| startTime      | LONG   | NO   |                    |
| endTime        | LONG   | NO   |                    |
| isolatedSymbol | STRING | NO   |                    |
| current        | LONG   | NO   | 当前查询页。 开始值 1. 默认:1 |
| size           | LONG   | NO   | 默认:10 最大:100       |
| recvWindow     | LONG   | NO   | 赋值不能大于 `60000`     |
| timestamp      | LONG   | YES  |                    |

- 响应返回为降序排列。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Force-Liquidation-Record#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
  {
      "rows": [
          {
              "avgPrice": "0.00388359",
              "executedQty": "31.39000000",
              "orderId": 180015097,
              "price": "0.00388110",
              "qty": "31.39000000",
              "side": "SELL",
              "symbol": "BNBBTC",
              "timeInForce": "GTC",
              "isIsolated": true,
              "updatedTime": 1558941374745
          }
      ],
      "total": 1
  }
```