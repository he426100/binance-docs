# 杠杆分层标准 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Notional-and-Leverage-Brackets#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询账户特定交易对的杠杆分层标准

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Notional-and-Leverage-Brackets#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/leverageBracket`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Notional-and-Leverage-Brackets#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Notional-and-Leverage-Brackets#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述 |
|------------|--------|------|----|
| symbol     | STRING | NO   |    |
| recvWindow | LONG   | NO   |    |
| timestamp  | LONG   | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Notional-and-Leverage-Brackets#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **响应:**

```javascript
[
    {
        "symbol": "ETHUSDT",
	    "notionalCoef": 1.50,   //用户bracket相对默认bracket的倍数，仅在和交易对默认不一样时显示
        "brackets": [
            {
                "bracket": 1,   // 层级
                "initialLeverage": 75,  // 该层允许的最高初始杠杆倍数
                "notionalCap": 10000,  // 该层对应的名义价值上限
                "notionalFloor": 0,  // 该层对应的名义价值下限 
                "maintMarginRatio": 0.0065, // 该层对应的维持保证金率
                "cum": 0.0 // 速算数
            },
        ]
    }
]
```

> **或** (若发送symbol)

```javascript

{
    "symbol": "ETHUSDT",
    "notionalCoef": 1.50,
    "brackets": [
        {
            "bracket": 1,
            "initialLeverage": 75,
            "notionalCap": 10000,
            "notionalFloor": 0,
            "maintMarginRatio": 0.0065,
            "cum":0
        },
    ]
}
```