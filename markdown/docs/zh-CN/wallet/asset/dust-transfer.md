# 小额资产转换(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-transfer#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

小额资产转换

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-transfer#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/asset/dust`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-transfer#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-transfer#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称          | 类型     | 是否必需 | 描述                         |
|-------------|--------|------|----------------------------|
| asset       | ARRAY  | YES  | 正在转换的资产。 例如：asset=BTC,USDT |
| accountType | STRING | NO   | `SPOT`或`MARGIN`,默认`SPOT`   |
| recvWindow  | LONG   | NO   |                            |
| timestamp   | LONG   | YES  |                            |

> - 您需要为API Key开通`允许现货和杠杆交易`权限才能发送此请求

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/dust-transfer#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "totalServiceCharge":"0.02102542",
    "totalTransfered":"1.05127099",
    "transferResult":[
        {
            "amount":"0.03000000",
            "fromAsset":"ETH",
            "operateTime":1563368549307,
            "serviceChargeAmount":"0.00500000",
            "tranId":2970932918,
            "transferedAmount":"0.25000000"
        },
        {
            "amount":"0.09000000",
            "fromAsset":"LTC",
            "operateTime":1563368549404,
            "serviceChargeAmount":"0.01548000",
            "tranId":2970932918,
            "transferedAmount":"0.77400000"
        },
        {
            "amount":"248.61878453",
            "fromAsset":"TRX",
            "operateTime":1563368549489,
            "serviceChargeAmount":"0.00054542",
            "tranId":2970932918,
            "transferedAmount":"0.02727099"
        }
    ]
}
```