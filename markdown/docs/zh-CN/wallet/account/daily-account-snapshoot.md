# 查询每日资产快照(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/account/daily-account-snapshoot#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询每日资产快照

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/account/daily-account-snapshoot#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/accountSnapshot`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/account/daily-account-snapshoot#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**2400**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/account/daily-account-snapshoot#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                          |
|------------|--------|------|-----------------------------|
| type       | STRING | YES  | "SPOT", "MARGIN", "FUTURES" |
| startTime  | LONG   | NO   |                             |
| endTime    | LONG   | NO   |                             |
| limit      | INT    | NO   | min 7, max 30, default 7    |
| recvWindow | LONG   | NO   |                             |
| timestamp  | LONG   | YES  |                             |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/account/daily-account-snapshoot#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
   "code":200, // 200表示返回正确，否则即为错误码
   "msg":"", // 与错误码对应的报错信息
   "snapshotVos":[
      {
         "data":{
            "balances":[
               {
                  "asset":"BTC",
                  "free":"0.09905021",
                  "locked":"0.00000000"
               },
               {
                  "asset":"USDT",
                  "free":"1.89109409",
                  "locked":"0.00000000"
               }
            ],
            "totalAssetOfBtc":"0.09942700"
         },
         "type":"spot",
         "updateTime":1576281599000
      }
   ]
}

```

> 或

```javascript
{
   "code":200, // 200表示返回正确，否则即为错误码
   "msg":"", // 与错误码对应的报错信息
   "snapshotVos":[
      {
         "data":{
            "marginLevel":"2748.02909813",
            "totalAssetOfBtc":"0.00274803",
            "totalLiabilityOfBtc":"0.00000100",
            "totalNetAssetOfBtc":"0.00274750",
            "userAssets":[
               {
                  "asset":"XRP",
                  "borrowed":"0.00000000",
                  "free":"1.00000000",
                  "interest":"0.00000000",
                  "locked":"0.00000000",
                  "netAsset":"1.00000000"
               }
            ]
         },
         "type":"margin",
         "updateTime":1576281599000
      }
   ]
}
```

> 或

```javascript
{
   "code":200, // 200表示返回正确，否则即为错误码
   "msg":"", // 与错误码对应的报错信息
   "snapshotVos":[
      {
         "data":{
            "assets":[
               {
                  "asset":"USDT",
                  "marginBalance":"118.99782335", // 不会实时更新，可以忽略
                  "walletBalance":"120.23811389"
               }
            ],
            "position":[
               {
                  "entryPrice":"7130.41000000",
                  "markPrice":"7257.66239673",
                  "positionAmt":"0.01000000",
                  "symbol":"BTCUSDT",
                  "unRealizedProfit":"1.24029054" // 只显示开仓当时的未实现盈亏，不会实时更新，可以忽略
               }
            ]
         },
         "type":"futures",
         "updateTime":1576281599000
      }
   ]
}
```