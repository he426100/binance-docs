# 账户API交易状态(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/account/account-api-trading-status#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取 api 账户交易状态详情。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/account/account-api-trading-status#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/account/apiTradingStatus`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/account/account-api-trading-status#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/account/account-api-trading-status#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/account/account-api-trading-status#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"data": {          // 账户API交易状态详情
			"isLocked": false,   // API交易功能是否被锁
			"plannedRecoverTime": 0,  // API交易功能被锁情况下的预计恢复时间
			"triggerCondition": { 
					"GCR": 150,  // Number of GTC orders
					"IFER": 150, // Number of FOK/IOC orders
					"UFR": 300   // Number of orders
			},
			"updateTime": 1547630471725   
	}
}
```