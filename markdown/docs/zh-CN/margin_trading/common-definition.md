# 公开 API 参数

## 术语[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#%E6%9C%AF%E8%AF%AD "术语的直接链接")

这里的术语适用于全部文档，建议特别是新手熟读，也便于理解。

- `base asset` 指一个交易对的交易对象，即写在靠前部分的资产名, 比如`BTCUSDT`, `BTC`是`base asset`。
- `quote asset` 指一个交易对的定价资产，即写在靠后部分的资产名, 比如`BTCUSDT`, `USDT`是`quote asset`。

## 枚举定义[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#%E6%9E%9A%E4%B8%BE%E5%AE%9A%E4%B9%89 "枚举定义的直接链接")

**交易对状态 (状态 status):**

- `PRE_TRADING` 交易前
- `TRADING` 交易中
- `POST_TRADING` 交易后
- `END_OF_DAY`
- `HALT`
- `AUCTION_MATCH`
- `BREAK`

[](https://developers.binance.com)

**交易对类型:**

- `SPOT` 现货
- `MARGIN` 杠杆
- `LEVERAGED` 杠杆代币
- `TRD_GRP_002` 交易组 002
- `TRD_GRP_003` 交易组 003
- `TRD_GRP_004` 交易组 004
- `TRD_GRP_005` 交易组 005
- `TRD_GRP_006` 交易组 006
- `TRD_GRP_007` 交易组 007
- `TRD_GRP_008` 交易组 008
- `TRD_GRP_009` 交易组 009
- `TRD_GRP_010` 交易组 010
- `TRD_GRP_011` 交易组 011
- `TRD_GRP_012` 交易组 012
- `TRD_GRP_013` 交易组 013
- `TRD_GRP_014` 交易组 014

**订单状态 (状态 status):**

状态描述

`NEW`订单被交易引擎接

`PARTIALLY_FILLED`部分订单被成交

`FILLED`订单完全成交

`CANCELED`用户撤销了订单

`PENDING_CANCEL`撤销中（目前并未使用）

`REJECTED`订单没有被交易引擎接受，也没被处理

`EXPIRED`订单被交易引擎取消，比如：

LIMIT FOK 订单没有成交

市价单没有完全成交

强平期间被取消的订单

交易所维护期间被取消的订单

`EXPIRED_IN_MATCH`表示订单由于 STP 触发而过期 （e.g. 带有 `EXPIRE_TAKER` 的订单与订单簿上属于同账户或同 `tradeGroupId` 的订单撮合）

**OCO 状态 (状态类型集 listStatusType):**

| 状态             | 描述                                 |
|----------------|------------------------------------|
| `RESPONSE`     | 当ListStatus响应失败的操作时使用。 (订单完成或取消订单) |
| `EXEC_STARTED` | 当已经下单或者订单有更新时                      |
| `ALL_DONE`     | 当订单执行结束或者不在激活状态                    |

**OCO 订单状态 (订单状态集 listOrderStatus):**

| 状态          | 描述                   |
|-------------|----------------------|
| `EXECUTING` | 当已经下单或者订单有更新时        |
| `ALL_DONE`  | 当订单执行结束或者不在激活状态      |
| `REJECT`    | 当订单状态响应失败(订单完成或取消订单) |

**指定订单的类型**

- `OCO` 选择性委托订单

**分配类型 (allocationtype, type):**

- `SOR` 智能订单路由

**工作平台**

- `EXCHANGE` - 常规交易
- `SOR` - 智能订单路由

**订单类型 (orderTypes, type):**

- `LIMIT` 限价单
- `MARKET` 市价单
- `STOP_LOSS` 止损单
- `STOP_LOSS_LIMIT` 限价止损单
- `TAKE_PROFIT` 止盈单
- `TAKE_PROFIT_LIMIT` 限价止盈单
- `LIMIT_MAKER` 限价只挂单

**订单返回类型 (newOrderRespType):**

- `ACK`
- `RESULT`
- `FULL`

**订单方向 (方向 side):**

- `BUY` 买入
- `SELL` 卖出

**有效方式 (timeInForce):**

这里定义了订单多久能够失效

状态描述

`GTC`成交为止

订单会一直有效，直到被成交或者取消。

`IOC`无法立即成交的部分就撤销

订单在失效前会尽量多的成交。

`FOK`无法全部立即成交就撤销

如果无法全部成交，订单会失效。

**K线间隔:**

s -&gt; 秒; m -&gt; 分钟; h -&gt; 小时; d -&gt; 天; w -&gt; 周; M -&gt; 月

- 1s
- 1m
- 3m
- 5m
- 15m
- 30m
- 1h
- 2h
- 4h
- 6h
- 8h
- 12h
- 1d
- 3d
- 1w
- 1M

**限制种类 (rateLimitType)**

> REQUEST\_WEIGHT

```json
    {
      "rateLimitType": "REQUEST_WEIGHT",
      "interval": "MINUTE",
      "intervalNum": 1,
      "limit": 6000
    }
```

> ORDERS

```json
    {
      "rateLimitType": "ORDERS",
      "interval": "SECOND",
      "intervalNum": 10,
      "limit": 100
    },
    {
      "rateLimitType": "ORDERS",
      "interval": "DAY",
      "intervalNum": 1,
      "limit": 200000
    }
```

> RAW\_REQUESTS

```json
    {
      "rateLimitType": "RAW_REQUESTS",
      "interval": "MINUTE",
      "intervalNum": 5,
      "limit": 5000
    }
```

- REQUEST\_WEIGHT 单位时间请求权重之和上限
- ORDERS 单位时间下单次数限制
- RAW\_REQUESTS 单位时间请求次数上限

**限制间隔 (interval)**

- SECOND 秒
- MINUTE 分
- DAY 天

# 过滤器

过滤器，即Filter，定义了一系列交易规则。 共有两类，分别是针对交易对的过滤器`symbol filters`，和针对整个交易所的过滤器 `exchange filters`

## 交易对过滤器[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#%E4%BA%A4%E6%98%93%E5%AF%B9%E8%BF%87%E6%BB%A4%E5%99%A8 "交易对过滤器的直接链接")

### PRICE\_FILTER 价格过滤器[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#price_filter-%E4%BB%B7%E6%A0%BC%E8%BF%87%E6%BB%A4%E5%99%A8 "PRICE_FILTER 价格过滤器的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "PRICE_FILTER",
    "minPrice": "0.00000100",
    "maxPrice": "100000.00000000",
    "tickSize": "0.00000100"
  }
