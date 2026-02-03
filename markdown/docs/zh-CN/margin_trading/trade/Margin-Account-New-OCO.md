# 杠杆账户 OCO 下单(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OCO#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

杠杆账户发送新 OCO 订单。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OCO#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST /sapi/v1/margin/order/oco

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OCO#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**6(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OCO#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                      | 类型      | 是否必需 | 描述                                                                                                                                                                                                                                                                                |
|-------------------------|---------|------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| symbol                  | STRING  | YES  |                                                                                                                                                                                                                                                                                   |
| isIsolated              | STRING  | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE"                                                                                                                                                                                                                                                |
| listClientOrderId       | STRING  | NO   | 整个orderList的唯一ID                                                                                                                                                                                                                                                                  |
| side                    | ENUM    | YES  | 详见枚举定义：订单方向                                                                                                                                                                                                                                                                       |
| quantity                | DECIMAL | YES  |                                                                                                                                                                                                                                                                                   |
| limitClientOrderId      | STRING  | NO   | 限价单的唯一ID                                                                                                                                                                                                                                                                          |
| price                   | DECIMAL | YES  |                                                                                                                                                                                                                                                                                   |
| limitIcebergQty         | DECIMAL | NO   |                                                                                                                                                                                                                                                                                   |
| stopClientOrderId       | STRING  | NO   | 止损/止损限价单的唯一ID                                                                                                                                                                                                                                                                     |
| stopPrice               | DECIMAL | YES  |                                                                                                                                                                                                                                                                                   |
| stopLimitPrice          | DECIMAL | NO   | 如果提供，须配合提交`stopLimitTimeInForce`                                                                                                                                                                                                                                                  |
| stopIcebergQty          | DECIMAL | NO   |                                                                                                                                                                                                                                                                                   |
| stopLimitTimeInForce    | ENUM    | NO   | 有效值 `GTC`/`FOK`/`IOC`                                                                                                                                                                                                                                                             |
| newOrderRespType        | ENUM    | NO   | 详见枚举定义：订单返回类型                                                                                                                                                                                                                                                                     |
| sideEffectType          | ENUM    | NO   | NO\_SIDE\_EFFECT, MARGIN\_BUY, AUTO\_REPAY,AUTO\_BORROW\_REPAY; 默认为 NO\_SIDE\_EFFECT;详见[FAQ](https://www.binance.com/zh-CN/support/faq/%E6%A7%93%E6%A1%BF%E4%B8%8B%E5%8D%95%E6%8E%A5%E5%8F%A3%E5%8F%82%E6%95%B0sideeffecttype%E8%AF%A6%E8%A7%A3-f9fc51cda1984bf08b95e0d96c4570bc) |
| selfTradePreventionMode | ENUM    | NO   | 允许的 ENUM 取决于交易对的配置。支持的值有 EXPIRE\_TAKER，EXPIRE\_MAKER，EXPIRE\_BOTH，NONE                                                                                                                                                                                                            |
| autoRepayAtCancel       | BOOLEAN | NO   | 只有在自动借款单或者自动借还单生效，true表示的是撤单后需要把订单产生的借款归还，默认为true                                                                                                                                                                                                                                 |
| recvWindow              | LONG    | NO   | 不能大于 `60000`                                                                                                                                                                                                                                                                      |
| timestamp               | LONG    | YES  |                                                                                                                                                                                                                                                                                   |

- autoRepayAtCancel 补充说明： 在频繁下单撤单的情况下，为提高资金利用率，建议设置为FALSE

其他信息:

- 价格限制:
  
  - `SELL`: 限价 &gt; 最新成交价 &gt;触发价
  - `BUY`: 限价 &lt; 最新成交价 &lt; 触发价
- 数量限制:
  
  - 两个 legs 必须具有同样的数量。
  - `ICEBERG`数量不必相同
- 下单rate
  
  - 一个`OCO`订单被算成2个普通订单.

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OCO#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "orderListId": 0,
  "contingencyType": "OCO",
  "listStatusType": "EXEC_STARTED",
  "listOrderStatus": "EXECUTING",
  "listClientOrderId": "JYVpp3F0f5CAG15DhtrqLp",
  "transactionTime": 1563417480525,
  "symbol": "LTCBTC",
  "marginBuyBorrowAmount": "5",       // 下单后没有发生借款则不返回该字段
  "marginBuyBorrowAsset": "BTC",    // 下单后没有发生借款则不返回该字段
  "isIsolated": false,       // 是否是逐仓symbol交易
  "orders": [
    {
      "symbol": "LTCBTC",
      "orderId": 2,
      "clientOrderId": "Kk7sqHb9J6mJWTMDVW7Vos"
    },
    {
      "symbol": "LTCBTC",
      "orderId": 3,
      "clientOrderId": "xTXKaGYd4bluPVp78IVRvl"
    }
  ],
  "orderReports": [
    {
      "symbol": "LTCBTC",
      "orderId": 2,
      "orderListId": 0,
      "clientOrderId": "Kk7sqHb9J6mJWTMDVW7Vos",
      "transactTime": 1563417480525,
      "price": "0.000000",
      "origQty": "0.624363",
      "executedQty": "0.000000",
      "cummulativeQuoteQty": "0.000000",
      "status": "NEW",
      "timeInForce": "GTC",
      "type": "STOP_LOSS",
      "side": "BUY",
      "stopPrice": "0.960664",
      "selfTradePreventionMode": "NONE"
    },
    {
      "symbol": "LTCBTC",
      "orderId": 3,
      "orderListId": 0,
      "clientOrderId": "xTXKaGYd4bluPVp78IVRvl",
      "transactTime": 1563417480525,
      "price": "0.036435",
      "origQty": "0.624363",
      "executedQty": "0.000000",
      "cummulativeQuoteQty": "0.000000",
      "status": "NEW",
      "timeInForce": "GTC",
      "type": "LIMIT_MAKER",
      "side": "BUY",
      "selfTradePreventionMode": "NONE"
    }
  ]
}
```