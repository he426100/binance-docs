# 获取逐仓杠杆利率及限额 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Isolated-Margin-Fee-Data#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

通过VIP等级或用户当前VIP等级获取逐仓杠杆利率及限额， 如： [https://www.binance.com/en/margin-fee](https://www.binance.com/en/margin-fee)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Isolated-Margin-Fee-Data#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/isolatedMarginData`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Isolated-Margin-Fee-Data#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1 指定交易对;(IP)** **10 交易对参数缺失(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Isolated-Margin-Fee-Data#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必须 | 描述             |
|------------|--------|------|----------------|
| vipLevel   | INT    | NO   | 默认为用户当前VIP等级   |
| symbol     | STRING | NO   |                |
| recvWindow | LONG   | NO   | 赋值不能大于 `60000` |
| timestamp  | LONG   | YES  |                |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Isolated-Margin-Fee-Data#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "vipLevel": 0,
        "symbol": "BTCUSDT",
        "leverage": "10",
        "data": [
            {
                "coin": "BTC",
                "dailyInterest": "0.00026125",
                "borrowLimit": "270"
            },
            {
                "coin": "USDT",
                "dailyInterest": "0.000475",
                "borrowLimit": "2100000"
            }
        ]
    }
]
```