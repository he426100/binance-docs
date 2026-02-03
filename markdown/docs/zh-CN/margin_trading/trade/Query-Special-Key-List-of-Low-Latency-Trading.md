# 查询低延迟交易SpecialKey清单(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Special-Key-List-of-Low-Latency-Trading#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询SpecialKey清单，仅适用低延迟交易SpecialKey。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Special-Key-List-of-Low-Latency-Trading#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/api-key-list`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Special-Key-List-of-Low-Latency-Trading#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Special-Key-List-of-Low-Latency-Trading#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| Name       | Type   | Mandatory | Description                              |
|------------|--------|-----------|------------------------------------------|
| symbol     | STRING | NO        | isolated margin pair                     |
| recvWindow | LONG   | NO        | The value cannot be greater than `60000` |
| timestamp  | LONG   | YES       |                                          |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Query-Special-Key-List-of-Low-Latency-Trading#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "apiName": "testName1",
    "apiKey":"znpOzOAeLVgr2TuxWfNo43AaPWpBbJEoKezh1o8mSQb6ryE2odE11A4AoVlJbQoG",
    "ip": "192.168.0.1,192.168.0.2",
    "type": "RSA",
    "permissionMode": "TRADE" 
  },
  {
    "apiName": "testName2",
    "apiKey":"znpOzOAeLVgr2TuxWfNo43AaPWpBbJEoKezh1o8mSQb6ryE2odE11A4AoVlJbQoG",
    "ip": "192.168.0.1,192.168.0.2",
    "type": "Ed25519",
    "permissionMode": "READ" 
  }
]
```