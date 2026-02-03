# 最佳实践

### 通过 API 激活并启用杠杆交易[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E9%80%9A%E8%BF%87-api-%E6%BF%80%E6%B4%BB%E5%B9%B6%E5%90%AF%E7%94%A8%E6%9D%A0%E6%9D%86%E4%BA%A4%E6%98%93 "通过 API 激活并启用杠杆交易的直接链接")

#### 在账户中启用杠杆交易[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%9C%A8%E8%B4%A6%E6%88%B7%E4%B8%AD%E5%90%AF%E7%94%A8%E6%9D%A0%E6%9D%86%E4%BA%A4%E6%98%93 "在账户中启用杠杆交易的直接链接")

在使用 API 之前，请确保您的币安账户已启用杠杆交易。首次使用者需要完成杠杆交易测试并同意杠杆交易条款，完成后需将支持的代币转入「全仓杠杆」或「逐仓杠杆」钱包以激活。已有杠杆交易账户的用户，只需将支持的代币转入相应的钱包即可激活杠杆交易钱包。创建 API 密钥时，请务必勾选「允许现货及杠杆交易」、「允许杠杆质押借币、还款和划转」权限，否则杠杆交易相关的 API 请求会被拒绝。为保障账户安全，也建议您在 API 密钥中进行 IP 白名单设置。

