# 错误代码

> 错误JSON格式:

```javascript
{
  "code":-1121,
  "msg":"Invalid symbol."
}
```

错误由两部分组成：错误代码和消息。 代码是通用的，但是消息可能会有所不同。

## 10xx -常规服务器或网络问题[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#10xx--%E5%B8%B8%E8%A7%84%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%88%96%E7%BD%91%E7%BB%9C%E9%97%AE%E9%A2%98 "10xx -常规服务器或网络问题的直接链接")

### -1000 UNKNOWN[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1000-unknown "-1000 UNKNOWN的直接链接")

- 处理请求时发生未知错误。
- 处理请求时发生未知错误。\[%s]

### -1001 DISCONNECTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1001-disconnected "-1001 DISCONNECTED的直接链接")

- 内部错误; 无法处理您的请求。 请再试一次.

### -1002 UNAUTHORIZED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1002-unauthorized "-1002 UNAUTHORIZED的直接链接")

- 您无权执行此请求。

### -1003 TOO\_MANY\_REQUESTS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1003-too_many_requests "-1003 TOO_MANY_REQUESTS的直接链接")

- 排队的请求过多。
- 请求权重过多； 当前限制是 %s 每 %s 的请求权重。 请使用 Websocket Streams 进行实时更新，以避免轮询API。
- 请求权重过多； IP被禁止，直到％s。 请使用 Websocket Streams 进行实时更新，以免被禁。

### -1004 SERVER\_BUSY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1004-server_busy "-1004 SERVER_BUSY的直接链接")

- 服务器正忙，请稍候再试。

### -1006 UNEXPECTED\_RESP[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1006-unexpected_resp "-1006 UNEXPECTED_RESP的直接链接")

- 从消息总线收到意外的响应。 执行状态未知。

### -1007 TIMEOUT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1007-timeout "-1007 TIMEOUT的直接链接")

- 等待后端服务器响应超时。 发送状态未知； 执行状态未知。

### -1008 SERVER\_BUSY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1008-server_busy "-1008 SERVER_BUSY的直接链接")

- 现货交易服务器当前因其他请求而过载。 请在几分钟后重试。

### -1014 UNKNOWN\_ORDER\_COMPOSITION[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1014-unknown_order_composition "-1014 UNKNOWN_ORDER_COMPOSITION的直接链接")

- 不支持的订单组合。

### -1015 TOO\_MANY\_ORDERS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1015-too_many_orders "-1015 TOO_MANY_ORDERS的直接链接")

- 新订单太多。
- 新订单太多； 当前限制为每％s ％s个订单。

### -1016 SERVICE\_SHUTTING\_DOWN[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1016-service_shutting_down "-1016 SERVICE_SHUTTING_DOWN的直接链接")

- 该服务不可用。

### -1020 UNSUPPORTED\_OPERATION[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1020-unsupported_operation "-1020 UNSUPPORTED_OPERATION的直接链接")

- 不支持此操作。

### -1021 INVALID\_TIMESTAMP[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1021-invalid_timestamp "-1021 INVALID_TIMESTAMP的直接链接")

- 此请求的时间戳在recvWindow之外。
- 此请求的时间戳比服务器时间提前1000毫秒。

### -1022 INVALID\_SIGNATURE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1022-invalid_signature "-1022 INVALID_SIGNATURE的直接链接")

- 此请求的签名无效。

### -1099 Not found, authenticated, or authorized[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1099-not-found-authenticated-or-authorized "-1099 Not found, authenticated, or authorized的直接链接")

- 替换错误代码-1999

## 11xx - 2xxx Request issues[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#11xx---2xxx-request-issues "11xx - 2xxx Request issues的直接链接")

### -1100 ILLEGAL\_CHARS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1100-illegal_chars "-1100 ILLEGAL_CHARS的直接链接")

- 在参数中发现非法字符。
- 在参数中发现非法字符。`％s`
- 在参数`％s`中发现非法字符； 合法范围是`％s`。

### -1101 TOO\_MANY\_PARAMETERS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1101-too_many_parameters "-1101 TOO_MANY_PARAMETERS的直接链接")

- 为此端点发送的参数太多。
- 参数太多； 预期为`％s`并收到了`％s`。
- 检测到的参数值重复。

### -1102 MANDATORY\_PARAM\_EMPTY\_OR\_MALFORMED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1102-mandatory_param_empty_or_malformed "-1102 MANDATORY_PARAM_EMPTY_OR_MALFORMED的直接链接")

- 未发送强制性参数，该参数为空/空或格式错误。
- 强制参数`％s`未发送，为空/空或格式错误。
- 必须发送参数`％s`或`％s`，但两者均为空！

### -1103 UNKNOWN\_PARAM[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1103-unknown_param "-1103 UNKNOWN_PARAM的直接链接")

- 发送了未知参数。

### -1104 UNREAD\_PARAMETERS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1104-unread_parameters "-1104 UNREAD_PARAMETERS的直接链接")

- 并非所有发送的参数都被读取。
- 并非所有发送的参数都被读取； 读取了`％s`参数，但被发送了`％s`。

### -1105 PARAM\_EMPTY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1105-param_empty "-1105 PARAM_EMPTY的直接链接")

- 参数为空。
- 参数`％s`为空。

### -1106 PARAM\_NOT\_REQUIRED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1106-param_not_required "-1106 PARAM_NOT_REQUIRED的直接链接")

- 不需要时已发送参数。
- 不需要时发送参数`％s`。

### -1111 BAD\_PRECISION[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1111-bad_precision "-1111 BAD_PRECISION的直接链接")

- 精度超过为此资产定义的最大值。

### -1112 NO\_DEPTH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1112-no_depth "-1112 NO_DEPTH的直接链接")

- 交易对没有挂单。

### -1114 TIF\_NOT\_REQUIRED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1114-tif_not_required "-1114 TIF_NOT_REQUIRED的直接链接")

- 不需要时发送了TimeInForce参数。

### -1115 INVALID\_TIF[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1115-invalid_tif "-1115 INVALID_TIF的直接链接")

- 无效 timeInForce.

### -1116 INVALID\_ORDER\_TYPE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1116-invalid_order_type "-1116 INVALID_ORDER_TYPE的直接链接")

- 无效订单类型。

### -1117 INVALID\_SIDE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1117-invalid_side "-1117 INVALID_SIDE的直接链接")

- 无效买卖方向。

### -1118 EMPTY\_NEW\_CL\_ORD\_ID[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1118-empty_new_cl_ord_id "-1118 EMPTY_NEW_CL_ORD_ID的直接链接")

- 新的客户订单ID为空。

### -1119 EMPTY\_ORG\_CL\_ORD\_ID[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1119-empty_org_cl_ord_id "-1119 EMPTY_ORG_CL_ORD_ID的直接链接")

- 客户自定义的订单ID为空。

### -1120 BAD\_INTERVAL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1120-bad_interval "-1120 BAD_INTERVAL的直接链接")

- 无效时间间隔。

### -1121 BAD\_SYMBOL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1121-bad_symbol "-1121 BAD_SYMBOL的直接链接")

- 无效的交易对。

