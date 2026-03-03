# 交易对信息信息流

## 数据流描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Multi-Assets-Mode-Asset-Index#%E6%95%B0%E6%8D%AE%E6%B5%81%E6%8F%8F%E8%BF%B0 "数据流描述的直接链接")

Symbol状态更改时推送（上架/下架/bracket调整）; `bks`仅在bracket调整时推出。

## Stream Name[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Multi-Assets-Mode-Asset-Index#stream-name "Stream Name的直接链接")

`!contractInfo`

## 更新速度[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Multi-Assets-Mode-Asset-Index#%E6%9B%B4%E6%96%B0%E9%80%9F%E5%BA%A6 "更新速度的直接链接")

**实时**

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Multi-Assets-Mode-Asset-Index#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "e":"contractInfo",      // 事件类型
    "E":1669356423908,       // 事件时间
    "s":"IOTAUSDT",          // 交易对
    "ps":"IOTAUSDT",         // 交易对标的
    "ct":"PERPETUAL",        // 合约类型
    "dt":4133404800000,      // 结算时间
    "ot":1569398400000,      // 上架时间
    "cs":"TRADING",          // 交易对状态
    "bks":[
        {
            "bs":1,          // 层级
            "bnf":0,         // 该层对应的名义价值下限
            "bnc":5000,      // 该层对应的名义价值上限
            "mmr":0.01,      // 该层对应的维持保证金率
            "cf":0,          // 速算数
            "mi":21,         // 该层杠杆下界
            "ma":50          // 该层杠杆上界
        },
        {
            "bs":2,
            "bnf":5000,
            "bnc":25000,
            "mmr":0.025,
            "cf":75,
            "mi":11,
            "ma":20
        }
    ]
}
```