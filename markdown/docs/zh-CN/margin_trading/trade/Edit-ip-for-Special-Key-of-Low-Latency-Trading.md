# 修改可供SpecialKey执行的IP地址(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Edit-ip-for-Special-Key-of-Low-Latency-Trading#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

修改可供低延迟交易的SpecialKey执行的IP地址, 仅适用低延迟交易SpecialKey。

该接口需开通“Enable Spot & Margin Trading”的权限。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Edit-ip-for-Special-Key-of-Low-Latency-Trading#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

PUT `/sapi/v1/margin/apiKey/ip`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Edit-ip-for-Special-Key-of-Low-Latency-Trading#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Edit-ip-for-Special-Key-of-Low-Latency-Trading#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| Name       | Type   | Mandatory | Description                                                         |
|------------|--------|-----------|---------------------------------------------------------------------|
| apiKey     | STRING | YES       |                                                                     |
| symbol     | STRING | NO        | isolated margin pair                                                |
| ip         | STRING | YES       | Can be added in batches, separated by commas. Max 30 for an API key |
| recvWindow | LONG   | NO        | The value cannot be greater than `60000`                            |
| timestamp  | LONG   | YES       |                                                                     |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Edit-ip-for-Special-Key-of-Low-Latency-Trading#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
}
```