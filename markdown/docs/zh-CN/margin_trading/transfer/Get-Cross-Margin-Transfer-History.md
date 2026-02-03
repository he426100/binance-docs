# 获取全仓杠杆划转历史 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/transfer/Get-Cross-Margin-Transfer-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取全仓杠杆划转历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/transfer/Get-Cross-Margin-Transfer-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/transfer`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/transfer/Get-Cross-Margin-Transfer-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/transfer/Get-Cross-Margin-Transfer-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称             | 类型     | 是否必需 | 描述                        |
|----------------|--------|------|---------------------------|
| asset          | STRING | NO   |                           |
| type           | STRING | NO   | 划转类型: ROLL\_IN, ROLL\_OUT |
| startTime      | LONG   | NO   |                           |
| endTime        | LONG   | NO   |                           |
| current        | LONG   | NO   | 当前查询页。 从 1开始。 默认:1        |
| size           | LONG   | NO   | 默认:10 最大:100              |
| isolatedSymbol | STRING | NO   | 逐仓交易对，适用于逐仓查询             |
| recvWindow     | LONG   | NO   | 赋值不能大于 `60000`            |
| timestamp      | LONG   | YES  |                           |

- 响应返回为降序排列。
- 查询时间范围最大不得超过30天。
- 若`startTime`和`endTime`没传，则默认返回最近7天数据

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/transfer/Get-Cross-Margin-Transfer-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "rows": [
    {
      "amount": "0.10000000",
      "asset": "BNB",
      "status": "CONFIRMED",
      "timestamp": 1566898617,
      "txId": 5240372201,
      "type": "ROLL_IN",
      "transFrom": "SPOT",//SPOT,FUTURES,FIAT,DELIVERY,MINING,ISOLATED_MARGIN,FUNDING,MOTHER_SPOT,OPTION,SUB_SPOT,SUB_MARGIN,CROSS_MARGIN
      "transTo": "ISOLATED_MARGIN",//SPOT,FUTURES,FIAT,DELIVERY,MINING,ISOLATED_MARGIN,FUNDING,MOTHER_SPOT,OPTION,SUB_SPOT,SUB_MARGIN,CROSS_MARGIN
    },
    {
      "amount": "5.00000000",
      "asset": "USDT",
      "status": "CONFIRMED",
      "timestamp": 1566888436,
      "txId": 5239810406,
      "type": "ROLL_OUT",
      "transFrom": "ISOLATED_MARGIN",//SPOT,FUTURES,FIAT,DELIVERY,MINING,ISOLATED_MARGIN,FUNDING,MOTHER_SPOT,OPTION,SUB_SPOT,SUB_MARGIN,CROSS_MARGIN
      "transTo": "ISOLATED_MARGIN",//SPOT,FUTURES,FIAT,DELIVERY,MINING,ISOLATED_MARGIN,FUNDING,MOTHER_SPOT,OPTION,SUB_SPOT,SUB_MARGIN,CROSS_MARGIN
      "fromSymbol": "BNBUSDT",
      "toSymbol": "BTCUSDT"
    },
    {
      "amount": "1.00000000",
      "asset": "EOS",
      "status": "CONFIRMED",
      "timestamp": 1566888403,
      "txId": 5239808703,
      "type": "ROLL_IN"
    }
  ],
  "total": 3
}
```

\*\*常见错误代码： \**

- **EXCEED\_MAX\_ROLLOUT** 由于您的质押风险率过低，系统会拒绝您从账户转出资金，并返回错误提示 {"code":-3020,"msg":"Transfer out amount exceeds max amount."}。此时，您可以通过降低未偿还的借款额度或增加更多资产来提升质押风险率，从而满足转账要求。
- **PREPAREDELIST\_CANT\_TRANSFER\_IN** 错误提示 {“code”: -3065, “msg”: “%s has been scheduled for delisting. You may only transfer up to %s %s, which is the amount of liabilities less any collateral already available.”} 出现在某个资产即将被下架，因此对该资产的转出额度有限制。您在将该资产从币安转出时，不能超过平台规定的最大转出数量。
- **NET\_ASSET\_MUST\_LTE\_RATIO** 错误提示 {“code”:-21003, “msg”: ”Fail to retrieve margin assets.”} 通常出现在用户请求频率过快的情况。因为资产信息的更新需要一定时间，频繁发起请求可能会导致请求失败或响应延迟。 建议用户在每次请求之间保持至少 500 毫秒（0.5秒）的间隔，这样系统才能有充足时间处理和更新资产数据，降低因高频请求导致的错误和延迟。