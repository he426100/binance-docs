# 用户持仓风险V3 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-Information-V3#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询持仓风险，仅返回有持仓或挂单的交易对

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-Information-V3#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v3/positionRisk`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-Information-V3#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-Information-V3#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述 |
|------------|--------|------|----|
| symbol     | STRING | NO   |    |
| recvWindow | LONG   | NO   |    |
| timestamp  | LONG   | YES  |    |

**注意**

> - 请与账户推送信息`ACCOUNT_UPDATE`配合使用，以满足您的及时性和准确性需求。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Position-Information-V3#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> 单向持仓模式下：

```javascript
[
  {
        "symbol": "ADAUSDT",
        "positionSide": "BOTH",               // 持仓方向
        "positionAmt": "30",
        "entryPrice": "0.385",
        "breakEvenPrice": "0.385077",
        "markPrice": "0.41047590",
        "unRealizedProfit": "0.76427700",     // 持仓未实现盈亏 
        "liquidationPrice": "0",
        "isolatedMargin": "0",
        "notional": "12.31427700",
        "marginAsset": "USDT",
        "isolatedWallet": "0",
        "initialMargin": "0.61571385",        // 初始保证金
        "maintMargin": "0.08004280",          // 维持保证金
        "positionInitialMargin": "0.61571385",// 仓位初始保证金
        "openOrderInitialMargin": "0",        // 订单初始保证金
        "adl": 2,
        "bidNotional": "0",                   
        "askNotional": "0",                   
        "updateTime": 1720736417660           // 更新时间
  }
]
```

> 双向持仓模式下：

```javascript
[
  {
        "symbol": "ADAUSDT",
        "positionSide": "LONG",               
        "positionAmt": "30",
        "entryPrice": "0.385",
        "breakEvenPrice": "0.385077",
        "markPrice": "0.41047590",
        "unRealizedProfit": "0.76427700",    
        "liquidationPrice": "0",
        "isolatedMargin": "0",
        "notional": "12.31427700",
        "marginAsset": "USDT",
        "isolatedWallet": "0",
        "initialMargin": "0.61571385",        
        "maintMargin": "0.08004280",          
        "positionInitialMargin": "0.61571385",
        "openOrderInitialMargin": "0",       
        "adl": 2,
        "bidNotional": "0",                  
        "askNotional": "0",                
        "updateTime": 1720736417660
  },
  {
        "symbol": "COMPUSDT",
        "positionSide": "SHORT",
        "positionAmt": "-1.000",
        "entryPrice": "70.92841",
        "breakEvenPrice": "70.900038636",
        "markPrice": "49.72023376",
        "unRealizedProfit": "21.20817624",
        "liquidationPrice": "2260.56757210",
        "isolatedMargin": "0",
        "notional": "-49.72023376",
        "marginAsset": "USDT",
        "isolatedWallet": "0",
        "initialMargin": "2.48601168",
        "maintMargin": "0.49720233",
        "positionInitialMargin": "2.48601168",
        "openOrderInitialMargin": "0",
        "adl": 2,
        "bidNotional": "0",
        "askNotional": "0",
        "updateTime": 1708943511656
  }
]
```