### -1125 INVALID\_LISTEN\_KEY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1125-invalid_listen_key "-1125 INVALID_LISTEN_KEY的直接链接")

- 该listenKey不存在。

### -1127 MORE\_THAN\_XX\_HOURS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1127-more_than_xx_hours "-1127 MORE_THAN_XX_HOURS的直接链接")

- 查询间隔太大。
- 从开始时间到结束时间之间超过％s小时。

### -1128 OPTIONAL\_PARAMS\_BAD\_COMBO[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1128-optional_params_bad_combo "-1128 OPTIONAL_PARAMS_BAD_COMBO的直接链接")

- 可选参数组合无效。

### -1130 INVALID\_PARAMETER[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1130-invalid_parameter "-1130 INVALID_PARAMETER的直接链接")

- 发送的参数为无效数据。
- 发送参数`％s`的数据无效。

### -1131 BAD\_RECV\_WINDOW[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1131-bad_recv_window "-1131 BAD_RECV_WINDOW的直接链接")

- `recvWindow` 必须小于 60000

### -1134 BAD\_STRATEGY\_TYPE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1134-bad_strategy_type "-1134 BAD_STRATEGY_TYPE的直接链接")

- `strategyType` 必须小于 1000000

#### -1145 INVALID\_CANCEL\_RESTRICTIONS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1145-invalid_cancel_restrictions "-1145 INVALID_CANCEL_RESTRICTIONS的直接链接")

- `cancelRestrictions` 必须是 `ONLY_NEW` 或者 `ONLY_PARTIALLY_FILLED`。

#### -1151 重复的交易对[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-1151-%E9%87%8D%E5%A4%8D%E7%9A%84%E4%BA%A4%E6%98%93%E5%AF%B9 "-1151 重复的交易对的直接链接")

- Symbol is present multiple times in the list.

### -2010 NEW\_ORDER\_REJECTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2010-new_order_rejected "-2010 NEW_ORDER_REJECTED的直接链接")

- 新订单被拒绝

### -2011 CANCEL\_REJECTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2011-cancel_rejected "-2011 CANCEL_REJECTED的直接链接")

- 取消订单被拒绝

### -2013 NO\_SUCH\_ORDER[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2013-no_such_order "-2013 NO_SUCH_ORDER的直接链接")

- 订单不存在。

### -2014 BAD\_API\_KEY\_FMT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2014-bad_api_key_fmt "-2014 BAD_API_KEY_FMT的直接链接")

- API-key 格式无效。

### -2015 REJECTED\_MBX\_KEY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2015-rejected_mbx_key "-2015 REJECTED_MBX_KEY的直接链接")

- 无效的API密钥，IP或操作权限。

### -2016 NO\_TRADING\_WINDOW[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2016-no_trading_window "-2016 NO_TRADING_WINDOW的直接链接")

- 找不到该交易对的交易窗口。 尝试改为24小时自动报价。

#### -2026 ORDER\_ARCHIVED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2026-order_archived "-2026 ORDER_ARCHIVED的直接链接")

- 订单已被存档因为此订单被取消或过期，无交易数量而最后的更新已超过 90 天前。

## 3xxx-5xxx SAPI 具体问题[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#3xxx-5xxx-sapi-%E5%85%B7%E4%BD%93%E9%97%AE%E9%A2%98 "3xxx-5xxx SAPI 具体问题的直接链接")

### -3000 INNER\_FAILURE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3000-inner_failure "-3000 INNER_FAILURE的直接链接")

- 内部服务器错误。

### -3001 NEED\_ENABLE\_2FA[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3001-need_enable_2fa "-3001 NEED_ENABLE_2FA的直接链接")

- 请先启用2FA。

### -3002 ASSET\_DEFICIENCY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3002-asset_deficiency "-3002 ASSET_DEFICIENCY的直接链接")

- 此资产不存在。

### -3003 NO\_OPENED\_MARGIN\_ACCOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3003-no_opened_margin_account "-3003 NO_OPENED_MARGIN_ACCOUNT的直接链接")

- 杠杆账户不存在。

### -3004 TRADE\_NOT\_ALLOWED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3004-trade_not_allowed "-3004 TRADE_NOT_ALLOWED的直接链接")

- 禁止交易。

### -3005 TRANSFER\_OUT\_NOT\_ALLOWED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3005-transfer_out_not_allowed "-3005 TRANSFER_OUT_NOT_ALLOWED的直接链接")

- 不允许转账。

### -3006 EXCEED\_MAX\_BORROWABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3006-exceed_max_borrowable "-3006 EXCEED_MAX_BORROWABLE的直接链接")

- 您的已借金额已超过最高可借金额。

### -3007 HAS\_PENDING\_TRANSACTION[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3007-has_pending_transaction "-3007 HAS_PENDING_TRANSACTION的直接链接")

- 您有待处理的交易，请稍后再试。

### -3008 BORROW\_NOT\_ALLOWED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3008-borrow_not_allowed "-3008 BORROW_NOT_ALLOWED的直接链接")

- 不允许借款。

### -3009 ASSET\_NOT\_MORTGAGEABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3009-asset_not_mortgageable "-3009 ASSET_NOT_MORTGAGEABLE的直接链接")

- 此资产目前不允许转入杠杆账户。

### -3010 REPAY\_NOT\_ALLOWED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3010-repay_not_allowed "-3010 REPAY_NOT_ALLOWED的直接链接")

- 不允许还款。

### -3011 BAD\_DATE\_RANGE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3011-bad_date_range "-3011 BAD_DATE_RANGE的直接链接")

- 您输入的日期无效。

### -3012 ASSET\_ADMIN\_BAN\_BORROW[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3012-asset_admin_ban_borrow "-3012 ASSET_ADMIN_BAN_BORROW的直接链接")

- 此资产禁止借款。

### -3013 LT\_MIN\_BORROWABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3013-lt_min_borrowable "-3013 LT_MIN_BORROWABLE的直接链接")

- 借入金额少于最低借入金额。

### -3014 ACCOUNT\_BAN\_BORROW[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3014-account_ban_borrow "-3014 ACCOUNT_BAN_BORROW的直接链接")

- 此帐户禁止借款。

### -3015 REPAY\_EXCEED\_LIABILITY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3015-repay_exceed_liability "-3015 REPAY_EXCEED_LIABILITY的直接链接")

- 还款额超过借款额。

### -3016 LT\_MIN\_REPAY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3016-lt_min_repay "-3016 LT_MIN_REPAY的直接链接")

- 还款额少于最低还款额。

### -3017 ASSET\_ADMIN\_BAN\_MORTGAGE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3017-asset_admin_ban_mortgage "-3017 ASSET_ADMIN_BAN_MORTGAGE的直接链接")

- 此资产目前不允许转入保证金账户。

### -3018 ACCOUNT\_BAN\_MORTGAGE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3018-account_ban_mortgage "-3018 ACCOUNT_BAN_MORTGAGE的直接链接")

- 此帐户已禁止转入。

### -3019 ACCOUNT\_BAN\_ROLLOUT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3019-account_ban_rollout "-3019 ACCOUNT_BAN_ROLLOUT的直接链接")

