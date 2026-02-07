# 资产利息记录(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-divided-record#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取资产利息记录。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-divided-record#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/asset/assetDividend`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-divided-record#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-divided-record#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                  |
|------------|--------|------|---------------------|
| asset      | STRING | NO   |                     |
| startTime  | LONG   | NO   |                     |
| endTime    | LONG   | NO   |                     |
| limit      | INT    | NO   | Default 20, max 500 |
| recvWindow | LONG   | NO   |                     |
| timestamp  | LONG   | YES  |                     |

> - `startTime` 与 `endTime`之间最多只可以相差180天。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-divided-record#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "rows":[
        {
            "id":1637366104,
            "amount":"10.00000000",
            "asset":"BHFT",
            "divTime":1563189166000,
            "enInfo":"BHFT distribution",
            "tranId":2968885920,
            "direction": 1 // direction：1 表示资产记账入账（资产流入），-1 表示资产记账出账（资产流出）
        },
        {
            "id": 1631750237,
            "amount":"10.00000000",
            "asset":"BHFT",
            "divTime":1563189165000,
            "enInfo":"BHFT distribution",
            "tranId":2968885920,
            "direction": 1 
        }
    ],
    "total":2
}
```