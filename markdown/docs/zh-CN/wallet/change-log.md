# 更新日志

## 2025-12-26[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-12-26 "2025-12-26的直接链接")

### 时效性通知[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#%E6%97%B6%E6%95%88%E6%80%A7%E9%80%9A%E7%9F%A5 "时效性通知的直接链接")

- **以下有关于REST API变更将在 2026-01-15 07:OO UTC 发生:**  
  调用需要签名的接口时，请在计算签名之前对 payload 进行百分比编码（percent-encode）。不符合此顺序的请求将被拒绝，并返回错误代码 [`-1022 签名不正确`](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1022-invalid_signature)。请检查并相应地更新您代码中的签名逻辑部分。

### REST API[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#rest-api "REST API的直接链接")

- 更新了 REST API 文档中有关于 [签名请求示例](https://developers.binance.com/docs/zh-CN/wallet/general-info#post-apiv3order-%E7%9A%84%E7%AD%BE%E5%90%8D%E7%A4%BA%E4%BE%8B) 的部分。

* * *

## 2025-12-19[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-12-19 "2025-12-19的直接链接")

- 新增旅行规则 API:
  
  - `PUT /sapi/v2/localentity/deposit/provide-info` - V2 版本，使用 `depositId` 参数替代 `tranId`。

* * *

## 2025-09-18[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-09-18 "2025-09-18的直接链接")

- 修改菜单名称 `Onboarded VASP List` 到 `VASP List`.

* * *

## 2025-09-12[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-09-12 "2025-09-12的直接链接")

- 新增一个返回字段 `travelRuleStatus` 在 `GET /sapi/v1/capital/deposit/hisrec`. travelRuleStatus: 0: travel rule not required OR info already provided and funds ready to use, 1: travel rule required to provide deposit info.

* * *

## 2025-09-08[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-09-08 "2025-09-08的直接链接")

- 新增一个返回字段 `withdrawTag` 在 `GET /sapi/v1/capital/config/getall`接口上. 替换原有的 `sameAddress` 字段. 建议用户使用新的 `withdrawTag` 字段，暂时会保留 `sameAddress` 并且值与 `withdrawTag` 相同.

* * *

## 2025-08-25[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-08-25 "2025-08-25的直接链接")

- 添加新的充值历史记录V2 API。
- 更新地址验证列表 API 的描述。
- 更新以下页面的权重描述：
  
  - /travel-rule/withdraw-history
  - /travel-rule/withdraw-history-v2
  - /travel-rule/questionnaire-requirements
  - /travel-rule/onboarded-vasp-list

* * *

## 2025-08-05[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-08-05 "2025-08-05的直接链接")

- 更新 `POST /sapi/v1/capital/withdraw/apply` 接口关于旅行规则的脚注说明。

* * *

## 2025-07-11[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-07-11 "2025-07-11的直接链接")

- 添加附录：
  
  - 姓名限制规则。
  - 旅行规则的国家/地区代码。
- 添加用于旅行规则问卷要求的新 API。
  
  - `GET /sapi/v1/localentity/questionnaire-requirements`

* * *

## 2025-06-25[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-06-25 "2025-06-25的直接链接")

- 修改Travel Rule API文档:
  
  - 修改提币问卷`txnPurpose`选项:
    
    - 1: 在日本国内购物
    - 2: 遗产、赠予或生活费
    - 4: 投资
    - 5: 支付第三方VASP的服务费用
    - 6: 偿还贷款
    - 7: 礼物或捐款
  - 删除`txnPurposeOthers`

* * *

## 2025-06-12[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-06-12 "2025-06-12的直接链接")

- 开启法国SAPI支持，问卷中增加法国问卷内容。
- 修复文档中文版本的若干问题。

* * *

## 2025-06-10[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-06-10 "2025-06-10的直接链接")

- 详细解释了 withdrawOrderId 在 POST `/sapi/v1/capital/withdraw/apply` 和 GET `/sapi/v1/capital/withdraw/history` 中的使用

* * *

## 2025-05-12[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-05-12 "2025-05-12的直接链接")

- 合规站KZ，IN，问卷更新.

* * *

## 2025-03-27[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-03-27 "2025-03-27的直接链接")

- 新增接口`GET sapi/v1/capital/withdraw/quota`，获取用户提现额度

* * *

## 2025-02-27[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-02-27 "2025-02-27的直接链接")

- `GET /sapi/v1/capital/config/getall`接口增加了一个`币种面值`的返回，默认不返回代表为1.

* * *

## 2025-01-15[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-01-15 "2025-01-15的直接链接")

- 更新 `GET /sapi/v2/localentity/withdraw/history` 接口 `请求权重` 描述为 UID.
- 更新 `GET /sapi/v1/capital/withdraw/apply` 接口 `请求权重` 描述从 600 到 900.

* * *

## 2025-01-08[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-01-08 "2025-01-08的直接链接")

- 增加新接口 `GET /sapi/v1/localentity/vasp` 用来获取本地站支持的VASP列表.
- 增加新接口 `GET /sapi/v2/localentity/withdraw/history` 改善提币历史查询的效率.
- 支持问卷中合并`Binance`的逻辑。

* * *

## 2024-11-21[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-11-21 "2024-11-21的直接链接")

- `GET /sapi/v1/capital/config/getall`接口增加了一个`内部转账最小提现数`的返回.
- 以下接口功能将于 2024-11-21 不再提供支持：
  
  - `POST /sapi/v1/asset/convert-transfer` BUSD的资产相互转换接口功能下线，为兼容调用，现固定返回："{"tranId":null,"status":"F","response":"No longer supported"}"
  - `GET /sapi/v1/capital/contract/convertible-coins` BUSD资产可相互转换的稳定币查询功能下线，为兼容调用，现固定返回:"{"convertEnabled":false,"coins":\[],"exchangeRates":{}}"
  - `POST /sapi/v1/capital/contract/convertible-coins` BUSD资产可相互转换稳定币编辑功能下线，为兼容调用，后台不再有任何更改
- 将 `GET /sapi/v1/capital/withdraw/history` 接口参数 idList 最大值调整为 45

* * *

## 2024-11-08[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-11-08 "2024-11-08的直接链接")

- 更新 `GET /sapi/v1/account/info`：新增 "European Options account enable status" 與 "Portfolio Margin enable status"。
- 更新 `GET /sapi/v1/account/apiRestrictions`：新增 "FIX API trading permission" 與 "FIX API reading permission"。

* * *

## 2024-10-28[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-10-28 "2024-10-28的直接链接")

- 提现查询历史 API 现在支持 `withdrawOrderId` 作为查询参数。
- 提现申请 API 已更新，增加了处理网络参数为空的逻辑。

* * *

## 2024-10-18[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-10-18 "2024-10-18的直接链接")

- 为每一个主题添加对应的预先加载的VASP列表.

* * *

## 2024-10-16[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-10-16 "2024-10-16的直接链接")

- 为Travel Rule API增加预先加载的VASP列表

* * *

## 2024-10-09[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-10-09 "2024-10-09的直接链接")

- 更新Travel Rule问卷内容:
  
  - 新增印度的提现/充值问卷: 印度用户现在可以参考问卷内容使用sAPI进行提现/充值

* * *

## 2025-06-25[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2025-06-25-1 "2025-06-25的直接链接")

- 修改Travel Rule API文档:
  
  - 修改提币问卷`txnPurpose`选项:
    
    - 1: 在日本国内购物
    - 2: 遗产、赠予或生活费
    - 4: 投资
    - 5: 支付第三方VASP的服务费用
    - 6: 偿还贷款
    - 7: 礼物或捐款
  - 删除`txnPurposeOthers`

* * *

## 2024-08-14[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-08-14 "2024-08-14的直接链接")

- 修改Travel Rule API文档:
  
  - 新西兰问卷内容: `isAddressOwner` 的枚举值应为 `1`:是, `2`:不是
  - 增加出金/入金API文档对于URL参数的补充描述

* * *

## 2024-07-09[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-07-09 "2024-07-09的直接链接")

- 更新Travel Rule问卷内容:
  
  - 新增巴林的提现/充值问卷: 巴林用户现在可以参考问卷内容使用sAPI进行提现/充值
  - 更新日本充值问卷: 新增必填项目`声明`，并修改了一些文本错误

* * *

## 2024-06-21[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-06-21 "2024-06-21的直接链接")

- 新增本地站用充值/提币接口以满足旅行规则的合规需求:
  
  - `POST /sapi/v1/localentity/withdraw/apply`
  - `GET /sapi/v1/localentity/withdraw/history`
  - `PUT /sapi/v1/localentity/deposit/provide-info`
  - `GET /sapi/v1/localentity/deposit/history`

* * *

## 2024-06-04[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-06-04 "2024-06-04的直接链接")

- 钱包接口调整：对于内部转账，TXID前缀已于2024年5月28日被替换为“Off-chain transfer”。"Internal transfer"标记不再出现在TXID字段中，包括历史交易，以下接口受到影响：
  
  - `GET /sapi/v1/capital/deposit/hisrec`
  - `GET /sapi/v1/capital/withdraw/history`
  - `GET /sapi/v1/capital/deposit/subHisrec`

* * *

## 2024-05-22[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-05-22 "2024-05-22的直接链接")

- 更新子账户接口:
  
  - `GET /sapi/v1/sub-account/transfer/subUserHistory`: 更新返回字段`fromAccountType`和 `toAccountType`. 合约钱包划转时返回USDT\_FUTURE/COIN\_FUTURE以区分钱包
- 新增钱包接口:
  
  - `GET /sapi/v1/account/info`: 取得 “VIP 等级”, “是否开启杠杆帐户” 及 “是否开启合约帐户”

* * *

## 2024-04-18[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-04-18 "2024-04-18的直接链接")

- 新增钱包接口:
  
  - `GET /sapi/v1/capital/withdraw/address/list`: 获取提现地址列表

* * *

## 2024-04-08[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-04-08 "2024-04-08的直接链接")

- 更新钱包接口:
  
  - `GET /sapi/v1/capital/config/getall`: 删除返回字段 `resetAddressStatus`

* * *

## 2024-01-15[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2024-01-15 "2024-01-15的直接链接")

- 新增钱包接口:
  
  - `GET /sapi/v1/spot/delist-schedule`：查询现货币对的下架计划
- 更新钱包接口:
  
  - `GET /sapi/v1/asset/dribblet`：增加参数`accountType`
  - `POST /sapi/v1/asset/dust-btc`：增加参数`accountType`
  - `POST /sapi/v1/asset/dust`：增加参数`accountType`

* * *

## 2023-11-21[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2023-11-21 "2023-11-21的直接链接")

- 新增钱包接口:
  
  - `GET /sapi/v1/capital/deposit/address/list`: 根据网络币种或币种获取充值地址列表

* * *

## 2023-11-02[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2023-11-02 "2023-11-02的直接链接")

- 钱包接口更新:
  
  - `GET /sapi/v1/account/apiRestrictions`: 新增相应字段 `enablePortfolioMarginTrading`

* * *

## 2023-09-22[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2023-09-22 "2023-09-22的直接链接")

- 新增钱包接口：
  
  - `GET /sapi/v1/asset/wallet/balance`: 查询用户钱包余额
  - `GET /sapi/v1/asset/custody/transfer-history`: 查询用户委托资金历史(适用主账户)

* * *

## 2023-09-04[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2023-09-04 "2023-09-04的直接链接")

- 钱包接口限频调整：
  
  - `GET /sapi/v1/capital/withdraw/history`: Weight(UID)调整为 18000，每秒最多请求 10 次。请查看接口描述获得更详细内容

* * *

## 2023-05-18[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2023-05-18 "2023-05-18的直接链接")

- 新增钱包接口：
  
  - `POST /sapi/v1/capital/deposit/credit-apply`：申请充值到过期地址的一键上账

* * *

## 2023-05-09[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2023-05-09 "2023-05-09的直接链接")

- 更新钱包接口：
  
  - `POST /sapi/v1/asset/transfer`：增加枚举类型`MAIN_PORTFOLIO_MARGIN` 和 `PORTFOLIO_MARGIN_MAIN`

* * *

## 2023-02-02[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2023-02-02 "2023-02-02的直接链接")

- 更新钱包接口:
  
  - 万能划转`POST /sapi/v1/asset/transfer`支持期权

* * *

## 2022-12-26[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-12-26 "2022-12-26的直接链接")

- 添加钱包接口：
  
  - `GET /sapi/v1/capital/contract/convertible-coins`: 查询用户充值/提现时候稳定币与 BUSD 互转的设置
  - `POST /sapi/v1/capital/contract/convertible-coins`: 修改哪些稳定币可与 BUSD 互相转换

* * *

## 2022-11-18[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-11-18 "2022-11-18的直接链接")

- 新增钱包接口:
  
  - `GET /sapi/v1/asset/ledger-transfer/cloud-mining/queryByPage`: 云算力支付和退款历史分页查询

* * *

## 2022-11-02[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-11-02 "2022-11-02的直接链接")

- 更新钱包接口：
  
  - `POST /sapi/v1/capital/withdraw/apply`： 权重改至 Weight(UID) 600。

* * *

## 2022-10-28[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-10-28 "2022-10-28的直接链接")

- 更新钱包接口：
  
  - `POST /sapi/v1/asset/convert-transfer`: 增加 `accountType` 参数
  - `POST /sapi/v1/asset/convert-transfer/queryByPage`: 改为 `GET` 请求方式，增加 `clientTranId` 参数

* * *

## 2022-09-29[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-09-29 "2022-09-29的直接链接")

- 添加钱包接口：
  
  - `POST /sapi/v1/asset/convert-transfer`: 稳定币自动兑换划转
  - `POST /sapi/v1/asset/convert-transfer/queryByPage`: 稳定币自动兑换划转查询

* * *

## 2022-07-01[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-07-01 "2022-07-01的直接链接")

- 添加新钱包接口：
  
  - `POST /sapi/v3/asset/getUserAsset` 获取用户持仓。

* * *

## 2022-2-17[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-2-17 "2022-2-17的直接链接")

以下更新于**2 月 24, 2022 08:00 AM UTC**生效

- 更新钱包接口：
  
  - `GET /sapi/v1/accountSnapshot`

接口查询范围缩短为仅支持查询最近一个月数据，即 startTime 不支持选定最近 1 个月之外的时间。

* * *

## 2022-2-09[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2022-2-09 "2022-2-09的直接链接")

- 新增钱包接口:
  
  - `POST /sapi/v1/asset/dust-btc` 以获取可以转换成 BNB 的小额资产

## 2021-12-30[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-12-30 "2021-12-30的直接链接")

- 更新钱包接口：
  
  - 由于矿池钱包合并于资金账户钱包,用户万向划转接口 `POST /sapi/v1/asset/transfer`的以下划转类型 MAIN\_MINING, MINING\_MAIN, MINING\_UMFUTURE, MARGIN\_MINING,和 MINING\_MARGIN 将于 **1 月 05, 2022 08:00 AM UTC** 停止使用

* * *

## 2021-11-19[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-11-19 "2021-11-19的直接链接")

- 更新钱包接口:
  
  - 新增响应参数 `info` 于接口 `GET /sapi/v1/capital/withdraw/history` 以显示提币失败原因

* * *

## 2021-11-19[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-11-19-1 "2021-11-19的直接链接")

- 更新钱包接口:
  
  - 新增响应参数 `info` 于接口 `GET /sapi/v1/capital/withdraw/history` 以显示提币失败原因

* * *

## 2021-11-18[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-11-18 "2021-11-18的直接链接")

以下更新于**11 月 25, 2021 08:00 AM UTC**生效

- 更新钱包接口：
  
  - `GET /sapi/v1/accountSnapshot`

接口查询范围缩短为仅支持查询最近半年内的数据，即 startTime 不支持选定最近 6 个月之外的时间。若您没有传入 startTime 和 endTime，则默认返回最近 7 天的数据

* * *

## 2021-11-17[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-11-17 "2021-11-17的直接链接")

- 以下接口将于**11 月 17, 2021 13:00 PM UTC**停止使用:
  
  - `POST /sapi/v1/account/apiRestrictions/ipRestriction` 以支持用户为 API Key 开启或关闭 IP 白名单
  - `POST /sapi/v1/account/apiRestrictions/ipRestriction/ipList` 以支持用户为 API Key 添加 IP 白名单地址列表
  - `GET /sapi/v1/account/apiRestrictions/ipRestriction` 以支持用户为 API Key 查询 IP 白名单
  - `DELETE /sapi/v1/account/apiRestrictions/ipRestriction/ipList` 以支持用户为 API Key 删除 IP 白名单地址列表

* * *

## 2021-11-16[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-11-16 "2021-11-16的直接链接")

- 新增子母账户接口:
  
  - `POST /sapi/v1/sub-account/subAccountApi/ipRestriction` 以支持母账户为子账户 API Key 开启或关闭 IP 白名单
  - `POST /sapi/v1/sub-account/subAccountApi/ipRestriction/ipList` 以支持母账户为子账户 API Key 添加 IP 白名单地址列表
  - `GET /sapi/v1/sub-account/subAccountApi/ipRestriction` 以支持母账户为子账户 API Key 查询 IP 白名单
  - `DELETE /sapi/v1/sub-account/subAccountApi/ipRestriction/ipList` 以支持母账户为子账户 API Key 删除 IP 白名单地址列表

* * *

## 2021-11-05[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-11-05 "2021-11-05的直接链接")

- 更新钱包接口:
  
  - 新增参数 `walletType`于提币接口`POST /sapi/v1/capital/withdraw/apply`以支持用户选择从`现货钱包`或`资金钱包`进行提币

* * *

## 2021-11-04[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-11-04 "2021-11-04的直接链接")

以下更新于**11 月 11, 2021 08:00 AM UTC**生效

- 更新接口：
  
  - `GET /sapi/v1/asset/transfer`

接口查询范围缩短为仅支持查询最近半年内的数据，即 startTime 不支持选定最近 6 个月之外的时间。若您没有传入 startTime 和 endTime，则默认返回最近 7 天的数据

* * *

## 2021-10-22[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-10-22 "2021-10-22的直接链接")

- 钱包接口更新:
  
  - 新增划转类型 `MAIN_FUNDING`,`FUNDING_MAIN`,`FUNDING_UMFUTURE`,`UMFUTURE_FUNDING`,`MARGIN_FUNDING`,`FUNDING_MARGIN`,`FUNDING_CMFUTURE`and `CMFUTURE_FUNDING` 于用户万向划转接口 `POST /sapi/v1/asset/transfer` 和 `GET /sapi/v1/asset/transfer` 以支持资金账户和现货账户，杠杆全仓账户，U 本位合约账户，币本位合约账户之间相互划转
  - 由于 C2C 账户，币安支付、币安卡等业务合并至资金账户，用户万向划转接口`POST /sapi/v1/asset/transfer` 和 `GET /sapi/v1/asset/transfer` 的以下划转类型`MAIN_C2C`,`C2C_MAIN`,`C2C_UMFUTURE`,`C2C_MINING`,`UMFUTURE_C2C`,`MINING_C2C`,`MARGIN_C2C`,`C2C_MARGIN`,`MAIN_PAY`和`PAY_MAIN` 将于**11 月 04, 2021 08:00 AM UTC** 停止使用

* * *

## 2021-09-03[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-09-03 "2021-09-03的直接链接")

- 更新钱包接口:
  
  - 新增响应内容 `sameAddress`，`depositDust` 和 `specialWithdrawTips`于`GET /sapi/v1/capital/config/getall`, `sameAddress` 表示需要输入 memo 的币种,`depositDust` 表示最小可上帐金额,`specialWithdrawTips` 表示提现时的特殊说明
  - 新增响应内容 `confirmNo`于`GET /sapi/v1/capital/withdraw/history` 以支持查询提现确认数

* * *

## 2021-08-27[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-08-27 "2021-08-27的直接链接")

- 更新钱包接口:
  
  - 新增参数 `withdrawOrderId` 于 `GET /sapi/v1/capital/withdraw/history` 以支持查询指定`withdrawOrderId`的提币历史记录
  - 新增响应内容 `unlockConfirm` 于 `GET /sapi/v1/capital/deposit/hisrec` 以支持查询解锁需要的网络确认次数

* * *

## 2021-08-20[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-08-20 "2021-08-20的直接链接")

- 更新钱包接口:
  
  - 新增参数`fromSymbol`，`toSymbol`和新增划转类型 `ISOLATEDMARGIN_MARGIN`， `MARGIN_ISOLATEDMARGIN`， `ISOLATEDMARGIN_ISOLATEDMARGIN` 于接口 `POST /sapi/v1/asset/transfer` 和 `GET /sapi/v1/asset/transfer` 以支持杠杆逐仓钱包与杠杆全仓钱包之前相互划转

* * *

## 2021-07-16[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-07-16 "2021-07-16的直接链接")

- 新增钱包接口:
  
  - `GET /sapi/v1/account/apiRestrictions` 以查询用户 API Key 权限

* * *

## 2021-07-09[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-07-09 "2021-07-09的直接链接")

- 新增钱包接口:
  
  - `POST /sapi/v1/asset/get-funding-asset` 以查询资金账户资产，目前支持查询的业务为：Binance Pay, Binance Card, Binance Gift Card, Stock Token

* * *

## 2021-06-24[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-06-24 "2021-06-24的直接链接")

- 钱包接口更新:
  
  - `GET /sapi/v1/capital/withdraw/history` 现有的 `limit` 参数增加默认值 1000，最大值 1000 的限制
  - `GET /sapi/v1/capital/deposit/hisrec` 现有的 `limit` 参数增加默认值 1000，最大值 1000 的限制

* * *

## 2021-05-26[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2021-05-26 "2021-05-26的直接链接")

- 更新钱包接口：
  
  - 用户万向划转接口 `POST /sapi/v1/asset/transfer` 和`GET /sapi/v1/asset/transfer` 新增划转类型`MAIN_PAY` , `PAY_MAIN` 以支持现货和支付账户之间相互划转

* * *

## 2020-12-30[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2020-12-30 "2020-12-30的直接链接")

- 新增钱包接口:
  
  - `POST /sapi/v1/asset/transfer` 用户万向划转接口，以支持现货，全仓杠杆，合约，C2C，矿池账户间划转。
  - `GET /sapi/v1/asset/transfer` 以支持查询用户万向划转历史记录。

* * *

## 2020-04-02[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2020-04-02 "2020-04-02的直接链接")

- 接口 `GET /sapi/v1/capital/config/getall` 返回内容新增字段：
  
  - `minConfirm` 表示资产上账所需的最小确认数
  - `unLockConfirm` 表示资产解锁需所需确认数

* * *

## 2020-03-13[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2020-03-13 "2020-03-13的直接链接")

- 新增可选参数 `transactionFeeFlag` 于以下提币接口:
  
  - `POST /sapi/v1/capital/withdraw/apply`
  - `POST /wapi/v3/withdraw.html`

* * *

## 2020-01-15[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2020-01-15 "2020-01-15的直接链接")

- 接口`POST /wapi/v3/withdraw.html` 新增参数 `withdrawOrderId`: 用户自定义提币 id
- 接口`GET /wapi/v3/withdrawHistory.html` 返回内容新增字段 `withdrawOrderId`: 该笔提币的用户自定义 id

* * *

## 2019-12-25[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2019-12-25 "2019-12-25的直接链接")

- 新增请求时间间隔于以下接口  
  `GET /sapi/v1/capital/withdraw/history`,  
  `GET /wapi/v3/withdrawHistory.html`,  
  `GET /sapi/v1/capital/deposit/hisrec` and  
  `GET /wapi/v3/depositHistory.html`: _ 默认`startTime`为当前时间起 90 天前， 默认`endTime`为当前时间； _ 请注意`startTime` 与 `endTime` 的默认时间戳，保证请求时间间隔不超过 90 天； * 同时提交`startTime` 与 `endTime`间隔不得超过 90 天.

* * *

## 2019-12-18[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2019-12-18 "2019-12-18的直接链接")

- 新增接口用以获取账户每日资产快照:  
  `GET /sapi/v1/accountSnapshot`

* * *

## 2019-11-28[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2019-11-28 "2019-11-28的直接链接")

- 新增 SAPI 接口用以关闭账户站内划转功能：  
  `POST /sapi/v1/account/disableFastWithdrawSwitch (HMAC SHA256)`
- 新增 SAPI 接口用以开启账户站内划转功能：  
  `POST /sapi/v1/account/enableFastWithdrawSwitch (HMAC SHA256)`

* * *

## 2019-10-29[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2019-10-29 "2019-10-29的直接链接")

- 新增钱包提币功能相关的 sapi 接口
  
  - `POST /sapi/v1/capital/withdraw/apply (HMAC SHA256)`: 提币。
  - `Get /sapi/v1/capital/withdraw/history (HMAC SHA256)`: 获取提币历史(支持多网络)。

* * *

## 2019-10-14[​](https://developers.binance.com/docs/zh-CN/wallet/change-log#2019-10-14 "2019-10-14的直接链接")

- 新增钱包功能相关的 sapi 接口
  
  - `GET /sapi/v1/capital/config/getall (HMAC SHA256)`: 获取针对用户的所有币种信息。
  - `GET /sapi/v1/capital/deposit/hisrec (HMAC SHA256)`: 获取充值历史(支持多网络)。
  - `GET /sapi/v1/capital/deposit/address (HMAC SHA256)`: 获取充值地址(支持多网络).