- 此帐户禁止转出。

### -3020 EXCEED\_MAX\_ROLLOUT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3020-exceed_max_rollout "-3020 EXCEED_MAX_ROLLOUT的直接链接")

- 转出金额超过上限。

### -3021 PAIR\_ADMIN\_BAN\_TRADE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3021-pair_admin_ban_trade "-3021 PAIR_ADMIN_BAN_TRADE的直接链接")

- 杠杆账户无法交易此交易对。

### -3022 ACCOUNT\_BAN\_TRADE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3022-account_ban_trade "-3022 ACCOUNT_BAN_TRADE的直接链接")

- 账号被禁止交易。

### -3023 WARNING\_MARGIN\_LEVEL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3023-warning_margin_level "-3023 WARNING_MARGIN_LEVEL的直接链接")

- 无法在当前杠杆倍数下转出资金或者下单

### -3024 FEW\_LIABILITY\_LEFT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3024-few_liability_left "-3024 FEW_LIABILITY_LEFT的直接链接")

- 付款之后未付款的债务太小

### -3025 INVALID\_EFFECTIVE\_TIME[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3025-invalid_effective_time "-3025 INVALID_EFFECTIVE_TIME的直接链接")

- 输入时间有误。

### -3026 VALIDATION\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3026-validation_failed "-3026 VALIDATION_FAILED的直接链接")

- 输入参数有误。

### -3027 NOT\_VALID\_MARGIN\_ASSET[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3027-not_valid_margin_asset "-3027 NOT_VALID_MARGIN_ASSET的直接链接")

- 无效的杠杆资产。

### -3028 NOT\_VALID\_MARGIN\_PAIR[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3028-not_valid_margin_pair "-3028 NOT_VALID_MARGIN_PAIR的直接链接")

- 无效的杠杆交易对。

### -3029 TRANSFER\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3029-transfer_failed "-3029 TRANSFER_FAILED的直接链接")

- 转账失败。

### -3036 ACCOUNT\_BAN\_REPAY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3036-account_ban_repay "-3036 ACCOUNT_BAN_REPAY的直接链接")

- 此账号无法还款。

### -3037 PNL\_CLEARING[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3037-pnl_clearing "-3037 PNL_CLEARING的直接链接")

- `PNL`正在清帐，请稍等。

### -3038 LISTEN\_KEY\_NOT\_FOUND[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3038-listen_key_not_found "-3038 LISTEN_KEY_NOT_FOUND的直接链接")

- 找不到`Listen key`

### -3041 BALANCE\_NOT\_CLEARED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3041-balance_not_cleared "-3041 BALANCE_NOT_CLEARED的直接链接")

- 余额不足

### -3042 PRICE\_INDEX\_NOT\_FOUND[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3042-price_index_not_found "-3042 PRICE_INDEX_NOT_FOUND的直接链接")

- 该杠杆交易对无可用价格指数。

### -3043 TRANSFER\_IN\_NOT\_ALLOWED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3043-transfer_in_not_allowed "-3043 TRANSFER_IN_NOT_ALLOWED的直接链接")

- 不允许转入。

### -3044 SYSTEM\_BUSY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3044-system_busy "-3044 SYSTEM_BUSY 的直接链接")

- 系统繁忙。

### -3045 SYSTEM[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3045-system "-3045 SYSTEM的直接链接")

- 系统目前没有足够可借的资产。

### -3999 NOT\_WHITELIST\_USER[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-3999-not_whitelist_user "-3999 NOT_WHITELIST_USER的直接链接")

- 此功能只面向邀请的用户。

### -4001 CAPITAL\_INVALID[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4001-capital_invalid "-4001 CAPITAL_INVALID的直接链接")

- 非法操作

### -4002 CAPITAL\_IG[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4002-capital_ig "-4002 CAPITAL_IG的直接链接")

- 非法获取

### -4003 CAPITAL\_IEV[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4003-capital_iev "-4003 CAPITAL_IEV的直接链接")

- 非法邮箱验证

### -4004 CAPITAL\_UA[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4004-capital_ua "-4004 CAPITAL_UA的直接链接")

- 未登录或者认证。

### -4005 CAPAITAL\_TOO\_MANY\_REQUEST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4005-capaital_too_many_request "-4005 CAPAITAL_TOO_MANY_REQUEST的直接链接")

- 请求太频繁。

### -4006 CAPITAL\_ONLY\_SUPPORT\_PRIMARY\_ACCOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4006-capital_only_support_primary_account "-4006 CAPITAL_ONLY_SUPPORT_PRIMARY_ACCOUNT的直接链接")

- 只支持主账号。

### -4007 CAPITAL\_ADDRESS\_VERIFICATION\_NOT\_PASS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4007-capital_address_verification_not_pass "-4007 CAPITAL_ADDRESS_VERIFICATION_NOT_PASS的直接链接")

- 地址的没有通过校验。

### -4008 CAPITAL\_ADDRESS\_TAG\_VERIFICATION\_NOT\_PASS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4008-capital_address_tag_verification_not_pass "-4008 CAPITAL_ADDRESS_TAG_VERIFICATION_NOT_PASS的直接链接")

- 地址的标记信息(`tag`)没有通过校验。

### -4010 CAPITAL\_WHITELIST\_EMAIL\_CONFIRM[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4010-capital_whitelist_email_confirm "-4010 CAPITAL_WHITELIST_EMAIL_CONFIRM的直接链接")

- 确认电子邮件已经列入白名单。

### -4011 CAPITAL\_WHITELIST\_EMAIL\_EXPIRED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4011-capital_whitelist_email_expired "-4011 CAPITAL_WHITELIST_EMAIL_EXPIRED的直接链接")

- 列入白名单的电子邮件无效。

### -4012 CAPITAL\_WHITELIST\_CLOSE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4012-capital_whitelist_close "-4012 CAPITAL_WHITELIST_CLOSE的直接链接")

- 白名单未打开。

### -4013 CAPITAL\_WITHDRAW\_2FA\_VERIFY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4013-capital_withdraw_2fa_verify "-4013 CAPITAL_WITHDRAW_2FA_VERIFY的直接链接")

- 2FA未打开。

### -4014 CAPITAL\_WITHDRAW\_LOGIN\_DELAY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4014-capital_withdraw_login_delay "-4014 CAPITAL_WITHDRAW_LOGIN_DELAY的直接链接")

- 在登录后的2分钟之内不允许提款。

### -4015 CAPITAL\_WITHDRAW\_RESTRICTED\_MINUTE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4015-capital_withdraw_restricted_minute "-4015 CAPITAL_WITHDRAW_RESTRICTED_MINUTE的直接链接")

- 暂停提款

### -4016 CAPITAL\_WITHDRAW\_RESTRICTED\_PASSWORD[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4016-capital_withdraw_restricted_password "-4016 CAPITAL_WITHDRAW_RESTRICTED_PASSWORD的直接链接")

- 在密码修改后的24小时之内不允许提款。

### -4017 CAPITAL\_WITHDRAW\_RESTRICTED\_UNBIND\_2FA[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4017-capital_withdraw_restricted_unbind_2fa "-4017 CAPITAL_WITHDRAW_RESTRICTED_UNBIND_2FA的直接链接")