```

`价格过滤器` 用于检测订单中 `price` 参数的合法性。包含以下三个部分:

- `minPrice` 定义了 `price`/`stopPrice` 允许的最小值。
- `maxPrice` 定义了 `price`/`stopPrice` 允许的最大值。
- `tickSize` 定义了 `price`/`stopPrice` 的步进间隔，即price必须等于minPrice+(tickSize的整数倍)

以上每一项均可为0，为0时代表这一项不再做限制。

逻辑伪代码如下:

- `price` &gt;= `minPrice`
- `price` &lt;= `maxPrice`
- `price` % `tickSize` == 0

### PERCENT\_PRICE 价格振幅过滤器[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#percent_price-%E4%BB%B7%E6%A0%BC%E6%8C%AF%E5%B9%85%E8%BF%87%E6%BB%A4%E5%99%A8 "PERCENT_PRICE 价格振幅过滤器的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "PERCENT_PRICE",
    "multiplierUp": "5",
    "multiplierDown": "0.2",
    "avgPriceMins": 5
  }
```

`PERCENT_PRICE`过滤器基于先前交易的平均值来定义价格的有效范围。  
`avgPriceMins`是计算平均价格的分钟数。 0表示使用最后的价格。

为了通过"价格百分比"，"价格"必须符合以下条件：

- `price` &lt;=`weightedAveragePrice` \*`multiplierUp`
- `price`&gt; =`weightedAveragePrice` \*`multiplierDown`

### PERCENT\_PRICE\_BY\_SIDE 基于买卖方向的价格振幅过滤器[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#percent_price_by_side-%E5%9F%BA%E4%BA%8E%E4%B9%B0%E5%8D%96%E6%96%B9%E5%90%91%E7%9A%84%E4%BB%B7%E6%A0%BC%E6%8C%AF%E5%B9%85%E8%BF%87%E6%BB%A4%E5%99%A8 "PERCENT_PRICE_BY_SIDE 基于买卖方向的价格振幅过滤器的直接链接")

