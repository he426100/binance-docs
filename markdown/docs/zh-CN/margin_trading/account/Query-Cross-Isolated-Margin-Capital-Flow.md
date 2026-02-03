# 查询全仓/逐仓资金流水 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Isolated-Margin-Capital-Flow#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询全仓/逐仓资金流水

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Isolated-Margin-Capital-Flow#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/capital-flow`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Isolated-Margin-Capital-Flow#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**100(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Isolated-Margin-Capital-Flow#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                        |
|------------|--------|------|-------------------------------------------|
| asset      | STRING | NO   |                                           |
| symbol     | STRING | NO   | 查询逐仓数据时必填                                 |
| type       | STRING | NO   |                                           |
| startTime  | LONG   | NO   | 只支持查询最近90天的数据                             |
| endTime    | LONG   | NO   |                                           |
| fromId     | LONG   | NO   | 如设置fromId, 将返回id &gt; fromId的数据。否则将返回最新数据 |
| limit      | LONG   | NO   | 每次返回的数据条数限制。默认 500; 最大 1000.              |
| recvWindow | LONG   | NO   | 赋值不能大于 `60000`                            |
| timestamp  | LONG   | YES  |                                           |

- 只支持查询最近90天的数据
- startTime 和 endTime 的最大间隔为7天
- 如设置`fromId`, 将返回`id` &gt; `fromId`的数据。否则将返回最新订单。
- 查询逐仓数据，需要输入`symbol`
- 支持的type:
  
  - TRANSFER("Transfer", "转账")
  - BORROW("Borrow", "借款")
  - REPAY("Repay", "还款")
  - BUY\_INCOME("Buy-Trading Income", "买单-交易收入")
  - BUY\_EXPENSE("Buy-Trading Expense", "买单-交易支出")
  - SELL\_INCOME("Sell-Trading Income", "卖单-交易收入")
  - SELL\_EXPENSE("Sell-Trading Expense", "卖单-交易支出")
  - TRADING\_COMMISSION("Trading Commission", "交易手续费")
  - BUY\_LIQUIDATION("Buy by Liquidation", "强平买入")
  - SELL\_LIQUIDATION("Sell by Liquidation", "强平卖出")
  - REPAY\_LIQUIDATION("Repay by Liquidation", "强平还款")
  - OTHER\_LIQUIDATION("Other Liquidation", "其他强平")
  - LIQUIDATION\_FEE("Liquidation Fee", "强平清算费用")
  - SMALL\_BALANCE\_CONVERT("Small Balance Convert", "小额兑换")
  - COMMISSION\_RETURN("Commission Return", "手续费返还")
  - SMALL\_CONVERT("Small Convert", "强平小额转换")

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Isolated-Margin-Capital-Flow#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  { 
    "id": 123456,
    "tranId": 123123,
    "timestamp": 1691116657000,
    "asset": "USDT",
    "symbol": "BTCUSDT",
    "type": "BORROW",
    "amount": "101"
  },
  {
    "id": 123457,
    "tranId": 123124,
    "timestamp": 1691116658000,
    "asset": "BTC",
    "symbol": "BTCUSDT",
    "type": "REPAY",
    "amount": "10"
  }
]
```