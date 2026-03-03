# 合约持仓量历史

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Open-Interest-Statistics#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询合约持仓量历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Open-Interest-Statistics#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/futures/data/openInterestHist`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Open-Interest-Statistics#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**0**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Open-Interest-Statistics#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称        | 类型     | 是否必需 | 描述                                              |
|-----------|--------|------|-------------------------------------------------|
| symbol    | STRING | YES  |                                                 |
| period    | ENUM   | YES  | "5m","15m","30m","1h","2h","4h","6h","12h","1d" |
| limit     | LONG   | NO   | default 30, max 500                             |
| startTime | LONG   | NO   |                                                 |
| endTime   | LONG   | NO   |                                                 |

> - 若无 startime 和 endtime 限制， 则默认返回当前时间往前的limit值
> - 仅支持最近1个月的数据
> - IP限频为1000次/5min

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Open-Interest-Statistics#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    { 
         "symbol":"BTCUSDT",
	      "sumOpenInterest":"20403.12345678",// 持仓总数量
	      "sumOpenInterestValue": "176196512.12345678", // 持仓总价值
          "CMCCirculatingSupply": "165880.538", // CMC提供的流通供应量
	      "timestamp":"1583127900000"
    
     },
     {
     
         "symbol":"BTCUSDT",
         "sumOpenInterest":"20401.36700000",
         "sumOpenInterestValue":"149940752.14464448",
         "CMCCirculatingSupply": "165900.14853",
         "timestamp":"1583128200000"
     },   
]
```