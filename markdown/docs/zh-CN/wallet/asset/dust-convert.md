# 小额资产兑换(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convert#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

小额兑换

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convert#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/asset/dust-convert/convert`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convert#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convert#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                               | 类型         | 是否必需 | 描述          |
|----------------------------------|------------|------|-------------|
| asset                            | ARRAY      | YES  |             |
| clientId                         | STRING     | NO   | 用户自定义的请求号 ｜ |
| targetAsset                      | STRING     | NO   |             |
| thirdPartyClientId               | STRING     | NO   |             |
| dustQuotaAssetToTargetAssetPrice | BIGDECIMAL | NO   |             |
| timestamp                        | LONG       | YES  |             |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convert#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "totalTransfered": "3.5971223",
    "totalServiceCharge": "0.0794964",
    "transferResult": [
        {
            "tranId": 2987331510,
            "fromAsset": "USDT",
            "amount": "1",
            "transferedAmount": "3.5971223",
            "serviceChargeAmount": "0.0794964",
            "operateTime": 1765212029749
        }
    ]
}
```