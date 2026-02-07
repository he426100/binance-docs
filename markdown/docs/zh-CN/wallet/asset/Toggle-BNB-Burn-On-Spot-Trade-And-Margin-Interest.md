# 现货交易和杠杆利息BNB抵扣开关(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/Toggle-BNB-Burn-On-Spot-Trade-And-Margin-Interest#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

现货交易和杠杆利息BNB抵扣开关

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/Toggle-BNB-Burn-On-Spot-Trade-And-Margin-Interest#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/bnbBurn`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/wallet/asset/Toggle-BNB-Burn-On-Spot-Trade-And-Margin-Interest#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/Toggle-BNB-Burn-On-Spot-Trade-And-Margin-Interest#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称              | 类型     | 是否必需 | 描述                                   |
|-----------------|--------|------|--------------------------------------|
| spotBNBBurn     | STRING | NO   | "true" or "false", 是否使用BNB支付现货交易的手续费 |
| interestBNBBurn | STRING | NO   | "true" or "false", 是否使用BNB支付杠杆贷款的利息  |
| recvWindow      | LONG   | NO   | 赋值不能大于 60000                         |
| timestamp       | LONG   | YES  |                                      |

- "spotBNBBurn" 和 "interestBNBBurn" 二者必须传至少一个

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/Toggle-BNB-Burn-On-Spot-Trade-And-Margin-Interest#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
   "spotBNBBurn":true,
   "interestBNBBurn": false   
}
```