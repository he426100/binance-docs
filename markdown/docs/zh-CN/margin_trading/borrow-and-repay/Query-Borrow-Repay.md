# 查询借贷/还款记录(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Borrow-Repay#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询借贷/还款记录

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Borrow-Repay#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/borrow-repay`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Borrow-Repay#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Borrow-Repay#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称             | 类型     | 是否必需 | 描述                                     |
|----------------|--------|------|----------------------------------------|
| asset          | STRING | NO   |                                        |
| isolatedSymbol | STRING | NO   | 逐仓symbol                               |
| txId           | LONG   | NO   | `POST /sapi/v1/margin/loan`中的`tranId`  |
| startTime      | LONG   | NO   |                                        |
| endTime        | LONG   | NO   |                                        |
| current        | LONG   | NO   | 当前查询页。 开始值 1。 默认:1                     |
| size           | LONG   | NO   | 默认:10 最大:100                           |
| type           | STRING | YES  | 操作类型：BORROW、REPAY                      |
| recvWindow     | LONG   | NO   | The value cannot be greater than 60000 |
| timestamp      | LONG   | YES  |                                        |

> - 必须发送`txId`或`startTime`，`txId`优先
> - 响应返回为降序排列。
> - 传了`asset`参数，最大查询时间范围为`endTime`往前30天；不传`asset`参数，最大查询时间范围为`endTime`往前7天。
> - 若`startTime`和`endTime`没传，则默认返回最近7天数据
> - `startTime`不传，默认`endTime`-7天；结束时间不传，默认当前时间

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Borrow-Repay#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "rows": [
      {
        "type": "AUTO", // 全仓借贷可返回：AUTO,MANUAL ; 全仓还款可返回：MANUAL，AUTO，BNB_AUTO_REPAY，POINT_AUTO_REPAY; 逐仓借贷或还款可返回：AUTO，MANUAL
        "isolatedSymbol": "BNBUSDT",     // 逐仓还款 返回逐仓symbol; 若是全仓不会返回此字段
        "amount": "14.00000000",   // 还款总额
        "asset": "BNB",   
        "interest": "0.01866667",    // 支付的利息
        "principal": "13.98133333",   // 支付的本金
        "status": "CONFIRMED",   //状态: PENDING (等待执行), CONFIRMED (成功还款), FAILED (执行失败);
        "timestamp": 1563438204000,
        "txId": 2970933056
      }
  ],
  "total": 1
}
```