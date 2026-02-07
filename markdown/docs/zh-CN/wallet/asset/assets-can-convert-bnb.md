# 获取可以转换成BNB的小额资产 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-can-convert-bnb#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取可以转换成BNB的小额资产

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-can-convert-bnb#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/asset/dust-btc`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-can-convert-bnb#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-can-convert-bnb#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称          | 类型     | 是否必需 | 描述                       |
|-------------|--------|------|--------------------------|
| accountType | STRING | NO   | `SPOT`或`MARGIN`,默认`SPOT` |
| recvWindow  | LONG   | NO   |                          |
| timestamp   | LONG   | YES  |                          |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/assets-can-convert-bnb#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "details": [
        {
            "asset": "ADA",         //资产名
            "assetFullName": "ADA", //资产全称
            "amountFree": "6.21",   //可转换数量
            "toBTC": "0.00016848",  //等值BTC
            "toBNB": "0.01777302",  //可转换BNB（未扣除手续费）
            "toBNBOffExchange": "0.01741756", //可转换BNB（已扣除手续费）
            "exchange": "0.00035546" //手续费
        }
    ],
    "totalTransferBtc": "0.00016848",//全部资产等值BTC
    "totalTransferBNB": "0.01777302",//总共可以转换的BNB数量
    "dribbletPercentage": "0.02"     //转换手续费
} 
```