- 在2FA发行后的24小时之内不允许提款。

### -4018 CAPITAL\_WITHDRAW\_ASSET\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4018-capital_withdraw_asset_not_exist "-4018 CAPITAL_WITHDRAW_ASSET_NOT_EXIST的直接链接")

- 此资产不存在。

### -4019 CAPITAL\_WITHDRAW\_ASSET\_PROHIBIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4019-capital_withdraw_asset_prohibit "-4019 CAPITAL_WITHDRAW_ASSET_PROHIBIT的直接链接")

- 此资产不允许提款。

### -4021 CAPITAL\_WITHDRAW\_AMOUNT\_MULTIPLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4021-capital_withdraw_amount_multiple "-4021 CAPITAL_WITHDRAW_AMOUNT_MULTIPLE的直接链接")

- 资产的提款数量必须是％s的％s倍。

### -4022 CAPITAL\_WITHDRAW\_MIN\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4022-capital_withdraw_min_amount "-4022 CAPITAL_WITHDRAW_MIN_AMOUNT的直接链接")

- 不须少于最低的提款数量％s。

### -4023 CAPITAL\_WITHDRAW\_MAX\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4023-capital_withdraw_max_amount "-4023 CAPITAL_WITHDRAW_MAX_AMOUNT的直接链接")

- 在24小时之内，不须超过最高的提款数量。

### -4024 CAPITAL\_WITHDRAW\_USER\_NO\_ASSET[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4024-capital_withdraw_user_no_asset "-4024 CAPITAL_WITHDRAW_USER_NO_ASSET的直接链接")

- 当前用户没有此资产。

### -4025 CAPITAL\_WITHDRAW\_USER\_ASSET\_LESS\_THAN\_ZERO[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4025-capital_withdraw_user_asset_less_than_zero "-4025 CAPITAL_WITHDRAW_USER_ASSET_LESS_THAN_ZERO的直接链接")

- 持有资产的数量小于零。

### -4026 CAPITAL\_WITHDRAW\_USER\_ASSET\_NOT\_ENOUGH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4026-capital_withdraw_user_asset_not_enough "-4026 CAPITAL_WITHDRAW_USER_ASSET_NOT_ENOUGH的直接链接")

- 此资产余额不足。

### -4027 CAPITAL\_WITHDRAW\_GET\_TRAN\_ID\_FAILURE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4027-capital_withdraw_get_tran_id_failure "-4027 CAPITAL_WITHDRAW_GET_TRAN_ID_FAILURE的直接链接")

- 无法获取tranId。

### -4028 CAPITAL\_WITHDRAW\_MORE\_THAN\_FEE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4028-capital_withdraw_more_than_fee "-4028 CAPITAL_WITHDRAW_MORE_THAN_FEE的直接链接")

- 提款金额必须多于佣金额。

### -4029 CAPITAL\_WITHDRAW\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4029-capital_withdraw_not_exist "-4029 CAPITAL_WITHDRAW_NOT_EXIST的直接链接")

- 此提款记录不存在。

### -4030 CAPITAL\_WITHDRAW\_CONFIRM\_SUCCESS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4030-capital_withdraw_confirm_success "-4030 CAPITAL_WITHDRAW_CONFIRM_SUCCESS的直接链接")

- 提款资产成功。

### -4031 CAPITAL\_WITHDRAW\_CANCEL\_FAILURE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4031-capital_withdraw_cancel_failure "-4031 CAPITAL_WITHDRAW_CANCEL_FAILURE的直接链接")

- 取消提款失败。

### -4032 CAPITAL\_WITHDRAW\_CHECKSUM\_VERIFY\_FAILURE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4032-capital_withdraw_checksum_verify_failure "-4032 CAPITAL_WITHDRAW_CHECKSUM_VERIFY_FAILURE的直接链接")

- 验证提款失败。

### -4033 CAPITAL\_WITHDRAW\_ILLEGAL\_ADDRESS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4033-capital_withdraw_illegal_address "-4033 CAPITAL_WITHDRAW_ILLEGAL_ADDRESS的直接链接")

- 提款地址不合法。

### -4034 CAPITAL\_WITHDRAW\_ADDRESS\_CHEAT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4034-capital_withdraw_address_cheat "-4034 CAPITAL_WITHDRAW_ADDRESS_CHEAT的直接链接")

- 当前地址有异常。

### -4035 CAPITAL\_WITHDRAW\_NOT\_WHITE\_ADDRESS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4035-capital_withdraw_not_white_address "-4035 CAPITAL_WITHDRAW_NOT_WHITE_ADDRESS的直接链接")

- 此地址不在白名单上。请加入然后重试。

### -4036 CAPITAL\_WITHDRAW\_NEW\_ADDRESS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4036-capital_withdraw_new_address "-4036 CAPITAL_WITHDRAW_NEW_ADDRESS的直接链接")

- 新地址在{0}小时后才可以提款。

### -4037 CAPITAL\_WITHDRAW\_RESEND\_EMAIL\_FAIL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4037-capital_withdraw_resend_email_fail "-4037 CAPITAL_WITHDRAW_RESEND_EMAIL_FAIL的直接链接")

- 重新发送邮件失败。

### -4038 CAPITAL\_WITHDRAW\_RESEND\_EMAIL\_TIME\_OUT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4038-capital_withdraw_resend_email_time_out "-4038 CAPITAL_WITHDRAW_RESEND_EMAIL_TIME_OUT的直接链接")

- 请5分钟后重试。

### -4039 CAPITAL\_USER\_EMPTY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4039-capital_user_empty "-4039 CAPITAL_USER_EMPTY的直接链接")

- 用户不存在。

### -4041 CAPITAL\_MINUTE\_TOO\_SMALL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4041-capital_minute_too_small "-4041 CAPITAL_MINUTE_TOO_SMALL的直接链接")

- 请一分钟后重试。

### -4042 CAPITAL\_CHARGE\_NOT\_RESET[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4042-capital_charge_not_reset "-4042 CAPITAL_CHARGE_NOT_RESET的直接链接")

- 资产无法重新获取存款地址。

### -4043 CAPITAL\_ADDRESS\_TOO\_MUCH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4043-capital_address_too_much "-4043 CAPITAL_ADDRESS_TOO_MUCH的直接链接")

- 在24小时之内充值超过100多个地址。

### -4044 CAPITAL\_BLACKLIST\_COUNTRY\_GET\_ADDRESS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4044-capital_blacklist_country_get_address "-4044 CAPITAL_BLACKLIST_COUNTRY_GET_ADDRESS的直接链接")

- 此国家在黑名单上。

### -4045 CAPITAL\_GET\_ASSET\_ERROR[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4045-capital_get_asset_error "-4045 CAPITAL_GET_ASSET_ERROR的直接链接")

- 获得资产失败。

### -4046 CAPITAL\_AGREEMENT\_NOT\_CONFIRMED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4046-capital_agreement_not_confirmed "-4046 CAPITAL_AGREEMENT_NOT_CONFIRMED的直接链接")

- 协议未确认。

