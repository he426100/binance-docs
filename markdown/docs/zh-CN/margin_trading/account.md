# 调整全仓最大杠杆 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/account#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

调整全仓最大杠杆倍数

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/account#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/max-leverage`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/margin_trading/account#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**3000**

**访问限制**

1次/分钟/IP

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/account#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称          | 类型      | 是否必需 | 描述                                                                                                                 |
|-------------|---------|------|--------------------------------------------------------------------------------------------------------------------|
| maxLeverage | Integer | YES  | 只能调整3, 5 , 或者 10。举例: maxLeverage = 5 或者3是选择全仓Classic模式； maxLeverage=10 是选择切换成全仓 Pro 模式下的10倍杠杆 或者 20倍杠杆（在合规允许的情况下）。 |

- 当前的风险率需要大于调整后的初始风险率，3x的初始风险率是1.5，5x的初始风险率是1.25，关于在Classic模式(3x, 5x) 和Pro模式(10x, 20x)之间的切换条件请参考[FAQ](https://www.binance.com/zh-CN/support/faq/%E5%A6%82%E4%BD%95%E5%9C%A8%E5%B8%81%E5%AE%89%E5%BC%80%E9%80%9A%E5%85%A8%E4%BB%93%E6%9D%A0%E6%9D%86%E4%B8%93%E4%B8%9A%E6%A8%A1%E5%BC%8F-e27786da05e743a694b8c625b3bc475d)。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/account#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "success": true
}
```