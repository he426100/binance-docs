# 季度合约历史结算价

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Delivery-Price#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

返回季度合约历史结算价

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Delivery-Price#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/futures/data/delivery-price`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Delivery-Price#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**0**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Delivery-Price#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称   | 类型     | 是否必需 | 描述       |
|------|--------|------|----------|
| pair | STRING | YES  | 如BTCUSDT |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Delivery-Price#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **响应:**

```javascript
[
    {
        "deliveryTime": 1695945600000,
        "deliveryPrice": 27103.00000000
    },
    {
        "deliveryTime": 1688083200000,
        "deliveryPrice": 30733.60000000
    },
    {
        "deliveryTime": 1680220800000,
        "deliveryPrice": 27814.20000000
    },
    {
        "deliveryTime": 1648166400000,
        "deliveryPrice": 44066.30000000
    }
]
```