### -4047 CAPITAL\_DATE\_INTERVAL\_LIMIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4047-capital_date_interval_limit "-4047 CAPITAL_DATE_INTERVAL_LIMIT的直接链接")

- 时间间隔必须在0-90天之内

### -4060 CAPITAL\_WITHDRAW\_USER\_ASSET\_LOCK\_DEPOSIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-4060-capital_withdraw_user_asset_lock_deposit "-4060 CAPITAL_WITHDRAW_USER_ASSET_LOCK_DEPOSIT的直接链接")

- 体现仍在区块确认中，暂时锁定部分资产

### -5001 ASSET\_DRIBBLET\_CONVERT\_SWITCH\_OFF[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5001-asset_dribblet_convert_switch_off "-5001 ASSET_DRIBBLET_CONVERT_SWITCH_OFF的直接链接")

- 不允许转移到微型资产。

### -5002 ASSET\_ASSET\_NOT\_ENOUGH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5002-asset_asset_not_enough "-5002 ASSET_ASSET_NOT_ENOUGH的直接链接")

- 此余额不足。

### -5003 ASSET\_USER\_HAVE\_NO\_ASSET[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5003-asset_user_have_no_asset "-5003 ASSET_USER_HAVE_NO_ASSET的直接链接")

- 此资产不存在。

### -5004 USER\_OUT\_OF\_TRANSFER\_FLOAT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5004-user_out_of_transfer_float "-5004 USER_OUT_OF_TRANSFER_FLOAT的直接链接")

- 剩余余额已超过0.001BTC，请重新选择。
- ％s的剩余余额已超过0.001BTC，请重新选择。

### -5005 USER\_ASSET\_AMOUNT\_IS\_TOO\_LOW[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5005-user_asset_amount_is_too_low "-5005 USER_ASSET_AMOUNT_IS_TOO_LOW的直接链接")

- BTC的剩余余额太低，请重新选择。
- ％s的剩余余额太低，请重新选择。

### -5006 USER\_CAN\_NOT\_REQUEST\_IN\_24\_HOURS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5006-user_can_not_request_in_24_hours "-5006 USER_CAN_NOT_REQUEST_IN_24_HOURS的直接链接")

- 24小时内只能转账一次。

### -5007 AMOUNT\_OVER\_ZERO[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5007-amount_over_zero "-5007 AMOUNT_OVER_ZERO的直接链接")

- 数量必须大于零。

### -5008 ASSET\_WITHDRAW\_WITHDRAWING\_NOT\_ENOUGH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5008-asset_withdraw_withdrawing_not_enough "-5008 ASSET_WITHDRAW_WITHDRAWING_NOT_ENOUGH的直接链接")

- 可退回资产的金额不足。

### -5009 PRODUCT\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5009-product_not_exist "-5009 PRODUCT_NOT_EXIST的直接链接")

- 产品不存在。

### -5010 TRANSFER\_FAIL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5010-transfer_fail "-5010 TRANSFER_FAIL的直接链接")

- 资产转移失败。

### -5011 FUTURE\_ACCT\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5011-future_acct_not_exist "-5011 FUTURE_ACCT_NOT_EXIST的直接链接")

- 合约帐户不存在。

### -5012 TRANSFER\_PENDING[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5012-transfer_pending "-5012 TRANSFER_PENDING的直接链接")

- 资产转移正在进行中。

### -5021 PARENT\_SUB\_HAVE\_NO\_RELATION[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5021-parent_sub_have_no_relation "-5021 PARENT_SUB_HAVE_NO_RELATION的直接链接")

- 当前的子账户和母账户没有从属关系。

### -5012 FUTURE\_ACCT\_OR\_SUBRELATION\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-5012-future_acct_or_subrelation_not_exist "-5012 FUTURE_ACCT_OR_SUBRELATION_NOT_EXIST的直接链接")

- 合约帐户或子账户关系不存在。

## 6XXX - 币安宝相关[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#6xxx---%E5%B8%81%E5%AE%89%E5%AE%9D%E7%9B%B8%E5%85%B3 "6XXX - 币安宝相关的直接链接")

### -6001 DAILY\_PRODUCT\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6001-daily_product_not_exist "-6001 DAILY_PRODUCT_NOT_EXIST的直接链接")

- 理财产品不存在.

### -6003 DAILY\_PRODUCT\_NOT\_ACCESSIBLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6003-daily_product_not_accessible "-6003 DAILY_PRODUCT_NOT_ACCESSIBLE的直接链接")

- 产品不存在或者没有权限。

### -6004 DAILY\_PRODUCT\_NOT\_PURCHASABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6004-daily_product_not_purchasable "-6004 DAILY_PRODUCT_NOT_PURCHASABLE的直接链接")

- 产品无法购买。

### -6005 DAILY\_LOWER\_THAN\_MIN\_PURCHASE\_LIMIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6005-daily_lower_than_min_purchase_limit "-6005 DAILY_LOWER_THAN_MIN_PURCHASE_LIMIT的直接链接")

- 低于可以购买的最小限额。

### -6006 DAILY\_REDEEM\_AMOUNT\_ERROR[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6006-daily_redeem_amount_error "-6006 DAILY_REDEEM_AMOUNT_ERROR的直接链接")

- 赎回额度有误。

### -6007 DAILY\_REDEEM\_TIME\_ERROR[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6007-daily_redeem_time_error "-6007 DAILY_REDEEM_TIME_ERROR的直接链接")

- 不在赎回的时间内。

### -6008 DAILY\_PRODUCT\_NOT\_REDEEMABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6008-daily_product_not_redeemable "-6008 DAILY_PRODUCT_NOT_REDEEMABLE的直接链接")

- 产品暂时无法赎回。

### -6009 REQUEST\_FREQUENCY\_TOO\_HIGH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6009-request_frequency_too_high "-6009 REQUEST_FREQUENCY_TOO_HIGH的直接链接")

- 发送请求太频繁。

### -6011 EXCEEDED\_USER\_PURCHASE\_LIMIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6011-exceeded_user_purchase_limit "-6011 EXCEEDED_USER_PURCHASE_LIMIT的直接链接")

- 超购每个月用户可以申购的最大次数。

### -6012 BALANCE\_NOT\_ENOUGH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6012-balance_not_enough "-6012 BALANCE_NOT_ENOUGH的直接链接")

- 余额不足。

### -6013 PURCHASING\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6013-purchasing_failed "-6013 PURCHASING_FAILED的直接链接")

- 申购失败。

### -6014 UPDATE\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6014-update_failed "-6014 UPDATE_FAILED的直接链接")

- 超过可以申购的最大上限。

### -6015 EMPTY\_REQUEST\_BODY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6015-empty_request_body "-6015 EMPTY_REQUEST_BODY的直接链接")

- 请求的`body`为空。

### -6016 PARAMS\_ERR[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6016-params_err "-6016 PARAMS_ERR的直接链接")

- 请求的参数有误。

### -6017 NOT\_IN\_WHITELIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6017-not_in_whitelist "-6017 NOT_IN_WHITELIST的直接链接")

- 不在白名单里面。

### -6018 ASSET\_NOT\_ENOUGH[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6018-asset_not_enough "-6018 ASSET_NOT_ENOUGH的直接链接")

