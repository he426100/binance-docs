# 杠杆逐仓账户启用 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Enable-Isolated-Margin-Account#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

启用特定交易对的杠杆逐仓账户（仅支持启用之前停用的账户）。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Enable-Isolated-Margin-Account#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/isolated/account`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Enable-Isolated-Margin-Account#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**300(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Enable-Isolated-Margin-Account#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述           |
|------------|--------|------|--------------|
| symbol     | STRING | YES  |              |
| recvWindow | LONG   | NO   | 不能大于 `60000` |
| timestamp  | LONG   | YES  |              |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/account/Enable-Isolated-Margin-Account#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "success": true,
  "symbol": "BTCUSDT"
}
```