> **ExchangeInfo format:**

```javascript
    {
          "filterType": "PERCENT_PRICE_BY_SIDE",
          "bidMultiplierUp": "1.2",
          "bidMultiplierDown": "0.2",
          "askMultiplierUp": "5",
          "askMultiplierDown": "0.8",
          "avgPriceMins": 1
    }
```

`PERCENT_PRICE_BY_SIDE` 过滤器定义了基于交易对平均价格的合法价格范围. 取决于`BUY`或者`SELL`, 价格范围可能有所不同.

`avgPriceMins` 是用来计算平均价格的分钟数. 0 表示用最新价(last price).

买向订单需要满足:

- `Order price` &lt;= `weightedAveragePrice` * `bidMultiplierUp`
- `Order price` &gt;= `weightedAveragePrice` * `bidMultiplierDown`

卖向订单需要满足:

- `Order Price` &lt;= `weightedAveragePrice` * `askMultiplierUp`
- `Order Price` &gt;= `weightedAveragePrice` * `askMultiplierDown`

### LOT\_SIZE 订单尺寸[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#lot_size-%E8%AE%A2%E5%8D%95%E5%B0%BA%E5%AF%B8 "LOT_SIZE 订单尺寸的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "LOT_SIZE",
    "minQty": "0.00100000",
    "maxQty": "100000.00000000",
    "stepSize": "0.00100000"
  }
```

Lots是拍卖术语，`LOT_SIZE` 过滤器对订单中的 `quantity` 也就是数量参数进行合法性检查。包含三个部分:

- `minQty` 表示 `quantity`/`icebergQty` 允许的最小值。
- `maxQty` 表示 `quantity`/`icebergQty` 允许的最大值。
- `stepSize` 表示 `quantity`/`icebergQty` 允许的步进值。

逻辑伪代码如下:

- `quantity` &gt;= `minQty`
- `quantity` &lt;= `maxQty`
- `quantity` % `stepSize` == 0

### MIN\_NOTIONAL 最小名义价值(成交额)[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#min_notional-%E6%9C%80%E5%B0%8F%E5%90%8D%E4%B9%89%E4%BB%B7%E5%80%BC%E6%88%90%E4%BA%A4%E9%A2%9D "MIN_NOTIONAL 最小名义价值(成交额)的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "MIN_NOTIONAL",
    "minNotional": "0.00100000",
    "applyToMarket": true,
    "avgPriceMins": 5
  }
```

MIN\_NOTIONAL过滤器定义了交易对订单所允许的最小名义价值(成交额)。 订单的名义价值是`价格`\*`数量`。 如果是高级订单(比如止盈止损订单`STOP_LOSS_LIMIT`)，名义价值会按照`stopPrice` * `quantity`来计算。 如果是冰山订单，名义价值会按照`price` * `icebergQty`来计算。 `applyToMarket`确定 `MIN_NOTIONAL`过滤器是否也将应用于`MARKET`订单。  
由于`MARKET`订单没有价格，因此会在最后`avgPriceMins`分钟内使用平均价格。  
`avgPriceMins`是计算平均价格的分钟数。 0表示使用最后的价格。

### NOTIONAL 名义价值[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#notional-%E5%90%8D%E4%B9%89%E4%BB%B7%E5%80%BC "NOTIONAL 名义价值的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
{
   "filterType": "NOTIONAL",
   "minNotional": "10.00000000",
   "applyMinToMarket": false,
   "maxNotional": "10000.00000000",
   "applyMaxToMarket": false,
   "avgPriceMins": 5
}
```

名义价值过滤器(`NOTIONAL`)定义了订单在一个交易对上可以下单的名义价值区间.

`applyMinToMarket` 定义了 `minNotional` 是否适用于市价单(`MARKET`)

`applyMaxToMarket` 定义了 `maxNotional` 是否适用于市价单(`MARKET`).

要通过此过滤器, 订单的名义价值 (单价 x 数量, `price * quantity`) 需要满足如下条件:

- `price * quantity` &lt;= `maxNotional`
- `price * quantity` &gt;= `minNotional`

对于市价单(`MARKET`), 用于计算的价格采用的是在 `avgPriceMins` 定义的时间之内的平均价.

如果 `avgPriceMins` 为 0, 则采用最新的价格.

### ICEBERG\_PARTS 冰山订单拆分数[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#iceberg_parts-%E5%86%B0%E5%B1%B1%E8%AE%A2%E5%8D%95%E6%8B%86%E5%88%86%E6%95%B0 "ICEBERG_PARTS 冰山订单拆分数的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "ICEBERG_PARTS",
    "limit": 10
  }
```