- 资产不足。

### -6019 PENDING[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6019-pending "-6019 PENDING的直接链接")

- 需要进一步确认。

### -6020 PROJECT\_NOT\_EXISTS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-6020-project_not_exists "-6020 PROJECT_NOT_EXISTS的直接链接")

- 此项目不存在。

## 70xx - 期货[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#70xx---%E6%9C%9F%E8%B4%A7 "70xx - 期货的直接链接")

### -7001 FUTURES\_BAD\_DATE\_RANGE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-7001-futures_bad_date_range "-7001 FUTURES_BAD_DATE_RANGE的直接链接")

- 此日期范围不支持。

### -7002 FUTURES\_BAD\_TYPE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-7002-futures_bad_type "-7002 FUTURES_BAD_TYPE的直接链接")

- 此数据请求类型不支持。

## 20xxx - 合约/现货策略交易[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#20xxx---%E5%90%88%E7%BA%A6%E7%8E%B0%E8%B4%A7%E7%AD%96%E7%95%A5%E4%BA%A4%E6%98%93 "20xxx - 合约/现货策略交易的直接链接")

### -20121 Invalid symbol[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20121-invalid-symbol "-20121 Invalid symbol的直接链接")

- 无效交易对。

### -20124 Invalid algo id or it has been completed[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20124-invalid-algo-id-or-it-has-been-completed "-20124 Invalid algo id or it has been completed的直接链接")

- 无效的策略订单ID或者它已经被执行。

### -20130 Invalid data sent for a parameter[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20130-invalid-data-sent-for-a-parameter "-20130 Invalid data sent for a parameter的直接链接")

- 无效数据。

### -20132 The client algo id is duplicated[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20132-the-client-algo-id-is-duplicated "-20132 The client algo id is duplicated的直接链接")

- 用户自定义策略订单ID重复。

### -20194 Duration is too short to execute all required quantity[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20194-duration-is-too-short-to-execute-all-required-quantity "-20194 Duration is too short to execute all required quantity的直接链接")

- Duration 时间太短不足以执行用户选择的订单数量。

### -20195 The total size is too small[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20195-the-total-size-is-too-small "-20195 The total size is too small的直接链接")

- 下单数量太小。

### -20196 The total size is too large[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20196-the-total-size-is-too-large "-20196 The total size is too large的直接链接")

- 下单数量太大。

### -20198 Reach the max open orders allowed[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20198-reach-the-max-open-orders-allowed "-20198 Reach the max open orders allowed的直接链接")

- 达到了最大挂单上限。

### -20204 The notional of USD is less or more than the limit[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-20204-the-notional-of-usd-is-less-or-more-than-the-limit "-20204 The notional of USD is less or more than the limit的直接链接")

- 订单小于最小USD名义价值

## 过滤器故障[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#%E8%BF%87%00%E6%BB%A4%E5%99%A8%E6%95%85%E9%9A%9C "过滤器故障的直接链接")

| 报错信息                                          | 描述                                                     |
|-----------------------------------------------|--------------------------------------------------------|
| "Filter failure: PRICE\_FILTER"               | "价格"过高，过低和/或不遵循交易对的最小价格规则。                             |
| "Filter failure: PERCENT\_PRICE"              | "价格"比最近Y分钟的平均加权价格高X％或X％太低。                             |
| "Filter failure: PERCENT\_PRICE\_BY\_SIDE"    | `price` 在当前方向上(`BUY`或者`SELL`)比`lastPrice`价格超过X%或者低于Y%。 |
| "Filter failure: LOT\_SIZE"                   | "数量"太高，太低和/或不遵循该交易对的步长规则。                              |
| "Filter failure: MIN\_NOTIONAL"               | 价格\*数量太低，无法成为该交易对的有效订单。                                |
| "Filter failure: ICEBERG\_PARTS"              | `ICEBERG` 订单会分成太多部分； icebergQty太小。                     |
| "Filter failure: MARKET\_LOT\_SIZE"           | "MARKET"订单的"数量"过高，过低和/或未遵循交易对的步长规则。                    |
| "Filter failure: MAX\_POSITION"               | 达到账户的最大仓位限制。这包括了账户的余额总额，以及所有处于open的买单的数量总和。            |
| "Filter failure: MAX\_NUM\_ORDERS"            | 客户在交易对上有太多挂单。                                          |
| "Filter failure: MAX\_ALGO\_ORDERS"           | 账户有太多未平仓止损和/或在交易对上执行获利指令。                              |
| "Filter failure: MAX\_NUM\_ICEBERG\_ORDERS"   | 客户在交易对上有太多 iceberg 挂单。                                 |
| "Filter failure: TRAILING\_DELTA"             | `trailingDelta` 值不在限定的范围内.                             |
| "Filter failure: EXCHANGE\_MAX\_NUM\_ORDERS"  | 帐户上的交易所有太多挂单。                                          |
| "Filter failure: EXCHANGE\_MAX\_ALGO\_ORDERS" | 帐户有太多止损挂单和/或在交易所收取获利指令。                                |

## 10xxx - 质押借币[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#10xxx---%E8%B4%A8%E6%8A%BC%E5%80%9F%E5%B8%81 "10xxx - 质押借币的直接链接")

### -10001 SYSTEM\_MAINTENANCE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10001-system_maintenance "-10001 SYSTEM_MAINTENANCE的直接链接")

- 系统维护中，请稍后再试

### -10002 INVALID\_INPUT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10002-invalid_input "-10002 INVALID_INPUT的直接链接")

- 无效的输入参数

### -10005 NO\_RECORDS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10005-no_records "-10005 NO_RECORDS的直接链接")

- 暂无记录

### -10007 COIN\_NOT\_LOANABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10007-coin_not_loanable "-10007 COIN_NOT_LOANABLE的直接链接")

- 该币种暂不支持借贷

### -10008 COIN\_NOT\_LOANABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10008-coin_not_loanable "-10008 COIN_NOT_LOANABLE的直接链接")

- 该币种暂不支持借贷

### -10009 COIN\_NOT\_COLLATERAL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10009-coin_not_collateral "-10009 COIN_NOT_COLLATERAL的直接链接")

- 该币种暂不支持抵押

### -10010 COIN\_NOT\_COLLATERAL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10010-coin_not_collateral "-10010 COIN_NOT_COLLATERAL的直接链接")

- 该币种暂不支持抵押

### -10011 INSUFFICIENT\_ASSET[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10011-insufficient_asset "-10011 INSUFFICIENT_ASSET的直接链接")

- 现货资产不足

### -10012 INVALID\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10012-invalid_amount "-10012 INVALID_AMOUNT的直接链接")

- 无效的还款金额

### -10013 INSUFFICIENT\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10013-insufficient_amount "-10013 INSUFFICIENT_AMOUNT的直接链接")

- 抵押资产不足

### -10015 DEDUCTION\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10015-deduction_failed "-10015 DEDUCTION_FAILED的直接链接")

- 抵押资产扣款失败

### -10016 LOAN\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10016-loan_failed "-10016 LOAN_FAILED的直接链接")

