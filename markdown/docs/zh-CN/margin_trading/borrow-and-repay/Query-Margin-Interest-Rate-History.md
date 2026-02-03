# 获取杠杆利率历史 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Margin-Interest-Rate-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取杠杆利率历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Margin-Interest-Rate-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/interestRateHistory`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Margin-Interest-Rate-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Margin-Interest-Rate-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述              |
|------------|--------|------|-----------------|
| asset      | STRING | YES  |                 |
| vipLevel   | INT    | NO   | 默认用户当前等级        |
| startTime  | LONG   | NO   | 默认7天前           |
| endTime    | LONG   | NO   | 默认当天，时间间隔最大为1个月 |
| recvWindow | LONG   | NO   | 赋值不能大于 60000    |
| timestamp  | LONG   | YES  |                 |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Margin-Interest-Rate-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "asset": "BTC",
        "dailyInterestRate": "0.00025000",
        "timestamp": 1611544731000,
        "vipLevel": 1    
    },
    {
        "asset": "BTC",
        "dailyInterestRate": "0.00035000",
        "timestamp": 1610248118000,
        "vipLevel": 1    
    }
]
```