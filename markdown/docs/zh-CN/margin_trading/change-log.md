# 更新日志

## 2026-01-21[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2026-01-21 "2026-01-21的直接链接")

根据2025-11-10的公告，以下接口/方法将于**2026-02-20 07:00 UTC**起停止服务：

**REST API**

- POST /sapi/v1/userDataStream
- PUT /sapi/v1/userDataStream
- DELETE /sapi/v1/userDataStream
- POST /sapi/v1/userDataStream/isolated
- PUT /sapi/v1/userDataStream/isolated
- DELETE /sapi/v1/userDataStream/isolated

## 2026-01-16[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2026-01-16 "2026-01-16的直接链接")

- 更新端点限制
  
  - `GET /sapi/v1/margin/capital-flow`：新增查询时间范围限制。此限制将于大约 2026-02-02 07:00 UTC 起生效。
  - 当同时指定 `startTime` 和 `endTime` 时，时间跨度不能超过7天，否则接口将返回错误：
    
    ```text
    {
      "code": -4047,
      "msg": "Time interval must be within 0-7 days"
    }
    ```
  - 如果所需时间范围超过7天，请将查询拆分为多个请求。

## 2025-12-26[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2025-12-26 "2025-12-26的直接链接")

**时效性通知**

- **以下有关于REST API变更将在 2026-01-15 07:OO UTC 发生:**  
  调用需要签名的接口时，请在计算签名之前对 payload 进行百分比编码（percent-encode）。不符合此顺序的请求将被拒绝，并返回错误代码 [`-1022 签名不正确`](https://developers.binance.com/docs/zh-CN/margin_trading/error-code#-1022-invalid_signature)。请检查并相应地更新您代码中的签名逻辑部分。

**REST API**

- 更新了 REST API 文档中有关于 [签名请求示例](https://developers.binance.com/docs/zh-CN/margin_trading/general-info#post-apiv3order-%E7%9A%84%E7%AD%BE%E5%90%8D%E7%A4%BA%E4%BE%8B) 的部分。

## 2025-11-10[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2025-11-10 "2025-11-10的直接链接")

- **所有关于在 wss://stream.binance.com 上使用 listenKey 的文档于2025年11月10日从杠杆交易接口文档中移除。以下功能将持续可用，直至另行发布停用公告：**
  
  - POST /sapi/v1/userDataStream
  - PUT /sapi/v1/userDataStream
  - DELETE /sapi/v1/userDataStream
  - POST /sapi/v1/userDataStream/isolated
  - PUT /sapi/v1/userDataStream/isolated
  - DELETE /sapi/v1/userDataStream/isolated
- **用户应通过订阅 [WebSocket API](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream) 上的用户数据流来获取用户数据更新，这样可以提供更好的性能（更低的延迟）:**
  
  - POST /sapi/v1/userListenToken : 创建一个新的用户数据流并返回一个listenToken令牌。
  - 方法 userDataStream.subscribe.listenToken : 使用生成的listenToken订阅用户数据流。
- [用户数据流文档](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream)将持续提供有效载荷的参考:
  
  - 账户更新 : 每当帐户余额发生更改时，都会发送一个事件outboundAccountPosition，其中包含可能由生成余额变动的事件而变动的资产。
  - 余额更新 : 杠杆账户和其他账户之间发生划转时更新。
  - 订单更新 ： 订单通过executionReport事件进行更新。

## 2025-10-06[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2025-10-06 "2025-10-06的直接链接")

- **在 wss://stream.binance.com:9443 上使用 listenKey方式订阅用户数据流的功能即将弃用。**
  
  - 该功能将会在不久的将来从我们系统里移除，具体时间另行通知。
  - 相关文档也会随之全部删除.
  - 建议用户使用以下已经发布的新的用户数据流订阅方式。
- 新的用户数据流订阅方式采用 [Websocket API](https://developers.binance.com/docs/binance-spot-api-docs/websocket-api/general-api-information) 连接方式，包含如下:
  
  - POST /sapi/v1/userListenToken : 创建一个新的用户数据流并返回一个listenToken令牌。
  - 方法 userDataStream.subscribe.listenToken : 使用生成的listenToken订阅用户数据流。

## 2025-09-16[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2025-09-16 "2025-09-16的直接链接")

- 更新一个接口 :
  
  - POST `/sapi/v1/margin/apiKey`: 接口描述增加可支持产品的详细说明，以及错误码说明。

## 2025-06-17[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2025-06-17 "2025-06-17的直接链接")

- 杠杆交易新增最佳实践模块。

## 2025-06-16[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2025-06-16 "2025-06-16的直接链接")

- 杠杆交易新增币种或币对预上架接口:
  
  - GET `/sapi/v1/margin/list-schedule`: 查询全仓和逐仓的币种或币对的上架计划

## 2024-09-19[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2024-09-19 "2024-09-19的直接链接")

- 杠杆交易为VIP4及以上的用户提供了低延迟交易接口，这类接口通过特定的SpecialKey实现杠杆交易。
  
  若您的VIP级别为3及以下，请联系您的VIP经理获取相关SpecialKey的使用许可标准。
  
  关于SpecialKey的接口包含：
  
  - POST /sapi/v1/margin/apiKey
  - DELETE /sapi/v1/margin/apiKey
  - PUT /sapi/v1/margin/apiKey/ip
  - GET /sapi/v1/margin/apiKey
  - GET /sapi/v1/margin/api-key-list
  
  ## special API key使用步骤[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#special-api-key%E4%BD%BF%E7%94%A8%E6%AD%A5%E9%AA%A4 "special API key使用步骤的直接链接")
  
  1. 通过上述新建SAPI接口创建"margin trade only" 权限的key/secret对；
  2. 全仓杠杆无需传递symbol参数；
  3. 逐仓杠杆则用symbol参数指定特定交易对；
  4. 使用步骤#1生成的key/secret对进行杠杆交易，同时可用现货REST api ([https://api.binance.com/api/v3/](https://api.binance.com/api/v3/)) 接口创建listenKey进行监听。

## 2024-09-13[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2024-09-13 "2024-09-13的直接链接")

- 我们将在杠杆市场开始推出新功能 One-Triggers-the-Other (OTO) 订单和 One-Triggers-a-One-Cancels-The-Other (OTOCO) 订单。
  
  - POST `/sapi/v1/margin/order/oto`: One-Triggers-the-Other (OTO) 订单
  - POST `/sapi/v1/margin/order/otoco`: One-Triggers-a-One-Cancels-The-Other (OTOCO) 订单
- 在全仓杠杆账户接口GET `/sapi/v1/margin/account`新增2个返回参数并替换原有参数'transferEnabled' ：
  
  - transferInEnabled
  - transferOutEnabled

## 2024-01-09[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2024-01-09 "2024-01-09的直接链接")

- 根据[公告](https://www.binancezh.info/zh-CN/support/announcement/%E5%85%B3%E4%BA%8E%E5%B8%81%E5%AE%89%E6%9D%A0%E6%9D%86sapi%E7%AB%AF%E7%82%B9%E6%9B%B4%E6%96%B0%E7%9A%84%E5%85%AC%E5%91%8A-2024-03-31-a1868c686ce7448da8c3061a82a87b0c)，币安杠杆将于 2024 年 03 月 31 日 12:00（东八区时间）下架以下 SAPI 接口，请及时更换为对应替代接口:
  
  - 将下架`POST /sapi/v1/margin/transfer`，应替换为`POST /sapi/v1/asset/transfer`万能划转
  - 将下架`POST /sapi/v1/margin/isolated/transfer`，应替换为`POST /sapi/v1/asset/transfer`万能划转
  - 将下架`POST /sapi/v1/margin/loan`，应替换为`POST /sapi/v1/margin/borrow-repay`借还款接口（新增）
  - 将下架`POST /sapi/v1/margin/repay`，应替换为`POST /sapi/v1/margin/borrow-repay`借还款接口（新增）
  - 将下架`GET /sapi/v1/margin/isolated/transfer`，应替换为`GET /sapi/v1/margin/transfer`获取全仓杠杆划转历史
  - 将下架`GET /sapi/v1/margin/asset`，应替换为`GET /sapi/v1/margin/allAssets`
  - 将下架`GET /sapi/v1/margin/pair`，应替换为`GET /sapi/v1/margin/allPairs`
  - 将下架`GET /sapi/v1/margin/isolated/pair`，应替换为`GET /sapi/v1/margin/isolated/allPairs`
  - 将下架`GET /sapi/v1/margin/loan`，应替换为`GET /sapi/v1/margin/borrow-repay`
  - 将下架`GET /sapi/v1/margin/repay`，应替换为`GET /sapi/v1/margin/borrow-repay`
  - 将下架`GET /sapi/v1/margin/dribblet`，应替换为`GET /sapi/v1/asset/dribblet`
  - 将下架`GET /sapi/v1/margin/dust`，应替换为`POST /sapi/v1/asset/dust-btc`
  - 将下架`POST /sapi/v1/margin/dust`，应替换为`POST /sapi/v1/asset/dust`
- 新增杠杆交易接口:
  
  - `POST /sapi/v1/margin/borrow-repay`：杠杆账户借贷/还款
  - `GET /sapi/v1/margin/borrow-repay`：查询借贷/还款记录
- 更新 3 个杠杆交易接口:
  
  - `GET /sapi/v1/margin/transfer`：新增参数 `isolatedSymbol`，新增响应信息
  - `GET /sapi/v1/margin/allAssets`：新增参数`asset`，新增响应信息
  - `GET /sapi/v1/margin/allPairs`：新增参数`symbol`
  - `GET /sapi/v1/margin/isolated/allPairs`：新增参数`symbol`

* * *

## 2023-12-22[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-12-22 "2023-12-22的直接链接")

- 新增杠杆交易 Websocket：
  
  - 新的 base url 为`wss://margin-stream.binance.com`，推送两类事件：负债变化事件和 Margin Call 事件

* * *

## 2023-11-21[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-11-21 "2023-11-21的直接链接")

- 更新杠杆接口
  
  - `POST /sapi/v1/margin/order`: 参数`sideEffectType`增加`AUTO_BORROW_REPAY`选项
  - `POST /sapi/v1/margin/order/oco`: 参数`sideEffectType`增加`AUTO_BORROW_REPAY`选项
  - `GET /sapi/v1/margin/available-inventory`: 响应增加返回参数 updateTime ，表示放贷库存的获取时间

* * *

## 2023-11-17[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-11-17 "2023-11-17的直接链接")

- 新增杠杠接口支持全仓 Pro 模式[FAQ](https://www.binance.com/en/support/faq/introduction-to-binance-cross-margin-pro-0b5441a1c1ff431bb2e135dfa8e6ffba):
  
  - `GET /sapi/v1/margin/leverageBracket`: 查询全仓杠杆 Pro 模式下的负债币种杠杆与保证金率
- 更新杠杠接口:
  
  - `POST /sapi/v1/margin/max-leverage`: 增加 `maxLeverage`入参 10 以支持全仓 Pro 模式
  - `GET /sapi/v1/margin/account`: 新增响应字段`accountType`, `MARGIN_2` 以支持全仓 Pro 模式

* * *

## 2023-10-16[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-10-16 "2023-10-16的直接链接")

- 新增杠杆接口:
  
  - `GET /sapi/v1/margin/available-inventory`: 杠杆可用放贷库存查询
  - `POST /sapi/v1/margin/manual-liquidation`: 杠杆手动强平

* * *

## 2023-08-31[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-08-31 "2023-08-31的直接链接")

- 新增杠杆接口：
  
  - `/sapi/v1/margin/capital-flow`: 查询全仓/逐仓资金流水

* * *

## 2023-07-07[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-07-07 "2023-07-07的直接链接")

- 新增杠杆接口：
  
  - `POST /sapi/v1/margin/max-leverage`: 调整全仓最大杠杆倍数

* * *

## 2023-06-22[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-06-22 "2023-06-22的直接链接")

- 更新杠杆接口：
  
  - `POST /sapi/v1/margin/order`：增加参数`autoRepayAtCancel`和 `selfTradePreventionMode`
  - `POST /sapi/v1/margin/order/oco`: 增加参数 `selfTradePreventionMode`

* * *

## 2023-06-20[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-06-20 "2023-06-20的直接链接")

- 新增杠杆接口：
  
  - `GET /sapi/v1/margin/delist-schedule`：查询全仓和逐仓的币种或币对的下架计划

* * *

## 2023-02-27[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-02-27 "2023-02-27的直接链接")

- 新增杠杆接口:
  
  - `/sapi/v1/margin/next-hourly-interest-rate`: 查询用户币种预估下小时利率

* * *

## 2023-02-02[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-02-02 "2023-02-02的直接链接")

- 添加杠杆接口:
  
  - `GET /sapi/v1/margin/exchange-small-liability`: 查询可小额负债转换的资产
  - `POST /sapi/v1/margin/exchange-small-liability`: 全仓杠杆小额负债转换
  - `GET /sapi/v1/margin/exchange-small-liability-history`: 查询全仓杠杆小额负债转换历史

* * *

## 2023-01-13[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2023-01-13 "2023-01-13的直接链接")

- 添加杠杆账户接口：
  
  - `GET /sapi/v1/margin/crossMarginCollateralRatio`: 获取全仓币种质押率信息

* * *

## 2022-09-16[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2022-09-16 "2022-09-16的直接链接")

- 添加杠杆账户接口：
  
  - `GET /sapi/v1/margin/tradeCoeff`：获取用户个人杠杆账户信息汇总

* * *

## 2022-07-01[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2022-07-01 "2022-07-01的直接链接")

- 添加新杠杆账户接口：
  
  - `GET /sapi/v1/margin/dribblet` 查询用户杠杆账户小额资产转换 BNB 历史信息。
- 更新杠杆账户接口：
  
  - `GET /sapi/v1/margin/repay`： 响应出参增加字段 rawAsset，表示原始币种。

* * *

## 2022-05-26[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2022-05-26 "2022-05-26的直接链接")

- 更新杠杆账户接口： 查询时间范围最大不得超过 30 天：
  
  - `GET /sapi/v1/margin/transfer`
  - `GET /sapi/v1/margin/loan`
  - `GET /sapi/v1/margin/repay`
  - `GET /sapi/v1/margin/isolated/transfer`
  - `GET /sapi/v1/margin/interestHistory`

* * *

## 2022-04-26[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2022-04-26 "2022-04-26的直接链接")

- 新增接口 `GET /sapi/v1/margin/rateLimit/order`
  
  - 回传用户在当前时间区间内的杠杆账户下单总数

* * *

## 2021-12-30[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-12-30 "2021-12-30的直接链接")

- 更新杠杆接口：
  
  - 获取杠杆利率历史接口`GET /sapi/v1/margin/interestRateHistory`移除参数`limit`，查询时间间隔更改为最大 1 个月

* * *

## 2021-12-03[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-12-03 "2021-12-03的直接链接")

- 新增杠杆接口:
  
  - 新增接口 `GET /sapi/v1/margin/crossMarginData` 以获取全仓杠杆利率及限额
  - 新增接口 `GET /sapi/v1/margin/isolatedMarginData` 以获取逐仓杠杆利率及限额
  - 新增接口 `GET /sapi/v1/margin/isolatedMarginTier` 以获取逐仓档位信息

* * *

## 2021-10-14[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-10-14 "2021-10-14的直接链接")

- 以下杠杆账户接口更新返回数据的时间范围，`startTime`与`endTime`时间跨度不能超过 30 天，如果不传时间参数默认返回最近 7 天数据，如果`archived`参数为`true`，则默认返回 6 个月以前的最后 7 天数据:
  
  - `GET /sapi/v1/margin/transfer`
  - `GET /sapi/v1/margin/loan`
  - `GET /sapi/v1/margin/repay`
  - `GET /sapi/v1/margin/isolated/transfer`
  - `GET /sapi/v1/margin/interestHistory`

* * *

## 2021-09-08[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-09-08 "2021-09-08的直接链接")

- 新增以下杠杆账户接口支持杠杆逐仓账户启用限制:
  
  - 新增接口 `DELETE /sapi/v1/margin/isolated/account` 以支持杠杆逐仓账户停用
  - 新增接口 `POST /sapi/v1/margin/isolated/account` 以支持杠杆逐仓账户启用
  - 新增接口 `GET /sapi/v1/margin/isolated/accountLimit` 以查询杠杆逐仓账户上限
- 查询杠杆逐仓账户信息接口 `GET /sapi/v1/margin/isolated/account` 响应加入字段 "enabled" 判断账户是否启用

* * *

## 2021-08-23[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-08-23 "2021-08-23的直接链接")

- 新增杠杆账户 OCO 接口:
  
  - `POST /sapi/v1/margin/order/oco`
  - `DELETE /sapi/v1/margin/orderList`
  - `GET /sapi/v1/margin/orderList`
  - `GET /sapi/v1/margin/allOrderList`
  - `GET /sapi/v1/margin/openOrderList`

用法与现货账户 OCO 相同

* * *

## 2021-04-28[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-04-28 "2021-04-28的直接链接")

从 **May 15, 2021 08:00 UTC** 开始, 以下创建逐仓杠杆账户接口将关闭:

- `POST /sapi/v1/margin/isolated/create`

后续，用户可通过逐仓杠杆账户划转 `POST /sapi/v1/margin/isolated/transfer` 直接完成逐仓杠杆账户的创建与交易准备，无需调用接口创建账户

* * *

## 2021-04-02[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-04-02 "2021-04-02的直接链接")

- 新增钱包接口:
  
  - `GET /sapi/v1/system/status` 以获取系统状态
  - `GET /sapi/v1/account/status` 以获取账户状态
  - `GET /sapi/v1/account/apiTradingStatus` 以获取账户 API 交易状态
  - `GET /sapi/v1/asset/dribblet` 以获取小额资产转换 BNB 历史
  - `GET /sapi/v1/asset/assetDetail` 以获取上架资产详情
  - `GET /sapi/v1/asset/tradeFee` 以获取交易手续费率查询
- 新增子母账户接口:
  
  - `GET /sapi/v3/sub-account/assets` 以查询子账户资产

* * *

## 2021-03-05[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-03-05 "2021-03-05的直接链接")

- 新增杠杆接口：
  
  - `GET /sapi/v1/margin/interestRateHistory` 以支持杠杆利率历史查询

* * *

## 2021-02-04[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-02-04 "2021-02-04的直接链接")

- 更新钱包接口：
  
  - 用户万向划转接口 `POST /sapi/v1/asset/transfer` 和`GET /sapi/v1/asset/transfer` 新增划转类型 `MARGIN_MINING` ,`MINING_MARGIN`, `MARGIN_C2C` ,`C2C_MARGIN`, `MARGIN_CMFUTURE`, `CMFUTURE_MARGIN` 以支持全仓杠杆，矿池，C2C，币本位合约账户间划转。

* * *

## 2021-01-15[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2021-01-15 "2021-01-15的直接链接")

- 杠杆交易添加新接口 `DELETE /sapi/v1/margin/openOrders`
  
  - 此接口便于用户撤销单一交易对的所有挂单, 包括 OCO 的挂单。

* * *

## 2020-12-04[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-12-04 "2020-12-04的直接链接")

- 更新杠杆代币接口:
  
  - 接口`GET /sapi/v1/blvt/tokenInfo` 新增返回参数 `currentBaskets`(包括 `symbol`， `amount` ， `notionalValue` )，`purchaseFeePct`申购费率，`dailyPurchaseLimit`每日申购数量上限，`redeemFeePct`赎回费率，`dailyRedeemLimit`每日赎回数量上限。
- 新增杠杆代币接口:
  
  - `GET /sapi/v1/blvt/userLimit` 以查询用户每日申购赎回限额。

* * *

## 2020-12-01[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-12-01 "2020-12-01的直接链接")

- 更新杠杆交易接口:
  
  - `POST /sapi/v1/margin/order` 加入参数 `quoteOrderQty` 支持"报价总额市价单"。

* * *

## 2020-11-16[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-11-16 "2020-11-16的直接链接")

- 更新杠杆接口加入 `archived` 参数以支持查询 6 个月以前数据:
  
  - `GET /sapi/v1/margin/loan`
  - `GET /sapi/v1/margin/repay`
  - `GET /sapi/v1/margin/interestHistory`

* * *

## 2020-11-10[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-11-10 "2020-11-10的直接链接")

- 新增 BNB 抵扣开关接口:
  
  - `POST /sapi/v1/bnbBurn` BNB 现货交易和杠杆利息抵扣开关。
  - `GET /sapi/v1/bnbBurn` 获取 BNB 抵扣开关状态。

* * *

## 2020-09-30[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-09-30 "2020-09-30的直接链接")

- 杠杆账户接口更新:
  
  - `GET /sapi/v1/margin/maxBorrowable` 返回新字段 `borrowLimit` 为用户账户借贷限额。

* * *

## 2020-08-26[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-08-26 "2020-08-26的直接链接")

- 逐仓杠杆接口 `GET /sapi/v1/margin/isolated/account` 新增可选参数 `symbols`, 以支持查询至多 5 个指定 symbol 的杠杆逐仓资产。

* * *

## 2020-07-28[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-07-28 "2020-07-28的直接链接")

逐仓杠杆相关接口

- 以下接口新增可选参数"isIsolated", 并在返回内容中新增字段 "symbol":
  
  - `POST /sapi/v1/margin/loan`
  - `POST /sapi/v1/margin/repay`
- 以下接口新增可选参数"isIsolated", 并在返回内容中新增字段 "isIsolated":
  
  - `POST /sapi/v1/margin/order`
  - `DELETE /sapi/v1/margin/order`
  - `GET /sapi/v1/margin/order`
  - `GET /sapi/v1/margin/openOrders`
  - `GET /sapi/v1/margin/allOrders`
  - `GET /sapi/v1/margin/myTrades`
- 以下接口新增可选参数"isolatedSymbol", 并在返回内容中新增字段 "isolatedSymbol":
  
  - `GET /sapi/v1/margin/loan`
  - `GET /sapi/v1/margin/repay`
  - `GET /sapi/v1/margin/interestHistory`
- 接口 `GET /sapi/v1/margin/forceLiquidationRec` 新增可选参数"isolatedSymbol", 并在返回内容中新增字段 "isIsolated"
- 以下接口新增可选参数"isolatedSymbol":
  
  - `GET /sapi/v1/margin/maxBorrowable`
  - `GET /sapi/v1/margin/maxTransferable`
- 新增以下逐仓杠杆功能接口:
  
  - `POST /sapi/v1/margin/isolated/create`
  - `POST /sapi/v1/margin/isolated/transfer`
  - `GET /sapi/v1/margin/isolated/transfer`
  - `GET /sapi/v1/margin/isolated/account`
  - `GET /sapi/v1/margin/isolated/pair`
  - `GET /sapi/v1/margin/isolated/allPairs`
- 新增以下接口，管理逐仓杠杆账户 listenKey:
  
  - `POST /sapi/v1/userDataStream/isolated`
  - `PUT /sapi/v1/userDataStream/isolated`
  - `DELETE /sapi/v1/userDataStream/isolated`

* * *

## 2020-07-20[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-07-20 "2020-07-20 的直接链接")

- 接口`GET /sapi/v1/margin/allOrders` 参数"limit"的可传最大值更新为 500.

* * *

## 2020-07-17[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2020-07-17 "2020-07-17的直接链接")

- 接口 `GET /sapi/v1/margin/allOrders` 增加访问限制为每个 IP 最多每分钟 60 次

* * *

## 2019-11-30[​](https://developers.binance.com/docs/zh-CN/margin_trading/change-log#2019-11-30 "2019-11-30的直接链接")

- 接口`POST /sapi/v1/margin/order (HMAC SHA256)`新增参数`sideEffectType`，可选内容如下:
  
  - `NO_SIDE_EFFECT`: 普通交易订单;
  - `MARGIN_BUY`: 自动借款交易订单;
  - `AUTO_REPAY`: 自动还款交易订单.
- New field `marginBuyBorrowAmount` and `marginBuyBorrowAsset` in `FULL` response to `POST /sapi/v1/margin/order (HMAC SHA256)`