# 杠杆账户下单 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-Order#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

杠杆账户下单

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-Order#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/order`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-Order#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**6(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-Order#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

名称类型是否必需描述

symbolSTRINGYES

isIsolatedSTRINGNO是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE"

sideENUMYESBUY

SELL

typeENUMYES详见枚举定义：订单类型

quantityDECIMALNO

quoteOrderQtyDECIMALNO

priceDECIMALNO

stopPriceDECIMALNO与`STOP_LOSS`, `STOP_LOSS_LIMIT`, `TAKE_PROFIT`, 和 `TAKE_PROFIT_LIMIT` 订单一起使用.

newClientOrderIdSTRINGNO客户自定义的唯一订单ID。若未发送自动生成。

icebergQtyDECIMALNO与 `LIMIT`, `STOP_LOSS_LIMIT`, 和 `TAKE_PROFIT_LIMIT` 一起使用创建 iceberg 订单.

newOrderRespTypeENUMNO设置响应: JSON. ACK, RESULT, 或 FULL; MARKET 和 LIMIT 订单类型默认为 FULL, 所有其他订单默认为 ACK.

sideEffectTypeENUMNONO\_SIDE\_EFFECT, MARGIN\_BUY, AUTO\_REPAY,AUTO\_BORROW\_REPAY;默认为 NO\_SIDE\_EFFECT. 详见[FAQ](https://www.binance.com/zh-CN/support/faq/%E6%A7%93%E6%A1%BF%E4%B8%8B%E5%8D%95%E6%8E%A5%E5%8F%A3%E5%8F%82%E6%95%B0sideeffecttype%E8%AF%A6%E8%A7%A3-f9fc51cda1984bf08b95e0d96c4570bc)

timeInForceENUMNOGTC,IOC,FOK

selfTradePreventionModeENUMNO允许的 ENUM 取决于交易对的配置。支持的值有 EXPIRE\_TAKER，EXPIRE\_MAKER，EXPIRE\_BOTH，NONE

autoRepayAtCancelBOOLEANNO只有在自动借款单或者自动借还单生效，true表示的是撤单后需要把订单产生的借款归还，默认为true

recvWindowLONGNO赋值不能大于 `60000`

timestampLONGYES

- autoRepayAtCancel 补充说明： 在频繁下单撤单的情况下，为提高资金利用率，建议设置为FALSE

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-Order#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> Response ACK:

```javascript
{
  "symbol": "BTCUSDT",
  "orderId": 28,
  "clientOrderId": "6gCrw2kRUAF9CvJDGP16IP",
  "isIsolated": true,       // 是否是逐仓symbol交易
  "transactTime": 1507725176595
}
```

> Response RESULT:

```javascript
{
    "symbol": "BTCUSDT",
    "orderId": 26769564559,
    "clientOrderId": "E156O3KP4gOif65bjuUK5V",
    "transactTime": 1713873075893,
    "price": "0",
    "origQty": "0.001",
    "executedQty": "0.001",
    "cummulativeQuoteQty": "65982.53",
    "status": "FILLED",
    "timeInForce": "GTC",
    "type": "MARKET",
    "side": "SELL",
    "isIsolated": false,   // 是否是逐仓symbol交易
    "selfTradePreventionMode": "EXPIRE_MAKER"
}
```

> Response FULL:

```javascript
{
    "symbol": "BTCUSDT",
    "orderId": 26769564559,
    "clientOrderId": "E156O3KP4gOif65bjuUK5V",
    "transactTime": 1713873075893,
    "price": "0",
    "origQty": "0.001",
    "executedQty": "0.001",
    "cummulativeQuoteQty": "65.98253",
    "status": "FILLED",
    "timeInForce": "GTC",
    "type": "MARKET",
    "side": "SELL",
    "marginBuyBorrowAmount": 5,       // 下单后没有发生借款则不返回该字段
    "marginBuyBorrowAsset": "BTC",    // 下单后没有发生借款则不返回该字段
    "fills": [
        {
            "price": "65982.53",
            "qty": "0.001",
            "commission": "0.06598253",
            "commissionAsset": "USDT",
            "tradeId": 3570680726
        }
    ],
    "isIsolated": false,
    "selfTradePreventionMode": "EXPIRE_MAKER"
}
```

**常见错误代码：**

- **ASSET\_BAN\_TRADE**
  
  该错误提示 {“code”: -3067, “msg”: “This asset is currently not a supported margin asset, please try another asset.”} 表明该资产当前存在使用限制，可能是由于监管要求等原因导致其无法进行借贷。建议您通过币安官方渠道查询该资产借贷状态的相关公告和最新动态。
- **NOT\_VALID\_MARGIN\_ASSET**
  
  该错误 {“code”: -3027, “msg”: “Not a valid margin asset.”} 通常出现在用户请求的资产已被下架或不在杠杆交易支持范围内。建议用户在交易前，通过接口 [GET /sapi/v1/margin/allAssets](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets) 查询所有支持的杠杆资产列表，以确保所选资产可用。
- **BALANCE\_NOT\_CLEARED**
  
  错误提示 {“code”: -3041, “msg”: “Balance is not enough.”} 说明账户余额不足以支持当前的交易请求，请确保账户中有足够资金后再进行操作。
- **TOO\_MANY\_ORDERS**
  
  错误提示 {“code”: -1015, “msg”: “Too many new orders; current limit is %s orders per %s.”} 说明您在规定时间内的下单数量已达上限。建议您：
  
  - 检查并清理当前未成交订单，取消不必要的订单以腾出下单空间。
  - 尽量错开下单时间，避免短时间内大量下单导致超出限额。
- **Filter failure: NOTIONAL**
  
  错误提示 {“code”:-20204, “msg”: “Filter failure: NOTIONAL.”} 表明您的订单请求未通过系统校验，未进入撮合引擎，主要原因是订单金额低于最低名义价值限制。请仔细检查订单参数，调整订单金额，以符合平台的最小交易额要求，从而避免该错误提示。
- **NOT\_VALID\_MARGIN\_PAIR**
  
  该错误 {“code”: -3028, “msg”: “Not a valid margin pair.”} 通常出现在用户请求的资产已被下架或不在杠杆交易支持范围内。建议用户在交易前，通过接口 [GET /sapi/v1/margin/allAssets](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets) 查询所有支持的杠杆资产列表，以确保所选资产可用。
- **NEW\_ORDER\_REJECTED**
  
  错误提示 {“code”: -2010, “msg”: “NEW\_ORDER\_REJECTED”} 通常有两种常见原因：
  
  - 您设置的限价单价格与当前市场价相符，导致订单会被立即成交成为市价单，如果您想避免支付吃单手续费，建议调整限价单价格，使其偏离当前市场价。
  - 您的账户余额不足以支持该订单。您可以通过增加账户资金或降低订单规模，以确保订单金额不超过可用余额。
- **EXCEED\_PRICE\_LIMIT**
  
  错误提示 {“code”: -3064, “msg”: “Limit price needs to be within (-15%,15%) of current index price for this margin trading pair.”} 通常出现在限价价格超出允许范围的情况下。对于某些流动性较低的交易对，或杠杆交易中的稳定币对稳定币交易对（如 USDT/DAI），限价价格必须保持在当前指数价格的±15%区间内（该区间可能会调整）。
  
  若买入订单的限价高于当前指数价超过15%，或卖出订单的限价低于当前指数价超过15%，系统将拒绝该订单并返回此错误提示。