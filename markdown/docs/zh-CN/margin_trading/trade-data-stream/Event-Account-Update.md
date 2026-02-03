# 账户更新

## 事件描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream/Event-Account-Update#%E4%BA%8B%E4%BB%B6%E6%8F%8F%E8%BF%B0 "事件描述的直接链接")

每当帐户余额发生更改时，都会发送一个事件`outboundAccountPosition`，其中包含可能由生成余额变动的事件而变动的资产。

## 事件类型[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream/Event-Account-Update#%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B "事件类型的直接链接")

`outboundAccountPosition`

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade-data-stream/Event-Account-Update#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "e": "outboundAccountPosition", // 事件类型
  "E": 1564034571105,             // 事件时间
  "u": 1564034571073,             // 账户末次更新时间戳
  "B": [                          // 余额
    {
      "a": "ETH",                 // 资产名称
      "f": "10000.000000",        // 可用余额
      "l": "0.000000"             // 冻结余额
    }
  ]
}
```