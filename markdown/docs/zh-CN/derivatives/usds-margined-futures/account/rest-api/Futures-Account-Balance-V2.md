# 账户余额V2 (USER\_DATA)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Account-Balance-V2#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v2/balance`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Account-Balance-V2#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Account-Balance-V2#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Futures-Account-Balance-V2#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
 	{
 		"accountAlias": "SgsR",    // 账户唯一识别码
 		"asset": "USDT",		// 资产
 		"balance": "122607.35137903",	// 总余额
 		"crossWalletBalance": "23.72469206", // 全仓余额
  		"crossUnPnl": "0.00000000",  // 全仓持仓未实现盈亏
  		"availableBalance": "23.72469206",       // 下单可用余额
  		"maxWithdrawAmount": "23.72469206",     // 最大可转出余额
  		"marginAvailable": true,    // 是否可用作联合保证金
  		"updateTime": 1617939110373
	}
]
```