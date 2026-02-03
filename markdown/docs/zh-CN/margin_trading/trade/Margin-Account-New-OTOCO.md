# 杠杆账户OTOCO下单 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTOCO#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

杠杆账户OTOCO下单：

- 一个 OTOCO 订单（One-Triggers-One-Cancels-the-Other）是一个包含了三个订单的订单列表。
- 第一个订单被称为
  
  生效订单，必须为LIMIT 或 LIMIT\_MAKER类型的订单。最初，订单簿上只有生效订单。
  
  - 生效订单的行为与此一致 OTO。
- 一个OTOCO订单有两个待处理订单（pending above 和 pending below），它们构成了一个 OCO 订单列表。只有当生效订单
  
  完全成交时，待处理订单们才会被自动下单。
  
  - 待处理上方(pending above)订单和待处理下方(pending below)订单都遵循与 OCO 订单列表相同的规则 [Order List OCO](https://developers.binance.com/docs/margin_trading/trade/Margin-Account-New-OCO)。
- `OTOCO` 在未成交订单计数，`EXCHANGE_MAX_NUM_ORDERS` 过滤器和 `MAX_NUM_ORDERS` 过滤器的基础上添加**3个订单**。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTOCO#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/order/otoco`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTOCO#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**6(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTOCO#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                        | Type    | 是否必须 | Description                                                                                                                                                                                                                                       |
|---------------------------|---------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| symbol                    | STRING  | YES  |                                                                                                                                                                                                                                                   |
| isIsolated                | STRING  | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE"                                                                                                                                                                                                                |
| sideEffectType            | ENUM    | NO   | NO\_SIDE\_EFFECT, MARGIN\_BUY ;默认为 NO\_SIDE\_EFFECT. 详见[FAQ](https://www.binance.com/zh-CN/support/faq/%E6%A7%93%E6%A1%BF%E4%B8%8B%E5%8D%95%E6%8E%A5%E5%8F%A3%E5%8F%82%E6%95%B0sideeffecttype%E8%AF%A6%E8%A7%A3-f9fc51cda1984bf08b95e0d96c4570bc) |
| autoRepayAtCancel         | BOOLEAN | NO   | 只有在自动借款单生效时，true表示的是撤单后需要把订单产生的借款归还，默认为true                                                                                                                                                                                                       |
| listClientOrderId         | STRING  | NO   | 整个订单列表的唯一ID。 如果未发送则自动生成。仅当前一个订单列表已填满或完全过期时，才会接受含有相同 `listClientOrderId` 值的新订单列表。`listClientOrderId` 与 `workingClientOrderId`， `pendingAboveClientOrderId` 以及 `pendingBelowClientOrderId` 不同。                                                      |
| newOrderRespType          | ENUM    | NO   | 设置响应: JSON. ACK, RESULT, 或 FULL; MARKET 和 LIMIT 订单类型默认为 FULL, 所有其他订单默认为 ACK.                                                                                                                                                                      |
| selfTradePreventionMode   | ENUM    | NO   | 允许的 ENUM 取决于交易对的配置。支持的值有 EXPIRE\_TAKER，EXPIRE\_MAKER，EXPIRE\_BOTH，NONE                                                                                                                                                                            |
| workingType               | ENUM    | YES  | 支持的数值： `LIMIT`， `LIMIT_MAKER`                                                                                                                                                                                                                     |
| workingSide               | ENUM    | YES  | BUY, SELL                                                                                                                                                                                                                                         |
| workingClientOrderId      | STRING  | NO   | 用于标识生效订单的唯一ID。如果未发送则自动生成。                                                                                                                                                                                                                         |
| workingPrice              | DECIMAL | YES  |                                                                                                                                                                                                                                                   |
| workingQuantity           | DECIMAL | YES  |                                                                                                                                                                                                                                                   |
| workingIcebergQty         | DECIMAL | NO   | 只有当 `workingTimeInForce` 为 `GTC` 时才能使用。                                                                                                                                                                                                           |
| workingTimeInForce        | ENUM    | NO   | 有效值 `GTC`/`FOK`/`IOC`                                                                                                                                                                                                                             |
| pendingSide               | ENUM    | YES  | BUY, SELL                                                                                                                                                                                                                                         |
| pendingQuantity           | DECIMAL | YES  |                                                                                                                                                                                                                                                   |
| pendingAboveType          | ENUM    | YES  | 支持的数值： `LIMIT_MAKER`，`STOP_LOSS` 和 `STOP_LOSS_LIMIT`                                                                                                                                                                                              |
| pendingAboveClientOrderId | STRING  | NO   | 用于标识待处理上方订单的唯一ID。如果未发送则自动生成。                                                                                                                                                                                                                      |
| pendingAbovePrice         | DECIMAL | NO   |                                                                                                                                                                                                                                                   |
| pendingAboveStopPrice     | DECIMAL | NO   |                                                                                                                                                                                                                                                   |
| pendingAboveTrailingDelta | DECIMAL | NO   |                                                                                                                                                                                                                                                   |
| pendingAboveIcebergQty    | DECIMAL | NO   | 只有当 `pendingAboveTimeInForce` 为 `GTC` 时才能使用。                                                                                                                                                                                                      |
| pendingAboveTimeInForce   | ENUM    | NO   |                                                                                                                                                                                                                                                   |
| pendingBelowType          | ENUM    | NO   | 支持的数值： `LIMIT_MAKER`，`STOP_LOSS` 和 `STOP_LOSS_LIMIT`                                                                                                                                                                                              |
| pendingBelowClientOrderId | STRING  | NO   | 用于标识待处理上方订单的唯一ID。如果未发送则自动生成。                                                                                                                                                                                                                      |
| pendingBelowPrice         | DECIMAL | NO   |                                                                                                                                                                                                                                                   |
| pendingBelowStopPrice     | DECIMAL | NO   |                                                                                                                                                                                                                                                   |
| pendingBelowTrailingDelta | DECIMAL | NO   |                                                                                                                                                                                                                                                   |
| pendingBelowIcebergQty    | DECIMAL | NO   | 只有当 `pendingBelowTimeInForce` 为 `GTC` 时才能使用。                                                                                                                                                                                                      |
| pendingBelowTimeInForce   | ENUM    | NO   |                                                                                                                                                                                                                                                   |

- autoRepayAtCancel 补充说明： 在频繁下单撤单的情况下，为提高资金利用率，建议设置为FALSE
- 根据 `pendingAboveType`， `pendingBelowType` 或者`workingType`的不同值，对于某些可选参数有强制要求，具体如下：
  
  | 类型                                   | 强制要求的参数                                                                                                 | 其他信息 |
  |--------------------------------------|---------------------------------------------------------------------------------------------------------|------|
  | `workingType` = `LIMIT`              | `workingTimeInForce`                                                                                    |      |
  | `pendingAboveType`= `LIMIT_MAKER`    | `pendingAbovePrice`                                                                                     |      |
  | `pendingAboveType`= `STOP_LOSS`      | `pendingAboveStopPrice` 与/或 `pendingAboveTrailingDelta`                                                 |      |
  | `pendingAboveType`=`STOP_LOSS_LIMIT` | `pendingAbovePrice`， `pendingAboveStopPrice` 与/或 `pendingAboveTrailingDelta`， `pendingAboveTimeInForce` |      |
  | `pendingBelowType`= `LIMIT_MAKER`    | `pendingBelowPrice`                                                                                     |      |
  | `pendingBelowType`= `STOP_LOSS`      | `pendingBelowStopPrice` 与/或 `pendingBelowTrailingDelta`                                                 |      |
  | `pendingBelowType`=`STOP_LOSS_LIMIT` | `pendingBelowPrice`， `pendingBelowStopPrice` 与/或 `pendingBelowTrailingDelta`， `pendingBelowTimeInForce` |      |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-OTOCO#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "orderListId": 13509,
    "contingencyType": "OTO",
    "listStatusType": "EXEC_STARTED",
    "listOrderStatus": "EXECUTING",
    "listClientOrderId": "u2AUo48LLef5qVenRtwJZy",
    "transactionTime": 1725521881300,
    "symbol": "BNBUSDT",
    "isIsolated": false,
    "orders": [
        {
            "symbol": "BNBUSDT",
            "orderId": 28282534,
            "clientOrderId": "IfYDxvrZI4kiyqYpRH13iI"
        },
        {
            "symbol": "BNBUSDT",
            "orderId": 28282535,
            "clientOrderId": "0HCSsPRxVfW8BkTUy9z4np"
        },
        {
            "symbol": "BNBUSDT",
            "orderId": 28282536,
            "clientOrderId": "dypsgdxWnLY75kwT930cbD"
        }
    ],
    "orderReports": [
        {
            "symbol": "BNBUSDT",
            "orderId": 28282534,
            "orderListId": 13509,
            "clientOrderId": "IfYDxvrZI4kiyqYpRH13iI",
            "transactTime": 1725521881300,
            "price": "300.00000000",
            "origQty": "1.00000000",
            "executedQty": "0",
            "cummulativeQuoteQty": "0",
            "status": "NEW",
            "timeInForce": "GTC",
            "type": "LIMIT",
            "side": "BUY",
            "selfTradePreventionMode": "NONE"
        },
        {
            "symbol": "BNBUSDT",
            "orderId": 28282535,
            "orderListId": 13509,
            "clientOrderId": "0HCSsPRxVfW8BkTUy9z4np",
            "transactTime": 1725521881300,
            "price": "0E-8",
            "origQty": "1.00000000",
            "executedQty": "0",
            "cummulativeQuoteQty": "0",
            "status": "PENDING_NEW",
            "timeInForce": "GTC",
            "type": "STOP_LOSS",
            "side": "SELL",
            "stopPrice": "299.00000000",
            "selfTradePreventionMode": "NONE"
        },
        {
            "symbol": "BNBUSDT",
            "orderId": 28282536,
            "orderListId": 13509,
            "clientOrderId": "dypsgdxWnLY75kwT930cbD",
            "transactTime": 1725521881300,
            "price": "301.00000000",
            "origQty": "1.00000000",
            "executedQty": "0",
            "cummulativeQuoteQty": "0",
            "status": "PENDING_NEW",
            "timeInForce": "GTC",
            "type": "LIMIT_MAKER",
            "side": "SELL",
            "selfTradePreventionMode": "NONE"
        }
    ]
}
```