`ICEBERG_PARTS` 代表冰山订单最多可以拆分成多少个小订单。  
计算方法为 `向上取整(qty / icebergQty)`。

### MARKET\_LOT\_SIZE 市价订单尺寸[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#market_lot_size-%E5%B8%82%E4%BB%B7%E8%AE%A2%E5%8D%95%E5%B0%BA%E5%AF%B8 "MARKET_LOT_SIZE 市价订单尺 寸的直接链接")

> \***/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "MARKET_LOT_SIZE",
    "minQty": "0.00100000",
    "maxQty": "100000.00000000",
    "stepSize": "0.00100000"
  }
```

`MARKET_LOT_SIZE`过滤器为交易对上的`MARKET`订单定义了`数量`(即拍卖中的"手数")规则。 共有3部分：

- `minQty`定义了允许的最小`quantity`。
- `maxQty`定义了允许的最大数量。
- `stepSize`定义了可以增加/减少数量的间隔。

为了通过`market lot size`，`quantity`必须满足以下条件：

- `quantity` &gt;= `minQty`
- `quantity` &lt;= `maxQty`
- `quantity` % `stepSize` == 0

### MAX\_NUM\_ORDERS 最多订单数[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#max_num_orders-%E6%9C%80%E5%A4%9A%E8%AE%A2%E5%8D%95%E6%95%B0 "MAX_NUM_ORDERS 最多订单数的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "MAX_NUM_ORDERS",
    "maxNumOrders": 25
  }
```

定义了某个交易对最多允许的挂单数量(不包括已关闭的订单)  
普通订单与条件订单均计算在内

### MAX\_NUM\_ALGO\_ORDERS 最多条件单数[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#max_num_algo_orders-%E6%9C%80%E5%A4%9A%E6%9D%A1%E4%BB%B6%E5%8D%95%E6%95%B0 "MAX_NUM_ALGO_ORDERS 最多条件单数的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "MAX_NUM_ALGO_ORDERS",
    "maxNumAlgoOrders": 5
  }
```

`MAX_NUM_ALGO_ORDERS`过滤器定义允许账户在交易对上开设的"algo"订单的最大数量。  
"Algo"订单是`STOP_LOSS`，`STOP_LOSS_LIMIT`，`TAKE_PROFIT`和`TAKE_PROFIT_LIMIT`止盈止损单。

### MAX\_NUM\_ICEBERG\_ORDERS 最多冰山单数[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#max_num_iceberg_orders-%E6%9C%80%E5%A4%9A%E5%86%B0%E5%B1%B1%E5%8D%95%E6%95%B0 "MAX_NUM_ICEBERG_ORDERS 最多冰山单数的直接链接")

`MAX_NUM_ICEBERG_ORDERS`过滤器定义了允许在交易对上开设账户的`ICEBERG`订单的最大数量。  
`ICEBERG`订单是icebergQty大于0的任何订单。.

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "MAX_NUM_ICEBERG_ORDERS",
    "maxNumIcebergOrders": 5
  }
```

### MAX\_POSITION 过滤器[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#max_position-%E8%BF%87%E6%BB%A4%E5%99%A8 "MAX_POSITION 过滤器的直接链接")

这个过滤器定义账户允许的基于`base asset`的最大仓位。一个用户的仓位可以定义为如下资产的总和:

1. `base asset`的可用余额
2. `base asset`的锁定余额
3. 所有处于open的买单的数量总和

