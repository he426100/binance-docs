# 杠杆账户借贷/还款

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Margin-Account-Borrow-Repay#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

杠杆账户借贷/还款

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Margin-Account-Borrow-Repay#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/borrow-repay`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Margin-Account-Borrow-Repay#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

1500

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Margin-Account-Borrow-Repay#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                                     |
|------------|--------|------|----------------------------------------|
| asset      | STRING | YES  |                                        |
| isIsolated | STRING | YES  | 是否逐仓杠杆，`TRUE`, `FALSE`, 默认 `FALSE`     |
| symbol     | STRING | YES  | 逐仓交易对，配合逐仓使用                           |
| amount     | STRING | YES  |                                        |
| type       | STRING | YES  | 操作类型：BORROW、REPAY                      |
| recvWindow | LONG   | NO   | The value cannot be greater than 60000 |
| timestamp  | LONG   | YES  |                                        |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Margin-Account-Borrow-Repay#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  //transaction id
  "tranId": 100000001
}
```

**常见错误代码：**

- **INSUFFICIENT\_INVENTORY**
  
  错误提示 {"code": -3045, "msg": "The system does not have enough asset now."} 可能会出现在手动借款或需要实际借款的自动借款订单中。此错误产生的原因可能包括：
  
  - 系统库存资产数量低于您申请借贷的金额。
  - 系统库存资产严重不足，无论借贷金额大小，所有借贷请求均被拒绝
  
  建议您密切关注系统资产状况，并根据实际情况调整借贷策略，以避免此类错误发生。
- **EXCEED\_MAX\_BORROWABLE**
  
  当您的借款请求超过最大可借金额时，会出现错误提示 {"code": -3006, "msg": "Your borrow amount has exceed maximum borrow amount."}。您可以通过接口 [GET /sapi/v1/margin/maxBorrowable](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Max-Borrow) 查询当前最大可借金额，然后根据查询结果调整借款请求。
- **REPAY\_EXCEED\_LIABILITY**
  
  偿还借款时，请务必确认还款金额小于当前未还借款金额，否则会触发错误提示 {“code”: -3015, “msg”: “Repay amount exceeds borrow amount.”}。
- **ASSET\_ADMIN\_BAN\_BORROW**
  
  错误提示 {“code”: -3012, “msg”: “Borrow is banned for this asset.”} 表示该资产当前不支持借贷。您可以调用接口 [GET /sapi/v1/margin/allAssets](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-All-Margin-Assets) 查询资产的借贷可用情况，或通过币安官方渠道了解该资产借贷状态的最新公告和更新。
- **REPAY\_EXCEED\_LIABILITY**
  
  当出现错误提示 {"code": -3015, "msg": "The unpaid debt is too small after this repayment."} 时，说明您还款后，剩余的未还债务低于币安规定的最低限额。您可以通过调整还款金额，使剩余债务达到最低要求，从而解决该问题。
- **HAS\_PENDING\_TRANSACTION**
  
  错误提示 {“code”: -3007, “msg”: “You have pending transaction, please try again later.”} 表明您的账户当前有借款或还款交易正在处理中，因此暂时无法提交新的借贷或还款请求。此问题可能发生于手动操作和自动借款订单，需注意以下几点：
  
  - 并发交易限制：系统会按照提交顺序处理所有借款和还款请求，即使不同资产的请求也不例外。正在进行的借款和还款请求会短暂限制后续请求。
  - 处理速度：一般借款或还款操作能在约 100 毫秒内完成。为降低遇到该错误的可能性，建议您在发起请求时，间隔至少 100 毫秒。
  - 自动还款注意事项：自动还款订单可能因相同原因失败，而不返回错误提示。我们建议您在自动还款执行后，及时核查您的未还贷款余额。