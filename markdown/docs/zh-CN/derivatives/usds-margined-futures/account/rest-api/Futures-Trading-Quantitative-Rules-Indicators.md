# 合约交易量化规则指标(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Trading-Quantitative-Rules-Indicators#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

合约交易量化规则指标，更多细节, 请参考[合约交易量化规则](https://www.binance.com/cn/support/faq/4f462ebe6ff445d4a170be7d9e897272)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Trading-Quantitative-Rules-Indicators#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/apiTradingStatus`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Trading-Quantitative-Rules-Indicators#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

- 带 symbol ***1***
- 不带 ***10***

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Trading-Quantitative-Rules-Indicators#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述 |
|------------|--------|------|----|
| symbol     | STRING | NO   |    |
| recvWindow | LONG   | NO   |    |
| timestamp  | LONG   | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Trading-Quantitative-Rules-Indicators#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **响应:**

```javascript
{
    "indicators": { // indicator:风控指标名, value:用户在该市场的风控指标数值, triggerValue:阈值, 对于没有达到记录阈值的则不返回数据。
        "BTCUSDT": [
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000, // 预计恢复时间，若当前时间大等于预计恢复时间则为空
                "indicator": "UFR",  // Unfilled Ratio (UFR)
                "value": 0.05,  // Current value
                "triggerValue": 0.995  // Trigger value
            },
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000,
                "indicator": "IFER",  // IOC/FOK Expiration Ratio (IFER)
                "value": 0.99,  // Current value
                "triggerValue": 0.99  // Trigger value
            },
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000,
                "indicator": "GCR",  // GTC Cancellation Ratio (GCR)
                "value": 0.99,  // Current value
                "triggerValue": 0.99  // Trigger value
            },
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000,
                "indicator": "DR",  // Dust Ratio (DR)
                "value": 0.99,  // Current value
                "triggerValue": 0.99  // Trigger value
            }
        ],
        "ETHUSDT": [
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000,
                "indicator": "UFR",
                "value": 0.05,
                "triggerValue": 0.995
            },
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000,
                "indicator": "IFER",
                "value": 0.99,
                "triggerValue": 0.99
            },
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000,
                "indicator": "GCR",
                "value": 0.99,
                "triggerValue": 0.99
            }
            {
				"isLocked": true, // 用户该品种交易是否被风控禁用
			    "plannedRecoverTime": 1545741270000,
                "indicator": "DR",
                "value": 0.99,
                "triggerValue": 0.99
            }
        ]
    },
    "updateTime": 1545741270000 // 返回值的更新时间
}
```

> 或(触发账号层级违规时)

```javascript
{
    "indicators":{
        "ACCOUNT":[
            {
                "indicator":"TMV",  //  Too many violations 多交易对触发账号层级违规
                "value":10,
                "triggerValue":1,
                "plannedRecoverTime":1644919865000,
                "isLocked":true
            }
        ]
    },
    "updateTime":1644913304748
}
```