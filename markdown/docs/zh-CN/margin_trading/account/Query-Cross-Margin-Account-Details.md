# 查询全仓杠杆账户详情 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Margin-Account-Details#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询全仓杠杆账户详情

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Margin-Account-Details#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/account`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Margin-Account-Details#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Margin-Account-Details#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述             |
|------------|------|------|----------------|
| recvWindow | LONG | NO   | 赋值不能大于 `60000` |
| timestamp  | LONG | YES  |                |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Query-Cross-Margin-Account-Details#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
      "created" : true, // true 表示已开户, false 表示未开户
      "borrowEnabled": true,
      "marginLevel": "11.64405625",
      "collateralMarginLevel" : "3.2",
      "totalAssetOfBtc": "6.82728457",
      "totalLiabilityOfBtc": "0.58633215",
      "totalNetAssetOfBtc": "6.24095242",
      "TotalCollateralValueInUSDT": "5.82728457",
      "totalOpenOrderLossInUSDT": "582.728457",
      "tradeEnabled": true,
      "transferInEnabled": true,
      "transferOutEnabled": true,
      "accountType": "MARGIN_1", // MARGIN_1 全仓Classic模式账户, MARGIN_2 全仓Pro模式账户
      "userAssets": [
          {
              "asset": "BTC",
              "borrowed": "0.00000000",
              "free": "0.00499500",
              "interest": "0.00000000",
              "locked": "0.00000000",
              "netAsset": "0.00499500"
          },
          {
              "asset": "BNB",
              "borrowed": "201.66666672",
              "free": "2346.50000000",
              "interest": "0.00000000",
              "locked": "0.00000000",
              "netAsset": "2144.83333328"
          },
          {
              "asset": "ETH",
              "borrowed": "0.00000000",
              "free": "0.00000000",
              "interest": "0.00000000",
              "locked": "0.00000000",
              "netAsset": "0.00000000"
          },
          {
              "asset": "USDT",
              "borrowed": "0.00000000",
              "free": "0.00000000",
              "interest": "0.00000000",
              "locked": "0.00000000",
              "netAsset": "0.00000000"
          }
      ]
}
```