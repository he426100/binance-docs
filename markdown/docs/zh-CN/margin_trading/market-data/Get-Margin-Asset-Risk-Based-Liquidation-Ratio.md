# 获取杠杆资产风险强制平仓率 (MARKET\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Margin-Asset-Risk-Based-Liquidation-Ratio#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取杠杆资产风险强制平仓率

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Margin-Asset-Risk-Based-Liquidation-Ratio#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/risk-based-liquidation-ratio`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Margin-Asset-Risk-Based-Liquidation-Ratio#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

1

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Margin-Asset-Risk-Based-Liquidation-Ratio#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

None

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/market-data/Get-Margin-Asset-Risk-Based-Liquidation-Ratio#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```json
[
  { "asset": "USDC", "riskBasedLiquidationRatio": "0.01" },
  { "asset": "BUSD", "riskBasedLiquidationRatio": "0.01" }
]
```