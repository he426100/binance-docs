# 大户账户数多空比

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Top-Long-Short-Account-Ratio#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

持仓大户的净持仓多头和空头账户数占比，大户指保证金余额排名前20%的用户。一个账户记一次。 多仓账户数比例 = 持多仓大户数 / 总持仓大户数 空仓账户数比例 = 持空仓大户数 / 总持仓大户数 多空账户数比值 = 多仓账户数比例 / 空仓账户数比例

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Top-Long-Short-Account-Ratio#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/futures/data/topLongShortAccountRatio`

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Top-Long-Short-Account-Ratio#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称        | 类型     | 是否必需 | 描述                                              |
|-----------|--------|------|-------------------------------------------------|
| symbol    | STRING | YES  |                                                 |
| period    | ENUM   | YES  | "5m","15m","30m","1h","2h","4h","6h","12h","1d" |
| limit     | LONG   | NO   | default 30, max 500                             |
| startTime | LONG   | NO   |                                                 |
| endTime   | LONG   | NO   |                                                 |

> - 若无 startime 和 endtime 限制， 则默认返回当前时间往前的limit值
> - 仅支持最近30天的数据
> - IP限频为1000次/5min

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/market-data/rest-api/Top-Long-Short-Account-Ratio#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    { 
         "symbol":"BTCUSDT",
	      "longShortRatio":"1.8105",// 大户多空账户数比值
	      "longAccount": "0.6442", // 大户多仓账户数比例
	      "shortAccount":"0.3558", // 大户空仓账户数比例
	      "timestamp":"1583139600000"
    },
    {
         
         "symbol":"BTCUSDT",
	      "longShortRatio":"1.8233",
	      "longAccount": "0.5338", 
	      "shortAccount":"0.3454", 	                
	      "timestamp":"1583139900000"
	}
]
```