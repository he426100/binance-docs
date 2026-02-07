# 小额资产转换BNB历史(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-log#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

小额资产转换BNB历史(USER\_DATA)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-log#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/asset/dribblet`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-log#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-log#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称          | 类型     | 是否必需 | 描述                       |
|-------------|--------|------|--------------------------|
| accountType | STRING | NO   | `SPOT`或`MARGIN`,默认`SPOT` |
| startTime   | LONG   | NO   |                          |
| endTime     | LONG   | NO   |                          |
| recvWindow  | LONG   | NO   |                          |
| timestamp   | LONG   | YES  |                          |

> - 只返回最近100条记录
> - 只返回 2020/12/01 之后记录

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-log#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
        "total": 8,   //共计发生过的转换笔数
        "userAssetDribblets": [
            {
                "operateTime": 1615985535000,
                "totalTransferedAmount": "0.00132256",   //本次转换所得BNB
                "totalServiceChargeAmount": "0.00002699",   //本次转换手续费(BNB)
                "transId": 45178372831,
                "userAssetDribbletDetails": [           //本次转换的细节
                    {
                        "transId": 4359321,
                        "serviceChargeAmount": "0.000009",
                        "amount": "0.0009",
                        "operateTime": 1615985535000,
                        "transferedAmount": "0.000441",
                        "fromAsset": "USDT"
                    },
                    {
                        "transId": 4359321,
                        "serviceChargeAmount": "0.00001799",
                        "amount": "0.0009",
                        "operateTime": 1615985535000,
                        "transferedAmount": "0.00088156",
                        "fromAsset": "ETH"
                    }
                ]
            },
            {
                "operateTime":1616203180000,
                "totalTransferedAmount": "0.00058795",
                "totalServiceChargeAmount": "0.000012",
                "transId": 4357015,
                "userAssetDribbletDetails": [       
                    {
                        "transId": 4357015,
                        "serviceChargeAmount": "0.00001"
                        "amount": "0.001",
                        "operateTime": 1616203180000,
                        "transferedAmount": "0.00049",
                        "fromAsset": "USDT"
                    },
                    {
                        "transId": 4357015,
                        "serviceChargeAmount": "0.000002"         
                        "amount": "0.0001",
                        "operateTime": 1616203180000,
                        "transferedAmount": "0.00009795",
                        "fromAsset": "ETH"
                    }
                ]
            }
        ]
}
```