- 放贷失败

### -10017 REPAY\_EXCEED\_DEBT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10017-repay_exceed_debt "-10017 REPAY_EXCEED_DEBT的直接链接")

- 还款金额超过负债金额

### -10018 INVALID\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10018-invalid_amount "-10018 INVALID_AMOUNT的直接链接")

- 无效的还款金额

### -10019 CONFIG\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10019-config_not_exist "-10019 CONFIG_NOT_EXIST的直接链接")

- 配置不存在

### -10020 UID\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10020-uid_not_exist "-10020 UID_NOT_EXIST的直接链接")

- 用户ID不存在

### -10021 ORDER\_NOT\_EXIST[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10021-order_not_exist "-10021 ORDER_NOT_EXIST的直接链接")

- 订单不存在

### -10022 INVALID\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10022-invalid_amount "-10022 INVALID_AMOUNT的直接链接")

- 无效的调整金额

### -10023 ADJUST\_LTV\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10023-adjust_ltv_failed "-10023 ADJUST_LTV_FAILED的直接链接")

- 调整质押率失败

### -10024 ADJUST\_LTV\_NOT\_SUPPORTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10024-adjust_ltv_not_supported "-10024 ADJUST_LTV_NOT_SUPPORTED的直接链接")

- 暂不支持调整质押率

### -10025 REPAY\_FAILED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10025-repay_failed "-10025 REPAY_FAILED的直接链接")

- 还款失败

### -10026 INVALID\_PARAMETER[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10026-invalid_parameter "-10026 INVALID_PARAMETER的直接链接")

- 无效的参数

### -10028 INVALID\_PARAMETER[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10028-invalid_parameter "-10028 INVALID_PARAMETER的直接链接")

- 无效的参数

### -10029 AMOUNT\_TOO\_SMALL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10029-amount_too_small "-10029 AMOUNT_TOO_SMALL的直接链接")

- 借贷金额过小

### -10030 AMOUNT\_TOO\_LARGE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10030-amount_too_large "-10030 AMOUNT_TOO_LARGE的直接链接")

- 借贷金额过大

### -10031 QUOTA\_REACHED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10031-quota_reached "-10031 QUOTA_REACHED的直接链接")

- 已达到个人借贷限额

### -10032 REPAY\_NOT\_AVAILABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10032-repay_not_available "-10032 REPAY_NOT_AVAILABLE的直接链接")

- 暂不支持换款

### -10034 REPAY\_NOT\_AVAILABLE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10034-repay_not_available "-10034 REPAY_NOT_AVAILABLE的直接链接")

- 抵押物还款暂时不支持，请尝试用借贷币还款。

### -10039 AMOUNT\_TOO\_SMALL[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10039-amount_too_small "-10039 AMOUNT_TOO_SMALL的直接链接")

- 还款金额过小

### -10040 AMOUNT\_TOO\_LARGE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10040-amount_too_large "-10040 AMOUNT_TOO_LARGE的直接链接")

- 还款金额过大

### -10041 INSUFFICIENT\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10041-insufficient_amount "-10041 INSUFFICIENT_AMOUNT的直接链接")

- 由于借贷需求过多，系统剩余可借{0}额度不足。请调整借贷金额或明天再试。

### -10042 ASSET\_NOT\_SUPPORTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10042-asset_not_supported "-10042 ASSET_NOT_SUPPORTED的直接链接")

- 暂不支持%s币种

### -10043 ASSET\_NOT\_SUPPORTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10043-asset_not_supported "-10043 ASSET_NOT_SUPPORTED的直接链接")

- 暂不支持{0} 借贷

### -10044 QUOTA\_REACHED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10044-quota_reached "-10044 QUOTA_REACHED的直接链接")

- 抵押物数量已达到限额，请调整抵押金额或使用其他抵押资产。

### -10045 COLLTERAL\_REPAY\_NOT\_SUPPORTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10045-collteral_repay_not_supported "-10045 COLLTERAL_REPAY_NOT_SUPPORTED的直接链接")

- 该借贷币种暂不支持抵押物还款，请稍后再试。

### -10046 EXCEED\_MAX\_ADJUSTMENT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10046-exceed_max_adjustment "-10046 EXCEED_MAX_ADJUSTMENT的直接链接")

- 调整抵押物超过最大限额，请重试。

### -10047 REGION\_NOT\_SUPPORTED[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-10047-region_not_supported "-10047 REGION_NOT_SUPPORTED的直接链接")

- 受当地法规管制，您所在地区暂不支持该币种。

## 13xxx - 杠杆代币[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#13xxx---%E6%9D%A0%E6%9D%86%E4%BB%A3%E5%B8%81 "13xxx - 杠杆代币的直接链接")

### -13000 BLVT\_FORBID\_REDEEM[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13000-blvt_forbid_redeem "-13000 BLVT_FORBID_REDEEM的直接链接")

- 当前该杠杆代币关闭赎回

### -13001 BLVT\_EXCEED\_DAILY\_LIMIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13001-blvt_exceed_daily_limit "-13001 BLVT_EXCEED_DAILY_LIMIT的直接链接")

- 超过该代币个人24小时赎回金额上限

### -13002 BLVT\_EXCEED\_TOKEN\_DAILY\_LIMIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13002-blvt_exceed_token_daily_limit "-13002 BLVT_EXCEED_TOKEN_DAILY_LIMIT的直接链接")

- 超过该代币全局24小时赎回金额上限

### -13003 BLVT\_FORBID\_PURCHASE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13003-blvt_forbid_purchase "-13003 BLVT_FORBID_PURCHASE的直接链接")

- 当前该杠杆代币关闭申购

### -13004 BLVT\_EXCEED\_DAILY\_PURCHASE\_LIMIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13004-blvt_exceed_daily_purchase_limit "-13004 BLVT_EXCEED_DAILY_PURCHASE_LIMIT的直接链接")

- 超过该代币个人24小时申购金额上限

### -13005 BLVT\_EXCEED\_TOKEN\_DAILY\_PURCHASE\_LIMIT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13005-blvt_exceed_token_daily_purchase_limit "-13005 BLVT_EXCEED_TOKEN_DAILY_PURCHASE_LIMIT的直接链接")

- 超过该代币全局24小时申购金额上限

### -13006 BLVT\_PURCHASE\_LESS\_MIN\_AMOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13006-blvt_purchase_less_min_amount "-13006 BLVT_PURCHASE_LESS_MIN_AMOUNT的直接链接")

- 申购金额低于规定下限

### -13007 BLVT\_PURCHASE\_AGREEMENT\_NOT\_SIGN[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-13007-blvt_purchase_agreement_not_sign "-13007 BLVT_PURCHASE_AGREEMENT_NOT_SIGN的直接链接")

- 没有签署开通交易协议

## 12xxx - 流动性挖矿[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#12xxx---%E6%B5%81%E5%8A%A8%E6%80%A7%E6%8C%96%E7%9F%BF "12xxx - 流动性挖矿的直接链接")

### -12014 TOO MANY REQUESTS[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-12014-too-many-requests "-12014 TOO MANY REQUESTS的直接链接")

- 2秒内接收的请求数量多于1条

