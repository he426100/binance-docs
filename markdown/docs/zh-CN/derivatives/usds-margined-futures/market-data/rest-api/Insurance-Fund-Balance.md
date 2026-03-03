# 查询保险基金余额快照

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Insurance-Fund-Balance#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询保险基金余额快照

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Insurance-Fund-Balance#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/insuranceBalance`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Insurance-Fund-Balance#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Insurance-Fund-Balance#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称     | 类型     | 是否必需 | 描述  |
|--------|--------|------|-----|
| symbol | STRING | NO   | 交易对 |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Insurance-Fund-Balance#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

传symbol

```javascript
{
   "symbols":[
      "BNBUSDT",
      "BTCUSDT",
      "BTCUSDT_250627",
      "BTCUSDT_250926",
      "ETHBTC",
      "ETHUSDT",
      "ETHUSDT_250627",
      "ETHUSDT_250926"
   ],
   "assets":[
      {
         "asset":"USDC",
         "marginBalance":"299999998.6497832",
         "updateTime":1745366402000
      },
      {
         "asset":"USDT",
         "marginBalance":"793930579.315848",
         "updateTime":1745366402000
      },
      {
         "asset":"BTC",
         "marginBalance":"61.73143554",
         "updateTime":1745366402000
      },
      {
         "asset":"BNFCR",
         "marginBalance":"633223.99396922",
         "updateTime":1745366402000
      }
   ]
}
```

> 或不传symbol

```javascript
[
   {
      "symbols":[
         "ADAUSDT",
         "BCHUSDT",
         "DOTUSDT",
         "EOSUSDT",
         "ETCUSDT",
         "LINKUSDT",
         "LTCUSDT",
         "TRXUSDT",
         "XLMUSDT",
         "XMRUSDT",
         "XRPUSDT"
      ],
      "assets":[
         {
            "asset":"USDT",
            "marginBalance":"314151411.06482935",
            "updateTime":1745366402000
         }
      ]
   },
   {
      "symbols":[
         "ACTUSDT",
         "MUBARAKUSDT",
         "OMUSDT",
         "TSTUSDT"
      ],
      "assets":[
         {
            "asset":"USDT",
            "marginBalance":"5166686.84431694",
            "updateTime":1745366402000
         }
      ]
   }
]
```