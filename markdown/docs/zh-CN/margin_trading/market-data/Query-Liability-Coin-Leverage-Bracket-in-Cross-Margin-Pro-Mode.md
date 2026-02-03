# Query Liability Coin Leverage Bracket in Cross Margin Pro Mode(MARKET\_DATA)

## API Description[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Liability-Coin-Leverage-Bracket-in-Cross-Margin-Pro-Mode#api-description "API Description的直接链接")

Liability Coin Leverage Bracket in Cross Margin Pro Mode

## HTTP Request[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Liability-Coin-Leverage-Bracket-in-Cross-Margin-Pro-Mode#http-request "HTTP Request的直接链接")

GET `/sapi/v1/margin/leverageBracket`

## Request Weight(IP)[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Liability-Coin-Leverage-Bracket-in-Cross-Margin-Pro-Mode#request-weightip "Request Weight(IP)的直接链接")

**1**

## Request Parameters[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Liability-Coin-Leverage-Bracket-in-Cross-Margin-Pro-Mode#request-parameters "Request Parameters的直接链接")

None

## Response Example[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-Liability-Coin-Leverage-Bracket-in-Cross-Margin-Pro-Mode#response-example "Response Example的直接链接")

```javascript
[
  {
     "assetNames":[
        "SHIB",
        "FDUSD",
        "BTC",
        "ETH",
        "USDC"
     ],          
     "rank":1,
     "brackets":[
        {
           "leverage":10,
           "maxDebt":1000000.00000000,
           "maintenanceMarginRate":0.02000000,
           "initialMarginRate":0.1112,
           "fastNum":0
        },
        {
           "leverage":3,
           "maxDebt":4000000.00000000,
           "maintenanceMarginRate":0.07000000,
           "initialMarginRate":0.5000,
           "fastNum":60000.0000000000000000
        }
     ]
  }
]
```