## 18xxx - 币安码[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#18xxx---%E5%B8%81%E5%AE%89%E7%A0%81 "18xxx - 币安码的直接链接")

### -18002[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-18002 "-18002的直接链接")

- The total amount of codes you created has exceeded the 24-hour limit, please try again after UTC 0
- 24小时内制码总金额已超过限额，请UTC0点后再尝试

### -18003[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-18003 "-18003的直接链接")

- Too many codes created in 24 hours, please try again after UTC 0
- 24小时内制码总次数已超过限额，请UTC0点后再尝试

### -18004[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-18004 "-18004的直接链接")

- Too many invalid redeem attempts in 24 hours, please try again after UTC 0
- 24小时内兑现币安码输错次数已超过限额，请UTC0点后再尝试

### -18005[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-18005 "-18005的直接链接")

- Too many invalid verify attempts, please try later
- 参考号输错次数过多，请稍后再试

### -18006[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-18006 "-18006的直接链接")

- The amount is too small, please re-enter
- 金额过小，请重新输入

### -18007[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-18007 "-18007的直接链接")

- This token is not currently supported, please re-enter
- 尚未支持该币种，请重新输入

## 21xxx - 統一帳戶[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#21xxx---%E7%B5%B1%E4%B8%80%E5%B8%B3%E6%88%B6 "21xxx - 統一帳戶的直接链接")

### -21001 USER\_IS\_NOT\_UNIACCOUNT[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-21001-user_is_not_uniaccount "-21001 USER_IS_NOT_UNIACCOUNT的直接链接")

- 尚未开通统一账户。

### -21002 UNI\_ACCOUNT\_CANT\_TRANSFER\_FUTURE[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-21002-uni_account_cant_transfer_future "-21002 UNI_ACCOUNT_CANT_TRANSFER_FUTURE的直接链接")

- 统一账户禁用margin向futures转账。

### -21003 NET\_ASSET\_MUST\_LTE\_RATIO[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-21003-net_asset_must_lte_ratio "-21003 NET_ASSET_MUST_LTE_RATIO的直接链接")

- margin资产更新失败。

### -21004 USER\_NO\_LIABILITY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-21004-user_no_liability "-21004 USER_NO_LIABILITY的直接链接")

- 用户不存在统一账户穿仓负债

### -21005 NO\_ENOUGH\_ASSET[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-21005-no_enough_asset "-21005 NO_ENOUGH_ASSET的直接链接")

- 用户现货钱包BUSD资产不足以偿还统一账户穿仓负债

### -21006 HAD\_IN\_PROCESS\_REPAY[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-21006-had_in_process_repay "-21006 HAD_IN_PROCESS_REPAY的直接链接")

- 用户存在正在偿还的统一账户穿仓负债

### -21007 IN\_FORCE\_LIQUIDATION[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-21007-in_force_liquidation "-21007 IN_FORCE_LIQUIDATION的直接链接")

- 强平进行中，用户偿还统一账户穿仓负债失败

## 订单拒绝错误[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#%E8%AE%A2%E5%8D%95%E6%8B%92%E7%BB%9D%E9%94%99%E8%AF%AF "订单拒绝错误的直接链接")

以下错误代码表示撮合引擎返回的订单相关错误:

- `-1010 ERROR_MSG_RECEIVED`
- `-2010 NEW_ORDER_REJECTED`
- `-2011 CANCEL_REJECTED`

结合以下消息将指示特定的错误：

错误信息描述

"Unknown order sent."找不到订单(通过"orderId"，"clientOrderId"，"origClientOrderId")

"Duplicate order sent."`clientOrderId`已经被使用

"Market is closed."该交易对不在交易范围

"Account has insufficient balance for requested action."没有足够的资金来完成行动

"Market orders are not supported for this symbol."交易对上未启用"MARKET"

"Iceberg orders are not supported for this symbol."交易对上未启用`icebergQty`

"Stop loss orders are not supported for this symbol."交易对上未启用 `STOP_LOSS`

"Stop loss limit orders are not supported for this symbol."交易对上未启`STOP_LOSS_LIMIT`

"Take profit orders are not supported for this symbol."交易对上未启用`TAKE_PROFIT`

"Take profit limit orders are not supported for this symbol."交易对上未启用`TAKE_PROFIT_LIMIT`

"Price * QTY is zero or less."`price` * `quantity`太小

"IcebergQty exceeds QTY."`icebergQty` 必须少于订单数量

"This action is disabled on this account."联系客户支持； 该账户已禁用了某些操作。

"This account may not place or cancel orders."联系客户支持： 该账户已被禁用了交易操作。

"Unsupported order combination"不允许组合`orderType`, `timeInForce`, `stopPrice`, 和/或 `icebergQty` 。

"Order would trigger immediately."与最后交易价格相比，订单的止损价无效。

"Cancel order is invalid. Check origClientOrderId and orderId."未发送`origClientOrderId` 或`orderId` 。

"Order would immediately match and take."`LIMIT_MAKER` 订单类型将立即匹配并进行交易，而不是纯粹的生成订单。

"The relationship of the prices for the orders is not correct."`OCO`订单中设置的价格不符合报价规则：

The rules are:

`SELL Orders`: Limit Price &gt; Last Price &gt; Stop Price

`BUY Orders`: Limit Price &lt; Last Price &lt; Stop Price

"OCO orders are not supported for this symbol"`OCO`订单不支持该交易对

"Quote order qty market orders are not support for this symbol."这个交易对，市价单不支持参数`quoteOrderQty`

"Trailing stop orders are not supported for this symbol."此symbol不支持 `trailingDelta` ｜

"Order cancel-replace is not supported for this symbol."此symbol不支持 `POST /api/v3/order/cancelReplace` 或者 `order.cancelReplace` (WebSocket API) ｜

"This symbol is not permitted for this account."账户和交易对的权限不一致 (比如 `SPOT`, `MARGIN` 等)。｜

"This symbol is restricted for this account."账户没有权限在此交易对交易 (比如账户只拥有 `ISOLATED_MARGIN`权限，则无法下`SPOT` 订单)。 ｜

"Order was not canceled due to cancel restrictions."`cancelRestrictions` 设置为 `ONLY_NEW` 但订单状态不是 `NEW`  
或  
`cancelRestrictions` 设置为 `ONLY_PARTIALLY_FILLED` 但订单状态不是 `PARTIALLY_FILLED`。 ｜

## 关于 POST /api/v3/order/cancelReplace 的错误[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#%E5%85%B3%E4%BA%8E-post-apiv3ordercancelreplace-%E7%9A%84%E9%94%99%E8%AF%AF "关于 POST /api/v3/order/cancelReplace 的错误的直接链接")

### -2021 Order cancel-replace partially failed[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2021-order-cancel-replace-partially-failed "-2021 Order cancel-replace partially failed的直接链接")

收到该错误码代表撤单**或者**下单失败。

### -2022 Order cancel-replace failed.[​](https://developers.binance.com/docs/zh-CN/wallet/error-code#-2022-order-cancel-replace-failed "-2022 Order cancel-replace failed.的直接链接")

收到该错误码代表撤单**和**下单都失败。