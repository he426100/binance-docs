# 杠杆可用放贷库存查询(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-margin-avaliable-inventory#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

杠杆可用放贷库存查询

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-margin-avaliable-inventory#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/available-inventory`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-margin-avaliable-inventory#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**50**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-margin-avaliable-inventory#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称   | 类型     | 是否必需 | 描述              |
|------|--------|------|-----------------|
| type | STRING | YES  | MARGIN,ISOLATED |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Query-margin-avaliable-inventory#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "assets": {
        "MATIC": "100000000",
        "STPT": "100000000",
        "TVK": "100000000",
        "SHIB": "97409653"
    }
  	"updateTime": 1699272487
}
```