# 杠杆账户OTO下单 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTO#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

发送一个新的 OTO 订单。

- 一个 OTO 订单（One-Triggers-the-Other）是一个包含了两个订单的订单列表.
- 第一个订单被称为**生效订单**，必须为 `LIMIT` 或 `LIMIT_MAKER` 类型的订单。最初，订单簿上只有生效订单。
- 第二个订单被称为**待处理订单**。它可以是任何订单类型，但不包括使用参数 `quoteOrderQty` 的 `MARKET` 订单。只有当生效订单**完全成交**时，待处理订单才会被自动下单。
- 如果生效订单或者待处理订单中的任意一个被单独取消，订单列表中剩余的那个订单也会被随之取消或过期。
- 如果生效订单在下订单列表后**立即完全成交**，则可能会得到订单响应。其中，生效订单的状态为 `FILLED` ，但待处理订单的状态为 `PENDING_NEW`。针对这类情况，如果需要检查当前状态，您可以查询相关的待处理订单。
- `OTO` 订单将**2 个订单**添加到未成交订单计数，`EXCHANGE_MAX_NUM_ORDERS` 过滤器和 `MAX_NUM_ORDERS` 过滤器中。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTO#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/order/oto`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTO#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**6(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTO#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

名称类型是否必需描述

symbolSTRINGYES

isIsolatedSTRINGNO是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE"

listClientOrderIdSTRINGNO整个订单列表的唯一ID。 如果未发送则自动生成。  
仅当前一个订单列表已填满或完全过期时，才会接受含有相同 `listClientOrderId` 值的新订单列表。`listClientOrderId` 与 `workingClientOrderId` 和 `pendingClientOrderId` 不同。

newOrderRespTypeENUMNO设置响应: JSON. ACK, RESULT, 或 FULL; MARKET 和 LIMIT 订单类型默认为 FULL, 所有其他订单默认为 ACK.

sideEffectTypeENUMNONO\_SIDE\_EFFECT, MARGIN\_BUY ;默认为 NO\_SIDE\_EFFECT. 详见[FAQ](https://www.binance.com/zh-CN/support/faq/%E6%A7%93%E6%A1%BF%E4%B8%8B%E5%8D%95%E6%8E%A5%E5%8F%A3%E5%8F%82%E6%95%B0sideeffecttype%E8%AF%A6%E8%A7%A3-f9fc51cda1984bf08b95e0d96c4570bc)

selfTradePreventionModeENUMNO允许的 ENUM 取决于交易对的配置。支持的值有 EXPIRE\_TAKER，EXPIRE\_MAKER，EXPIRE\_BOTH，NONE

autoRepayAtCancelBOOLEANNO只有在自动借款单生效时，true表示的是撤单后需要把订单产生的借款归还，默认为true

workingTypeENUMYES支持的数值： `LIMIT`， `LIMIT_MAKER`

workingSideENUMYESBUY, SELL

workingClientOrderIdSTRINGNO用于标识生效订单的唯一ID。如果未发送则自动生成。

workingPriceDECIMALYES

workingQuantityDECIMALYES用于设置生效订单的数量。

workingIcebergQtyDECIMALYES只有当 `workingTimeInForce` 为 `GTC` 时才能使用。

workingTimeInForceENUMNO有效值 `GTC`/`FOK`/`IOC`

pendingTypeENUMYES支持的数值： [订单类型](https://developers.binance.com/docs/binance-spot-api-docs/enums#order-types-ordertypes-type), 请注意，系统不支持使用 `quoteOrderQty` 的 `MARKET` 订单。

pendingSideENUMYESBUY, SELL

pendingClientOrderIdSTRINGNO用于标识待处理订单的唯一ID。如果未发送则自动生成。

pendingPriceDECIMALNO

pendingStopPriceDECIMALNO

pendingTrailingDeltaDECIMALNO

pendingQuantityDECIMALYES用于设置待处理订单的数量。

pendingIcebergQtyDECIMALNO只有当 `pendingTimeInForce` 为 `GTC` 时才能使用。

pendingTimeInForceENUMNOGTC,IOC,FOK

- autoRepayAtCancel补充说明： 在频繁下单撤单的情况下，为提高资金利用率，建议设置为FALSE
- 根据 pendingType 或者workingType的不同值，对于某些可选参数有强制要求，具体如下：
  
  | 类型                                                      | 强制要求的参数                                                                             | 其他信息 |
  |---------------------------------------------------------|-------------------------------------------------------------------------------------|------|
  | `workingType` = `LIMIT`                                 | `workingTimeInForce`                                                                |      |
  | `pendingType` = `LIMIT`                                 | `pendingPrice`， `pendingTimeInForce`                                                |      |
  | `pendingType` = `STOP_LOSS` 或 `TAKE_PROFIT`             | `pendingStopPrice` 与/或 `pendingTrailingDelta`                                       |      |
  | `pendingType` = `STOP_LOSS_LIMIT` 或 `TAKE_PROFIT_LIMIT` | `pendingPrice`， `pendingStopPrice` 与/或 `pendingTrailingDelta`， `pendingTimeInForce` |      |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTO#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "orderListId": 13551,
    "contingencyType": "OTO",
    "listStatusType": "EXEC_STARTED",
    "listOrderStatus": "EXECUTING",
    "listClientOrderId": "JDuOrsu0Ge8GTyvx8J7VTD",
    "transactionTime": 1725521998054,
    "symbol": "BTCUSDT",
    "isIsolated": false,
    "orders": [
        {
            "symbol": "BTCUSDT",
            "orderId": 29896699,
            "clientOrderId": "y8RB6tQEMuHUXybqbtzTxk"
        },
        {
            "symbol": "BTCUSDT",
            "orderId": 29896700,
            "clientOrderId": "dKQEdh5HhXb7Lpp85jz1dQ"
        }
    ],
    "orderReports": [
        {
            "symbol": "BTCUSDT",
            "orderId": 29896699,
            "orderListId": 13551,
            "clientOrderId": "y8RB6tQEMuHUXybqbtzTxk",
            "transactTime": 1725521998054,
            "price": "80000.00000000",
            "origQty": "0.02000000",
            "executedQty": "0",
            "cummulativeQuoteQty": "0",
            "status": "NEW",
            "timeInForce": "GTC",
            "type": "LIMIT",
            "side": "SELL",
            "selfTradePreventionMode": "NONE"
        },
        {
            "symbol": "BTCUSDT",
            "orderId": 29896700,
            "orderListId": 13551,
            "clientOrderId": "dKQEdh5HhXb7Lpp85jz1dQ",
            "transactTime": 1725521998054,
            "price": "50000.00000000",
            "origQty": "0.02000000",
            "executedQty": "0",
            "cummulativeQuoteQty": "0",
            "status": "PENDING_NEW",
            "timeInForce": "GTC",
            "type": "LIMIT",
            "side": "BUY",
            "selfTradePreventionMode": "NONE"
        }
    ]
}
```