更多详情请参考文章[《如何在币安创建API密钥》](https://www.binance.com/zh-CN/support/faq/detail/360002502072)。

如果您需要类似现货交易的低延迟连接，VIP 4 及以上等级用户将自动享有该权限，更多信息请参考「[新建低延迟交易SpecialKey(TRADE)](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Create-Special-Key-of-Low-Latency-Trading)」。

#### 如何避免常见错误：[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%A6%82%E4%BD%95%E9%81%BF%E5%85%8D%E5%B8%B8%E8%A7%81%E9%94%99%E8%AF%AF "如何避免常见错误：的直接链接")

- 账户启用：请确认您的账户已启用杠杆交易，否则 API 调用将返回错误 {"code":-3003, "msg":"Margin account does not exist."}。
- 错误处理：遇到错误 {"code":-2015, "msg":"Invalid API-key, IP, or permissions for action."}，通常表明您的 API 密钥权限不足，请检查 API 密钥设置。

### 充值杠杆交易账户[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%85%85%E5%80%BC%E6%9D%A0%E6%9D%86%E4%BA%A4%E6%98%93%E8%B4%A6%E6%88%B7 "充值杠杆交易账户的直接链接")

开始杠杆交易前，您需要为杠杆交易账户转入资产作为保证金。币安将现货钱包（交易账户）与杠杆交易钱包分开管理。使用全仓杠杆时，需要将资产转入全仓杠杆账户；使用逐仓杠杆时，则需转入该交易对的对应逐仓杠杆账户。

#### 全仓杠杆转账[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%85%A8%E4%BB%93%E6%9D%A0%E6%9D%86%E8%BD%AC%E8%B4%A6 "全仓杠杆转账的直接链接")

用户可调用万向划转接口将资产转入全仓杠杆账户： [POST /sapi/v1/asset/transfer](https://developers.binance.com/docs/zh-CN/wallet/asset/user-universal-transfer)

该接口使用参数 type 指示转账方向：

- MAIN\_MARGIN：从现货账户转入全仓杠杆账户
- UMFUTURE\_MARGIN：从 USDⓈ-M 合约账户转入全仓杠杆账户
- CMFUTURE\_MARGIN：从币本位合约账户转入全仓杠杆账户
- FUNDING\_MARGIN：从资金账户转入全仓杠杆账户
- OPTION\_MARGIN：从期权账户转入全仓杠杆账户

其他必填参数包括 asset（例如 "USDT"、"BTC"）、amount（转账数量，字符串格式）和 timestamp。请确保源账户拥有足够的对应资产可用来转账。

- **请求参数**:

| 名称         | 类型      | 是否必需 | 描述 |
|------------|---------|------|----|
| type       | ENUM    | YES  |    |
| asset      | STRING  | YES  |    |
| amount     | DECIMAL | YES  |    |
| fromSymbol | STRING  | NO   |    |
| toSymbol   | STRING  | NO   |    |
| recvWindow | LONG    | NO   |    |
| timestamp  | LONG    | YES  |    |

#### 逐仓杠杆转账[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E9%80%90%E4%BB%93%E6%9D%A0%E6%9D%86%E8%BD%AC%E8%B4%A6 "逐仓杠杆转账的直接链接")

对于逐仓账户，转账方向的类型如下：

- MARGIN\_ISOLATEDMARGIN：从全仓杠杆账户转入逐仓杠杆账户
- ISOLATEDMARGIN\_ISOLATEDMARGIN：从一个逐仓杠杆账户转入另一个逐仓杠杆账户

当转账方向为 ISOLATEDMARGIN\_MARGIN 和 ISOLATEDMARGIN\_ISOLATEDMARGIN 时，您需要明确指定转出和转入账户，额外需要参数 fromSymbol。

而当转账方向为 MARGIN\_ISOLATEDMARGIN 和 ISOLATEDMARGIN\_ISOLATEDMARGIN 时，则需要指定 toSymbol 参数。

转账成功后，系统会返回如下响应：

{ "tranId": 1234567890 }

该 tranId 可用于查询转账状态（通常成功响应即表示转账完成）。

资金成功转入杠杆交易账户后，您即可凭借保证金进行借贷，接下来您可以借入资金以执行杠杆交易。

#### 如何避免常见错误：[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%A6%82%E4%BD%95%E9%81%BF%E5%85%8D%E5%B8%B8%E8%A7%81%E9%94%99%E8%AF%AF-1 "如何避免常见错误：的直接链接")

- 抵押保证金不足：有时您的抵押抵押风险率过低，导致转出资金受限。此时会返回错误提示 {"code":-3020,"msg":"Transfer out amount exceeds max amount."}。请减少未偿还的借款或增加更多资产，以达到转账所需的抵押风险率。

### 借入资金[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%80%9F%E5%85%A5%E8%B5%84%E9%87%91 "借入资金的直接链接")

杠杆交易的核心功能之一是允许借入资金，以扩大您的持仓规模。在币安，只要您的杠杆交易账户中有足够保证金，且符合您设定的杠杆倍数，您就可以借入不同的资产。借款会按照小时计息，每种资产的最大可借额度取决于您的抵押价值及选择的杠杆倍数。

币安使用同一接口执行借款和还款操作： [POST /sapi/v1/margin/borrow-repay](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Margin-Account-Borrow-Repay)

#### 借款[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%80%9F%E6%AC%BE "借款的直接链接")

您需要指定要借入的资产和借款数量。对于逐仓杠杆账户，需额外传入参数以指明具体逐仓账户。币安通过一个布尔参数 isolated 和一个 symbol 参数来区分逐仓账户。

- **请求参数**:

| 名称         | 类型     | 是否必需 | 描述                                     |
|------------|--------|------|----------------------------------------|
| asset      | STRING | YES  |                                        |
| isIsolated | STRING | YES  | 是否逐仓杠杆，TRUE, FALSE, 默认 FALSE           |
| symbol     | STRING | YES  | 逐仓交易对，配合逐仓使用                           |
| amount     | STRING | YES  |                                        |
| type       | STRING | YES  | 操作类型：BORROW、REPAY                      |
| recvWindow | LONG   | NO   | The value cannot be greater than 60000 |
| timestamp  | LONG   | YES  |                                        |

成功后，您将收到一条包含借款交易 ID 的 JSON 响应，例如：

{ "tranId": 1234567891 }

该 tranId 是借款交易的唯一标识，您后续可以通过它查询借款状态或历史。

借款成功后，借入的资金将记入对应的杠杆交易账户（增加该资产的“借入”余额），您即可使用这些资金进行交易。请注意，利息会从借款开始立即计收，直到借款还清为止。

#### 如何避免常见错误：[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%A6%82%E4%BD%95%E9%81%BF%E5%85%8D%E5%B8%B8%E8%A7%81%E9%94%99%E8%AF%AF-2 "如何避免常见错误：的直接链接")

- 最大可借额度：如果收到错误 {"code": -3006, "msg": "Your borrow amount has exceed maximum borrow amount."}，表示您申请借款的金额超过了限额。借款过多会令账户保证金低于要求，导致额外借款被拒。您可以通过接口 [GET /sapi/v1/margin/maxBorrowable](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Max-Borrow) 查询某资产（逐仓需指定 trading pair）最大可借额度，了解可借金额。
- 利息：每笔借款都会计提利息，您可通过接口 [GET /sapi/v1/margin/interestHistory](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-Interest-History) 查询。利息通常从杠杆交易账户中扣除（计入该资产的“利息”字段）。还款时会先偿还利息，再偿还本金，请务必考虑利息成本。
- 资产可借状态：并非所有资产随时可借。若流动性不足，币安可能对部分资产限制或暂停借贷。若提示资产不可借，建议查看接口 [GET /sapi/v1/margin/allAssets](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets) 或稍后再试。
- 资产不足：如果收到 {"code": -3045, "msg": "The system does not have enough asset now."} 错误，说明手动借款或自动借款的请求因系统可用资产不足被拒，原因包括：
  
  - 系统库存中可借资产低于请求借款金额。
  - 系统库存极低，不论借款额度大小，均拒绝借款。

建议密切关注系统状态，适时调整借款策略。

- 全仓杠杆抵押品估值折扣：在全仓杠杆或全仓杠杆专业模式下，抵押资产在保证金计算时会按『抵押率」折算，资产分层折算后可能会降低总抵押价值。
  
  请注意，逐仓杠杆不适用该规则，逐仓杠杆抵押风险率基于资产原值。
  
  - 全仓杠杆经典版以抵押风险率计算最大借款及最大转出额度，但保证金追缴和强制平仓仍以风险率为准。
  - 全仓杠杆专业模式的抵押风险率既用于计算最大借款和转出额度，也用于触发保证金追缴与强制平仓。

更多内容请参考[《如何计算全仓杠杆专业模式下的保证金水平》](https://www.binance.com/zh-CN/support/faq/detail/12a78d8aa813470f96be283b45f75410)。

- 统一帐户抵押品估值折扣：在全仓杠杆、USDⓈ-M 合约及币本位合约钱包中所有资产的美元价值，均按统一帐户所规定的抵押率计算（不同于全仓杠杆经典版/全仓杠杆专业模式的抵押率）。抵押率可参考[《统一帐户专业版阶梯抵押率》](https://www.binance.com/zh-CN/futures/trading-rules/perpetual/portfolio-margin/tiered-collateral-ratio)。

成功借款后，借入的代币将转入您的杠杆交易钱包。接下来，我们将使用借入资金进行杠杆交易（买入或卖出）。

### 下单杠杆交易[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E4%B8%8B%E5%8D%95%E6%9D%A0%E6%9D%86%E4%BA%A4%E6%98%93 "下单杠杆交易的直接链接")

凭借您杠杆交易账户內的资金（包括借入资金），您可以创建各种订单（限价单、市价单等）。币安提供专用杠杆交易订单接口： [POST /sapi/v1/margin/order](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-New-Order)

- **请求参数**:

| 名称                      | 类型      | 是否必需 | 描述                                                                                                                                                                              |
|-------------------------|---------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| symbol                  | STRING  | YES  |                                                                                                                                                                                 |
| isIsolated              | STRING  | NO   | 是否逐仓杠杆，"TRUE", "FALSE", 默认 "FALSE"                                                                                                                                              |
| side                    | ENUM    | YES  | BUY SELL                                                                                                                                                                        |
| type                    | ENUM    | YES  | 详见枚举定义：订单类型                                                                                                                                                                     |
| quantity                | DECIMAL | NO   |                                                                                                                                                                                 |
| quoteOrderQty           | DECIMAL | NO   |                                                                                                                                                                                 |
| price                   | DECIMAL | NO   |                                                                                                                                                                                 |
| stopPrice               | DECIMAL | NO   | 与STOP\_LOSS, STOP\_LOSS\_LIMIT, TAKE\_PROFIT, 和 TAKE\_PROFIT\_LIMIT 订单一起使用。                                                                                                     |
| newClientOrderId        | STRING  | NO   | 客户自定义的唯一订单ID。若未发送自动生成。                                                                                                                                                          |
| icebergQty              | DECIMAL | NO   | 与 LIMIT, STOP\_LOSS\_LIMIT, 和 TAKE\_PROFIT\_LIMIT 一起使用创建 iceberg 订单。                                                                                                            |
| newOrderRespType        | ENUM    | NO   | 设置响应: JSON. ACK, RESULT, 或 FULL; MARKET 和 LIMIT 订单类型默认为 FULL, 所有其他订单默认为 ACK。                                                                                                    |
| sideEffectType          | ENUM    | NO   | NO\_SIDE\_EFFECT, MARGIN\_BUY, AUTO\_REPAY,AUTO\_BORROW\_REPAY;默认为 NO\_SIDE\_EFFECT. 详见[FAQ](https://www.binance.com/zh-CN/support/faq/detail/f9fc51cda1984bf08b95e0d96c4570bc) |
| timeInForce             | ENUM    | NO   | GTC,IOC,FOK                                                                                                                                                                     |
| selfTradePreventionMode | ENUM    | NO   | 允许的 ENUM 取决于交易对的配置。支持的值有 EXPIRE\_TAKER，EXPIRE\_MAKER，EXPIRE\_BOTH，NONE                                                                                                          |
| autoRepayAtCancel       | BOOLEAN | NO   | 只有在自动借款单或者自动借还单生效，true表示的是撤单后需要把订单产生的借款归还，默认为true                                                                                                                               |
| recvWindow              | LONG    | NO   | 赋值不能大于 60000                                                                                                                                                                    |
| timestamp               | LONG    | YES  |                                                                                                                                                                                 |

如果您已经手动借入资金，您可以直接使用这些资金进行杠杆交易。如果您没有手动借款，币安的下单接口可以根据一个名为 sideEffectType 的参数自动为您借款或还款。

#### 自动借款[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E8%87%AA%E5%8A%A8%E5%80%9F%E6%AC%BE "自动借款的直接链接")

sideEffectType 参数允许您将借款或还款流程自动化，作为下单的一部分：

- NO\_SIDE\_EFFECT：不自动借款或还款（默认设置）。您需保证杠杆交易账户余额充足（包括充值或之前手动借款），否则订单会因余额不足失败。
- MARGIN\_BUY：买入订单在报价资产不足时，将自动借款。如果您下买单时，杠杆交易账户报价资产不足，币安会自动借入所需的报价资产，最高不超杠杆限额。虽然该模式一般用于买单，但卖单若使用则会自动借入卖出资产（通常卖单不使用该模式，详见 AUTO\_BORROW\_REPAY）。借款仅在订单成交时触发，相当于“借入资产 + 下单”一步完成。
- AUTO\_REPAY：订单成交后自动还款。如果成交结果使您获得了借入资产，系统会立即用所得资产偿还贷款。例如，您借入 BTC 后卖出部分 BTC 取得报价资产，设置 AUTO\_REPAY 后，会用报价资产转换为 BTC 还清 BTC 贷款。再如，借 USDT 买 BTC，卖 BTC 获得 USDT，设置 AUTO\_REPAY 将用 USDT 还贷款。自动还款会优先还利息，且仅对借入资产生效，适合一键平仓。
- AUTO\_BORROW\_REPAY：结合上述两种，即自动借款并自动还款模式。一键借入执行订单，成交后用所得资产还款，实质上是“保证金翻转”。例如无资产时，使用此模式买入，先借报价资产买入基础资产，然后若基础资产为需还资产则自动还款。此模式较复杂，某些多腿订单（如 OCO/OTOCO）不可用。

建议初学者先用 NO\_SIDE\_EFFECT（自行借款），或买单时使用 MARGIN\_BUY 跳过手动借款步骤。执行后务必核查余额和借贷状况，确认自动化操作符合预期。

#### 如何避免常见错误：[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%A6%82%E4%BD%95%E9%81%BF%E5%85%8D%E5%B8%B8%E8%A7%81%E9%94%99%E8%AF%AF-3 "如何避免常见错误：的直接链接")

- 订单规则：保证金订单与现货订单遵循相同规则（最小交易量、价格步进、最小成交金额等）。请通过接口 [GET /api/v3/exchangeInfo](https://developers.binance.com/docs/binance-spot-api-docs/rest-api/general-endpoints) 查看最小/最大订单量，或通过 [GET /sapi/v1/margin/allAssets](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets) 查询最小借还款金额。订单无效（如太小）将报错。
- 取消订单：若需取消当前委托的订单，使用 [DELETE /sapi/v1/margin/order](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-Order)，参数包括 symbol、orderId 或 newClientOrderId，逐仓单需额外 isIsolated=TRUE。也可调用 [DELETE /sapi/v1/margin/openOrders](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Account-Cancel-All-Open-Orders) 一键撤销某交易对所有保证金订单。已自动借款的订单取消不会自动还款（除非为 OTOCO 订单设置 autoRepayAtCancel=true，此参数专为该场景设计）。
- 限价价格限制：若遇错误 {“code”: -3064, “msg”: “Limit price needs to be within (-15%,15%) of current index price for this margin trading pair.”}，表示限价价格超出允许范围。部分低流动性交易对或稳定币对（如 USDT/DAI），限价价格必须保持在当前指数价格的±15%区间内（该区间可能会调整），请调整限价。

您已成功执行杠杆交易，接下来请持续监控杠杆交易账户状态以管控风险，因为行情不利时存在强制平仓风险。

### 监控杠杆交易账户[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E7%9B%91%E6%8E%A7%E6%9D%A0%E6%9D%86%E4%BA%A4%E6%98%93%E8%B4%A6%E6%88%B7 "监控杠杆交易账户的直接链接")

合理监控杠杆交易账户至关重要。您需要随时关注余额、抵押风险率（风险比例）及累计利息。币安提供接口查询全仓和逐仓杠杆账户详情。

#### 全仓杠杆账户详情[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%85%A8%E4%BB%93%E6%9D%A0%E6%9D%86%E8%B4%A6%E6%88%B7%E8%AF%A6%E6%83%85 "全仓杠杆账户详情的直接链接")

调用接口：[GET /sapi/v1/margin/account](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Margin-Account-Details)，可获得全仓杠杆账户的概览，包括当前抵押风险率、资产总值、负债总值（债务）以及各资产的详细信息。关键返回字段包括：

{

"assets":[

{

```text
"baseAsset": 

{

  "asset": "BTC",

  "borrowEnabled": true,

  "borrowed": "0.00000000",

  "free": "0.00000000",

  "interest": "0.00000000",

  "locked": "0.00000000",

  "netAsset": "0.00000000",

  "netAssetOfBtc": "0.00000000",

  "repayEnabled": true,

  "totalAsset": "0.00000000"

},

"quoteAsset": 

{

  "asset": "USDT",

  "borrowEnabled": true,

  "borrowed": "0.00000000",

  "free": "0.00000000",

  "interest": "0.00000000",

  "locked": "0.00000000",

  "netAsset": "0.00000000",

  "netAssetOfBtc": "0.00000000",

  "repayEnabled": true,

  "totalAsset": "0.00000000"

},

"symbol": "BTCUSDT",

"isolatedCreated": true, 

"enabled": true, // true-enabled, false-disabled

"marginLevel": "0.00000000", 

"marginLevelStatus": "EXCESSIVE", // "EXCESSIVE", "NORMAL", "MARGIN\_CALL", "PRE\_LIQUIDATION", "FORCE\_LIQUIDATION"

"marginRatio": "0.00000000",

"indexPrice": "10000.00000000",

"liquidatePrice": "1000.00000000",

"liquidateRate": "1.00000000",

"tradeEnabled": true
```

}

],

"totalAssetOfBtc": "0.00000000",

"totalLiabilityOfBtc": "0.00000000",

"totalNetAssetOfBtc": "0.00000000"

}

#### 逐仓杠杆账户详情[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E9%80%90%E4%BB%93%E6%9D%A0%E6%9D%86%E8%B4%A6%E6%88%B7%E8%AF%A6%E6%83%85 "逐仓杠杆账户详情的直接链接")

对于逐仓杠杆账户，有对应的接口： [GET /sapi/v1/margin/isolated/account](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Isolated-Margin-Account-Info)。

该接口响应会返回您所有已启用的逐仓杠杆账户的详情信息。每个逐仓账户都会包含抵押风险率、总资产价值、总负债（借款）价值、以及该交易对相关的资产数组，通常包含两个资产的信息（即交易对的两个组成资产）。

这些信息帮助您全面了解每个逐仓杠杆账户的风险和资产状况。

{

"assets":[

```text
{

    "baseAsset": 

    {

      "asset": "BTC",

      "borrowEnabled": true,

      "borrowed": "0.00000000",

      "free": "0.00000000",

      "interest": "0.00000000",

      "locked": "0.00000000",

      "netAsset": "0.00000000",

      "netAssetOfBtc": "0.00000000",

      "repayEnabled": true,

      "totalAsset": "0.00000000"

    },

    "quoteAsset": 

    {

      "asset": "USDT",

      "borrowEnabled": true,

      "borrowed": "0.00000000",

      "free": "0.00000000",

      "interest": "0.00000000",

      "locked": "0.00000000",

      "netAsset": "0.00000000",

      "netAssetOfBtc": "0.00000000",

      "repayEnabled": true,

      "totalAsset": "0.00000000"

    },

    "symbol": "BTCUSDT",

    "isolatedCreated": true, 

    "enabled": true, // true-enabled, false-disabled

    "marginLevel": "0.00000000", 

    "marginLevelStatus": "EXCESSIVE", // "EXCESSIVE", "NORMAL", "MARGIN\_CALL", "PRE\_LIQUIDATION", "FORCE\_LIQUIDATION"

    "marginRatio": "0.00000000",

    "indexPrice": "10000.00000000",

    "liquidatePrice": "1000.00000000",

    "liquidateRate": "1.00000000",

    "tradeEnabled": true

  }

],

"totalAssetOfBtc": "0.00000000",

"totalLiabilityOfBtc": "0.00000000",

"totalNetAssetOfBtc": "0.00000000"
```

}

#### 用户数据流（进阶）[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E7%94%A8%E6%88%B7%E6%95%B0%E6%8D%AE%E6%B5%81%E8%BF%9B%E9%98%B6 "用户数据流（进阶）的直接链接")

币安为杠杆交易账户提供了 WebSocket 用户数据流服务，可实时推送账户余额变动和订单更新等信息。如果您需要实时监控（替代定时请求 REST 接口），可以通过调用接口 [POST /sapi/v1/userDataStream](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream/Start-Margin-User-Data-Stream)（针对杠杆交易账户）创建一个 listenKey，然后订阅相关事件。数据流的使用较为进阶，但如果您需要即时接收保证金追缴通知或订单成交提醒，可考虑使用该功能。

在积极管理持仓后，您最终会需要平仓并偿还所借资金，下面介绍如何还款。

### 偿还借款[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%81%BF%E8%BF%98%E5%80%9F%E6%AC%BE "偿还借款的直接链接")

使用完借入的代币（例如平仓后），您可以归还保证金借款。还款后，借入的资产将返还给币安，同时释放对应抵押物。还款可以选择部分偿还或全部偿还。

币安采用同一接口执行借款和还款操作： [POST /sapi/v1/margin/borrow-repay](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Margin-Account-Borrow-Repay)

- **请求参数**:

| 名称         | 类型     | 是否必需 | 描述                                     |
|------------|--------|------|----------------------------------------|
| asset      | STRING | YES  |                                        |
| isIsolated | STRING | YES  | 是否逐仓杠杆，TRUE, FALSE, 默认 FALSE           |
| symbol     | STRING | YES  | 逐仓交易对，配合逐仓使用                           |
| amount     | STRING | YES  |                                        |
| type       | STRING | YES  | 操作类型：BORROW、REPAY                      |
| recvWindow | LONG   | NO   | The value cannot be greater than 60000 |
| timestamp  | LONG   | YES  |                                        |

还款成功后，您将收到包含借款交易 ID 的 JSON 响应，例如：

{ "tranId": 1234567894 }

这表示还款交易已成功完成。还款后，该资产的未偿贷款余额将减少相应还款金额；如果全部还清，该资产的利息会降至零。

覆盖了借款与还款流程后，您基本完成了杠杆交易的整个生命周期：资金入账 -&gt; 借款 -&gt; 交易 -&gt; （可选：再次交易）-&gt; 还款。最后一步是持续跟踪您当下的交易和交易历史。

### 审查交易和账户历史[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E5%AE%A1%E6%9F%A5%E4%BA%A4%E6%98%93%E5%92%8C%E8%B4%A6%E6%88%B7%E5%8E%86%E5%8F%B2 "审查交易和账户历史的直接链接")

审查杠杆交易和账户活动非常重要，有助于了解交易表现和进行账务记录，也便于调试您的交易机器人。币安提供接口查询过去的订单、成交和账户相关操作（转账、借款、还款等）。

#### 成交历史[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E6%88%90%E4%BA%A4%E5%8E%86%E5%8F%B2 "成交历史的直接链接")

要获取杠杆交易账户上的成交记录（成交回执），请调用接口： [GET /sapi/v1/margin/myTrades](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Trade-List)

- **请求参数**:

| 名称         | 类型     | 是否必需 | 描述                                                  |
|------------|--------|------|-----------------------------------------------------|
| symbol     | STRING | YES  |                                                     |
| isIsolated | STRING | NO   | 无论是否使用逐仓保证金，该参数支持设置为 "TRUE" 或 "FALSE"，默认值为 "FALSE"。 |
| orderId    | LONG   | NO   |                                                     |
| startTime  | LONG   | NO   |                                                     |
| endTime    | LONG   | NO   |                                                     |
| fromId     | LONG   | NO   | 用于查询指定的起始 TradeId 交易记录，默认情况下接口会返回最新的交易。             |
| limit      | INT    | NO   | 默认值为 500；最大值为 1000。                                 |
| recvWindow | LONG   | NO   | 此参数的取值不能超过 60000。                                   |
| timestamp  | LONG   | YES  |                                                     |

举例来说，若您之前购买过 BNB，在查询 BNBBTC 交易对的成交记录（调用 myTrades）时，您可能会获得如下示例返回内容：

\[ { "commission": "0.00006000", "commissionAsset": "BTC", "id": 34, "isBestMatch": true, "isBuyer": false, "isMaker": false, "orderId": 39324, "price": "0.02000000", "qty": "3.00000000", "symbol": "BNBBTC", "isIsolated": false, "time": 1561973357171 } ]

#### 订单历史[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E8%AE%A2%E5%8D%95%E5%8E%86%E5%8F%B2 "订单历史的直接链接")

如果您需要查看订单详情（包括未成交的订单，如已取消的订单），可以使用以下接口：

- [GET /sapi/v1/margin/allOrders](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-All-Orders) — 查询某交易对所有订单（已成交、已取消等）。
- [GET /sapi/v1/margin/openOrders](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Open-Orders) — 查询当前开放订单（类似现货交易）。
- [GET /sapi/v1/margin/order](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Margin-Account-Order) — 通过订单 ID 查询指定订单详情。

#### 账户活动历史[​](https://developers.binance.com/docs/zh-CN/margin_trading/best-practice#%E8%B4%A6%E6%88%B7%E6%B4%BB%E5%8A%A8%E5%8E%86%E5%8F%B2 "账户活动历史的直接链接")

币安还提供以下接口用于查看其他账户活动：

- [GET /sapi/v1/margin/borrow-repay](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Borrow-Repay) — 查询借贷和还款历史。支持按资产、逐仓交易对等过滤。返回每笔借款和还款记录，包括金额、利息、状态等，例如显示您某次借入 100 USDC 的交易 ID 和时间戳。
- [GET /sapi/v1/margin/transfer](https://developers.binance.com/docs/zh-CN/margin_trading/transfer) — 查询现货与全仓杠杆交易账户间的转账历史，包括充值和提现，带时间戳和金额信息。
- [GET /sapi/v1/margin/interestHistory](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-Interest-History) — 按资产列出一段时间内的利息计提记录。
- [GET /sapi/v1/margin/forceLiquidationRec](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Get-Force-Liquidation-Record) — 强制平仓记录（希望您不需要用到！）。