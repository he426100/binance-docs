# 基差

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Basis#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询期货基差

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Basis#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/futures/data/basis`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Basis#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**0**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Basis#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称           | 类型     | 是否必需 | 描述                                              |
|--------------|--------|------|-------------------------------------------------|
| pair         | STRING | YES  | BTCUSDT                                         |
| contractType | ENUM   | YES  | CURRENT\_QUARTER, NEXT\_QUARTER, PERPETUAL      |
| period       | ENUM   | YES  | "5m","15m","30m","1h","2h","4h","6h","12h","1d" |
| limit        | LONG   | YES  | Default 30,Max 500                              |
| startTime    | LONG   | NO   |                                                 |
| endTime      | LONG   | NO   |                                                 |

> - 若无 startime 和 endtime 限制， 则默认返回当前时间往前的limit值
> - 仅支持最近30天的数据

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Basis#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[  
    {
        "indexPrice": "34400.15945055",
        "contractType": "PERPETUAL",
        "basisRate": "0.0004",
        "futuresPrice": "34414.10",
        "annualizedBasisRate": "",
        "basis": "13.94054945",
        "pair": "BTCUSDT",
        "timestamp": 1698742800000
    }
]
```