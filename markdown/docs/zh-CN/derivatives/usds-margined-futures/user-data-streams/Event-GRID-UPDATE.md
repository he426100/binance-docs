# 网格更新推送

## 事件描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-GRID-UPDATE#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

`GRID_UPDATE` 在网格子订单有部份或是完全成交时更新。

**策略状态**

- NEW
- WORKING
- CANCELLED
- EXPIRED

## 事件类型[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-GRID-UPDATE#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`GRID_UPDATE`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/user-data-streams/Event-GRID-UPDATE#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"e": "GRID_UPDATE", // 事件类型
	"T": 1669262908216, // 撮合时间
	"E": 1669262908218, // 事件时间
	"gu": {
			"si": 176057039, // 策略 ID
			"st": "GRID", // 策略类型
			"ss": "WORKING", // 策略状态
			"s": "BTCUSDT", // 交易对
			"r": "-0.00300716", // 已实现 PNL
			"up": "16720", // 未配对均价
			"uq": "-0.001", // 未配对数量
			"uf": "-0.00300716", // 未配对手续费
			"mp": "0.0", // 已配对 PNL
			"ut": 1669262908197 // 更新时间
		}
}
```