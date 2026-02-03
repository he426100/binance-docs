# 杠杆手动强平(MARGIN)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Manual-Liquidation#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

杠杆手动强平

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Manual-Liquidation#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST /sapi/v1/margin/manual-liquidation

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Manual-Liquidation#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**3000**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Manual-Liquidation#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述                               |
|------------|--------|------|----------------------------------|
| type       | STRING | YES  | `MARGIN`,`ISOLATED`              |
| symbol     | STRING | NO   | `type`选择`ISOLATED`后，`symbol`需要填入 |
| recvWindow | LONG   | NO   |                                  |
| timestamp  | LONG   | YES  |                                  |

备注:

- 该接口支持全仓经典模式和专业模式。
- 逐仓仅支持受限区域。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Margin-Manual-Liquidation#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "asset": "ETH",
  "interest": "0.00083334",
  "principal": "0.001",
  "liabilityAsset": "USDT",
  "liabilityQty": 0.3552
}
```