如果用户的仓位大于最大的允许仓位，买单会被拒绝。

如果一个订单的数量(`quantity`) 可能导致持有仓位溢出, 会触发过滤器 `MAX_POSITION`.

> **/exchangeInfo 响应中的格式:**

```javascript
{
  "filterType": "MAX_POSITION",
  "maxPosition": "10.00000000"
}
```

### TRAILING\_DELTA[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#trailing_delta "TRAILING_DELTA的直接链接")

> **ExchangeInfo format:**

```javascript
    {
          "filterType": "TRAILING_DELTA",
          "minTrailingAboveDelta": 10,
          "maxTrailingAboveDelta": 2000,
          "minTrailingBelowDelta": 10,
          "maxTrailingBelowDelta": 2000
   }
```

此过滤器定义了参数`trailingDelta`的最大和最小值.

下追踪止损订单, 需要满足条件:

对于 `STOP_LOSS BUY`, `STOP_LOSS_LIMIT_BUY`, `TAKE_PROFIT SELL` 和 `TAKE_PROFIT_LIMIT SELL` 订单:

- `trailingDelta` &gt;= `minTrailingAboveDelta`
- `trailingDelta` &lt;= `maxTrailingAboveDelta`

对于 `STOP_LOSS SELL`, `STOP_LOSS_LIMIT SELL`, `TAKE_PROFIT BUY`, 和 `TAKE_PROFIT_LIMIT BUY` 订单:

- `trailingDelta` &gt;= `minTrailingBelowDelta`
- `trailingDelta` &lt;= `maxTrailingBelowDelta`

## 交易所级别过滤器[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#%E4%BA%A4%E6%98%93%E6%89%80%E7%BA%A7%E5%88%AB%E8%BF%87%E6%BB%A4%E5%99%A8 "交易所级别过滤器的直接链接")

### EXCHANGE\_MAX\_NUM\_ORDERS 最多订单数[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#exchange_max_num_orders-%E6%9C%80%E5%A4%9A%E8%AE%A2%E5%8D%95%E6%95%B0 "EXCHANGE_MAX_NUM_ORDERS 最多订单数的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "EXCHANGE_MAX_NUM_ORDERS",
    "maxNumOrders": 1000
  }
```

`EXCHANGE_MAX_NUM_ORDERS`过滤器定义了允许在交易对上开设账户的最大订单数。  
请注意，此过滤器同时计算"algo"订单和常规订单。

### EXCHANGE\_MAX\_ALGO\_ORDERS 交易最大ALGO订单数[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#exchange_max_algo_orders-%E4%BA%A4%E6%98%93%E6%9C%80%E5%A4%A7algo%E8%AE%A2%E5%8D%95%E6%95%B0 "EXCHANGE_MAX_ALGO_ORDERS 交易最大ALGO订单数的直接链接")

> **/exchangeInfo 响应中的格式:**

```javascript
  {
    "filterType": "EXCHANGE_MAX_ALGO_ORDERS",
    "maxNumAlgoOrders": 200
  }
```

`EXCHANGE_MAX_ALGO_ORDERS`过滤器定义了允许在交易上开设账户的"algo"订单的最大数量。  
"Algo"订单是`STOP_LOSS`，`STOP_LOSS_LIMIT`，`TAKE_PROFIT`和`TAKE_PROFIT_LIMIT`订单。

### EXCHANGE\_MAX\_NUM\_ICEBERG\_ORDERS 冰山订单的最大订单数[​](https://developers.binance.com/docs/zh-CN/margin_trading/common-definition#exchange_max_num_iceberg_orders--%E5%86%B0%E5%B1%B1%E8%AE%A2%E5%8D%95%E7%9A%84%E6%9C%80%E5%A4%A7%E8%AE%A2%E5%8D%95%E6%95%B0 "EXCHANGE_MAX_NUM_ICEBERG_ORDERS 冰山订单的最大订单数的直接链接")

此过滤器定义了允许账号持有的最大冰山订单数量.

> **/exchangeInfo 响应中的格式:**

```javascript
{
  "filterType": "EXCHANGE_MAX_NUM_ICEBERG_ORDERS",
  "maxNumIcebergOrders": 10000
}
```