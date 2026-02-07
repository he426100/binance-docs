# 小额可以兑换的资产(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convertible-assets#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取小额可以兑换的资产

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convertible-assets#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/asset/dust-convert/query-convertible-assets`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convertible-assets#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convertible-assets#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                               | 类型         | 是否必需 | 描述 |
|----------------------------------|------------|------|----|
| targetAsset                      | STRING     | YES  |    |
| dustQuotaAssetToTargetAssetPrice | BIGDECIMAL | NO   |    |
| timestamp                        | LONG       | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-convertible-assets#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "dribbletPercentage": "0.02",
    "totalTransferQuotaAssetAmount": "0.7899968",
    "totalTransferTargetAssetAmount": "0.7899968",
    "dribbletBase": "10",
    "details": [
        {
            "asset": "AR",
            "assetFullName": "AR",
            "amountFree": "0.00856",
            "exchange": "0.00073616",
            "toQuotaAssetAmount": "0.036808",
            "toTargetAssetAmount": "0.036808",
            "toTargetAssetOffExchange": "0.03607184"
        },
        {
            "asset": "BNB",
            "assetFullName": "BNB",
            "amountFree": "0.00082768",
            "exchange": "0.01506378",
            "toQuotaAssetAmount": "0.7531888",
            "toTargetAssetAmount": "0.7531888",
            "toTargetAssetOffExchange": "0.73812502"
        }
    ]
}
```