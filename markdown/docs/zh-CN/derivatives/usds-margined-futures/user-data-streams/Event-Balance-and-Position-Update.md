# Balance 和 Position 更新推送

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Balance-and-Position-Update#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

账户更新事件的 event type 固定为 `ACCOUNT_UPDATE`

- 当账户信息有变动时，会推送此事件：
  
  - 仅当账户信息有变动时(包括资金、仓位、保证金模式等发生变化)，才会推送此事件；
  - 订单状态变化没有引起账户和持仓变化的，不会推送此事件；
  - position 信息：仅当 symbol 仓位有变动时推送。
- "FUNDING FEE" 引起的资金余额变化，仅推送简略事件：
  
  - 当用户某**全仓**持仓发生"FUNDING FEE"时，事件`ACCOUNT_UPDATE`将只会推送相关的用户资产余额信息`B`(仅推送 FUNDING FEE 发生相关的资产余额信息)，而不会推送任何持仓信息`P`。
  - 当用户某**逐仓**仓持仓发生"FUNDING FEE"时，事件`ACCOUNT_UPDATE`将只会推送相关的用户资产余额信息`B`(仅推送"FUNDING FEE"所使用的资产余额信息)，和相关的持仓信息`P`(仅推送这笔"FUNDING FEE"发生所在的持仓信息)，其余持仓信息不会被推送。
- 字段"m"代表了事件推出的原因，包含了以下可能类型:
  
  - DEPOSIT
  - WITHDRAW
  - ORDER
  - FUNDING\_FEE
  - WITHDRAW\_REJECT
  - ADJUSTMENT
  - INSURANCE\_CLEAR
  - ADMIN\_DEPOSIT
  - ADMIN\_WITHDRAW
  - MARGIN\_TRANSFER
  - MARGIN\_TYPE\_CHANGE
  - ASSET\_TRANSFER
  - OPTIONS\_PREMIUM\_FEE
  - OPTIONS\_SETTLE\_PROFIT
  - AUTO\_EXCHANGE
  - COIN\_SWAP\_DEPOSIT
  - COIN\_SWAP\_WITHDRAW
- 字段"bc"代表了钱包余额的改变量，即 balance change，但注意其不包含仓位盈亏及交易手续费。

## URL PATH[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Balance-and-Position-Update#url-path "URL PATH的直接链接")

`/private`

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Balance-and-Position-Update#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`ACCOUNT_UPDATE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-Balance-and-Position-Update#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e": "ACCOUNT_UPDATE",				// 事件类型
  "E": 1564745798939,            		// 事件时间
  "T": 1564745798938 ,           		// 撮合时间
  "a":                          		// 账户更新事件
    {
      "m":"ORDER",						// 事件推出原因
      "B":[                     		// 余额信息
        {
          "a":"USDT",           		// 资产名称
          "wb":"122624.12345678",    	// 钱包余额
          "cw":"100.12345678",			// 除去逐仓仓位保证金的钱包余额
          "bc":"50.12345678"			// 除去盈亏与交易手续费以外的钱包余额改变量
        },
        {
          "a":"BUSD",
          "wb":"1.00000000",
          "cw":"0.00000000",
          "bc":"-49.12345678"
        }
      ],
      "P":[
       {
          "s":"BTCUSDT",          	// 交易对
          "pa":"0",               	// 仓位
          "ep":"0.00000",            // 入仓价格
          "bep":"0",                // 盈亏平衡价
          "cr":"200",             	// (费前)累计实现损益
          "up":"0",						// 持仓未实现盈亏
          "mt":"isolated",				// 保证金模式
          "iw":"0.00000000",			// 若为逐仓，仓位保证金
          "ps":"BOTH"					// 持仓方向
       }，
       {
        	"s":"BTCUSDT",
        	"pa":"20",
        	"ep":"6563.66500",
        	"bep":"6563.6",
        	"cr":"0",
        	"up":"2850.21200",
        	"mt":"isolated",
        	"iw":"13200.70726908",
        	"ps":"LONG"
      	 },
       {
        	"s":"BTCUSDT",
        	"pa":"-10",
        	"ep":"6563.86000",
        	"bep":"6563.6",
        	"cr":"-45.04000000",
        	"up":"-1423.15600",
        	"mt":"isolated",
        	"iw":"6570.42511771",
        	"ps":"SHORT"
       }
      ]
    }
}
```