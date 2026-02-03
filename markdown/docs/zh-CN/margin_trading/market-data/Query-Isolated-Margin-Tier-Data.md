# 获取逐仓档位信息 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Isolated-Margin-Tier-Data#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

通过档位获取逐仓杠杆档位数据， 如： [https://www.binance.com/en/margin-data](https://www.binance.com/en/margin-data)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Isolated-Margin-Tier-Data#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/isolatedMarginTier`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Isolated-Margin-Tier-Data#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Isolated-Margin-Tier-Data#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型      | 是否必须 | 描述             |
|------------|---------|------|----------------|
| symbol     | STRING  | YES  |                |
| tier       | INTEGER | NO   | 不传则返回所有逐仓杠杆档位  |
| recvWindow | LONG    | NO   | 赋值不能大于 `60000` |
| timestamp  | LONG    | YES  |                |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Isolated-Margin-Tier-Data#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "symbol": "BTCUSDT",
        "tier": 1,
        "effectiveMultiple": "10",
        "initialRiskRatio": "1.111",
        "liquidationRiskRatio": "1.05",
        "baseAssetMaxBorrowable": "9",
        "quoteAssetMaxBorrowable": "70000"
    }
]
```