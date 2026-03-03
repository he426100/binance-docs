# 用户持仓风险V2 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Position-Information#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询持仓风险

## 方式[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Position-Information#%E6%96%B9%E5%BC%8F "方式的直接链接")

`account.position`

## 请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Position-Information#%E8%AF%B7%E6%B1%82 "请求的直接链接")

```javascript
{
   	"id": "605a6d20-6588-4cb9-afa0-b0ab087507ba",
    "method": "account.position",
    "params": {
        "apiKey": "xTaDyrmvA9XT2oBHHjy39zyPzKCvMdtH3b9q4xadkAg2dNSJXQGCxzui26L823W2",
        "symbol": "BTCUSDT",
        "timestamp": 1702920680303,
        "signature": "31ab02a51a3989b66c29d40fcdf78216978a60afc6d8dc1c753ae49fa3164a2a"
    }
}
```

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Position-Information#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Position-Information#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述 |
|------------|--------|------|----|
| symbol     | STRING | NO   |    |
| recvWindow | LONG   | NO   |    |
| timestamp  | LONG   | YES  |    |

**注意**

> - 请与账户推送信息`ACCOUNT_UPDATE`配合使用，以满足您的及时性和准确性需求。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/websocket-api/Position-Information#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> 单向持仓模式下：

```javascript
{
  "id": "605a6d20-6588-4cb9-afa0-b0ab087507ba",
  "status": 200,
  "result":[
  	{
		"entryPrice": "0.00000",  // 开仓均价
		"breakEvenPrice": "0.0",  // 盈亏平衡价
  		"marginType": "isolated", // 逐仓模式或全仓模式
  		"isAutoAddMargin": "false",
  		"isolatedMargin": "0.00000000",	// 逐仓保证金
  		"leverage": "10", // 当前杠杆倍数
  		"liquidationPrice": "0", // 参考强平价格
  		"markPrice": "6679.50671178",	// 当前标记价格
  		"maxNotionalValue": "20000000", // 当前杠杆倍数允许的名义价值上限
  		"positionAmt": "0.000", // 头寸数量，符号代表多空方向, 正数为多，负数为空
  		"notional": "0",
  		"isolatedWallet": "0",
  		"symbol": "BTCUSDT", // 交易对
  		"unRealizedProfit": "0.00000000", // 持仓未实现盈亏
  		"positionSide": "BOTH", // 持仓方向
  		"updateTime": 1625474304765   // 更新时间
  	}
  ],
  "rateLimits": [
    {
      "rateLimitType": "REQUEST_WEIGHT",
      "interval": "MINUTE",
      "intervalNum": 1,
      "limit": 2400,
      "count": 20
    }
  ]
}
```

> 双向持仓模式下：

```javascript
{
  "id": "605a6d20-6588-4cb9-afa0-b0ab087507ba",
  "status": 200,
  "result": [
    {
        "symbol": "BTCUSDT",
        "positionAmt": "0.001",
        "entryPrice": "22185.2",
        "breakEvenPrice": "0.0",  
        "markPrice": "21123.05052574",
        "unRealizedProfit": "-1.06214947",
        "liquidationPrice": "19731.45529116",
        "leverage": "4",
        "maxNotionalValue": "100000000",
        "marginType": "cross",
        "isolatedMargin": "0.00000000",
        "isAutoAddMargin": "false",
        "positionSide": "LONG",
        "notional": "21.12305052",
        "isolatedWallet": "0",
        "updateTime": 1655217461579
    },
    {
        "symbol": "BTCUSDT",
        "positionAmt": "0.000",
        "entryPrice": "0.0",
        "breakEvenPrice": "0.0",  
        "markPrice": "21123.05052574",
        "unRealizedProfit": "0.00000000",
        "liquidationPrice": "0",
        "leverage": "4",
        "maxNotionalValue": "100000000",
        "marginType": "cross",
        "isolatedMargin": "0.00000000",
        "isAutoAddMargin": "false",
        "positionSide": "SHORT",
        "notional": "0",
        "isolatedWallet": "0",
        "updateTime": 0
    }
],
  "rateLimits": [
    {
      "rateLimitType": "REQUEST_WEIGHT",
      "interval": "MINUTE",
      "intervalNum": 1,
      "limit": 2400,
      "count": 20
    }
  ]
}
```