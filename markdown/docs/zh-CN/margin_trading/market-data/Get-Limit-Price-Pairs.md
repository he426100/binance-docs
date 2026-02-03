# 查询出价限定的交易对 (MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Limit-Price-Pairs#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询所有对于高买低卖的限价单施加了价格区间限制的出价限定的交易对。 在杠杆交易中，用户可以设置限价委托单。对于杠杆交易对，限价应在当前指数价格的(-15%, 15%)范围内。此规则仅适用于低于当前指数价格的限价卖出价和高于当前指数价格的限价买入价。

- 买入订单：如果限价高于指数价格的15%，您的委托将被拒绝，并显示错误消息。
- 卖出订单：如果限价低于指数价格的15%，您的委托将被拒绝，并显示错误消息。 请优化修改限价委托策略，并根据交易量和订单簿深度回测和校准计划的限价委托数量规模，以防止交易亏损。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Limit-Price-Pairs#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/limit-price-pairs`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Limit-Price-Pairs#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Limit-Price-Pairs#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

NA

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Limit-Price-Pairs#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
 {  "crossMarginSymbols":  
 	[  "BLURUSDC",  
  	"SANDBTC", 
  	"QKCBTC", 
  	"SEIFDUSD", 
  	"NEOUSDC", 
  	"ARBFDUSD", 
  	"ORDIUSDC" 
 	] 
 }
```