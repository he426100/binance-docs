# 获取账户损益资金流水(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Income-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取账户损益资金流水

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Income-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/income`

**权重:** 30

**参数:**

| 名称         | 类型     | 是否必需 | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|------------|--------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| symbol     | STRING | NO   | 交易对                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| incomeType | STRING | NO   | 收益类型： TRANSFER 转账, WELCOME\_BONUS 欢迎奖金, REALIZED\_PNL 已实现盈亏, FUNDING\_FEE 资金费用, COMMISSION 佣金, INSURANCE\_CLEAR 强平, REFERRAL\_KICKBACK 推荐人返佣, COMMISSION\_REBATE 被推荐人返佣, API\_REBATE API佣金回扣, CONTEST\_REWARD 交易大赛奖金, CROSS\_COLLATERAL\_TRANSFER cc转账, OPTIONS\_PREMIUM\_FEE 期权购置手续费, OPTIONS\_SETTLE\_PROFIT 期权行权收益, INTERNAL\_TRANSFER 内部账户，给普通用户划转, AUTO\_EXCHANGE 自动兑换, DELIVERED\_SETTELMENT 下架结算, COIN\_SWAP\_DEPOSIT 闪兑转入, COIN\_SWAP\_WITHDRAW 闪兑转出, POSITION\_LIMIT\_INCREASE\_FEE 仓位限制上调费用，STRATEGY\_UMFUTURES\_TRANSFER UM策略子账户划转，FEE\_RETURN 策略交易手续费退还，BFUSD\_REWARD BFUSD每日奖励 |
| startTime  | LONG   | NO   | 起始时间                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| endTime    | LONG   | NO   | 结束时间                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| page       | INT    | NO   | 分页数                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| limit      | INT    | NO   | 返回的结果集数量 默认值:100 最大值:1000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| recvWindow | LONG   | NO   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| timestamp  | LONG   | YES  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

> - 如果`startTime` 和 `endTime` 均未发送, 只会返回最近7天的数据。
> - 如果`incomeType`没有发送，返回所有类型账户损益资金流水。
> - "trandId" 在相同用户的同一种收益流水类型中是唯一的。
> - 仅保留最近3个月的数据。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Income-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
	{
    	"symbol": "", // 交易对，仅针对涉及交易对的资金流
    	"incomeType": "TRANSFER",	// 资金流类型
    	"income": "-0.37500000", // 资金流数量，正数代表流入，负数代表流出
    	"asset": "USDT", // 资产内容
    	"info":"TRANSFER", // 备注信息，取决于流水类型
    	"time": 1570608000000, // 时间
    	"tranId":9689322392,		// 划转ID
    	"tradeId":""					// 引起流水产生的原始交易ID
	},
	{
   		"symbol": "BTCUSDT",
    	"incomeType": "COMMISSION", 
    	"income": "-0.01000000",
    	"asset": "USDT",
    	"info":"COMMISSION",
    	"time": 1570636800000,
    	"tranId":9689322392,		
    	"tradeId":"2059192"					
	}
]
```