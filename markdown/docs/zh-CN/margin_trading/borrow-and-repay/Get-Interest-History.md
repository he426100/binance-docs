# 获取利息历史 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-Interest-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取利息历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-Interest-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/interestHistory`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-Interest-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-Interest-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称             | 类型     | 是否必需 | 描述                 |
|----------------|--------|------|--------------------|
| asset          | STRING | NO   |                    |
| isolatedSymbol | STRING | NO   | 逐仓symbol           |
| startTime      | LONG   | NO   |                    |
| endTime        | LONG   | NO   |                    |
| current        | LONG   | NO   | 当前查询页。 开始值 1. 默认:1 |
| size           | LONG   | NO   | 默认:10 最大:100       |
| recvWindow     | LONG   | NO   | 赋值不能大于 `60000`     |
| timestamp      | LONG   | YES  |                    |

- 响应返回为降序排列。
- 如果发送isolatedSymbol，返回指定逐仓symbol的记录。
- 查询时间范围最大不得超过30天。这是确保数据正确性必须的。
- 若`startTime`和`endTime`没传，则默认返回最近7天数据
- 如果`startTime`传递了而`endTime`没传，则返回 `startTime`到现在的利息历史记录；若`startTime`至今超过30天，则返回过去30天的利息历史记录。
- 如果`startTime`没传而`endTime`传递了，则返回 `endTime`之前7天的利息历史记录
- 返回的`type`数据有4种类型:
  
  - `PERIODIC` 每小时收的利息
  - `ON_BORROW` 借款的时候第一次收的利息
  - `PERIODIC_CONVERTED` 每小时收的利息，用BNB抵扣
  - `ON_BORROW_CONVERTED` 借款的时候第一次收的利息，用BNB抵扣
  - `PORTFOLIO` 统一账户负余额每日利息

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Get-Interest-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "rows": [
    {            
      "txId": 1352286576452864727,           
      "interestAccuredTime": 1672160400000,            
      "asset": "USDT", 
      "rawAsset": “USDT”,  // 逐仓不会返回此字段          
      "principal": "45.3313",            
      "interest": "0.00024995",            
      "interestRate": "0.00013233",            
      "type": "ON_BORROW",           
      "isolatedSymbol": "BNBUSDT"  // 返回逐仓symbol; 若是全仓不会返回此字段    
    }
  ],
  "total": 1
}
```