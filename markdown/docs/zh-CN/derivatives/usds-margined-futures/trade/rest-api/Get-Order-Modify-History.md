# 查询订单修改历史 (USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Order-Modify-History#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询订单修改历史

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Order-Modify-History#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/orderAmendment`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Order-Modify-History#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Order-Modify-History#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称                | 类型     | 是否必需 | 描述                      |
|-------------------|--------|------|-------------------------|
| symbol            | STRING | YES  | 交易对                     |
| orderId           | LONG   | NO   | 系统订单号                   |
| origClientOrderId | STRING | NO   | 用户自定义的订单号               |
| startTime         | LONG   | NO   | 起始时间                    |
| endTime           | LONG   | NO   | 结束时间                    |
| limit             | INT    | NO   | 返回的结果集数量 默认值:50 最大值:100 |
| recvWindow        | LONG   | NO   |                         |
| timestamp         | LONG   | YES  |                         |

> - 至少需要发送 `orderId` 与 `origClientOrderId`中的一个，同时发送则以 `orderId` 为准
> - 接口仅保留最近三个月订单修改历史

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Get-Order-Modify-History#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "amendmentId": 5363,	// 修改记录号
        "symbol": "BTCUSDT",
        "pair": "BTCUSDT",
        "orderId": 20072994037,
        "clientOrderId": "LJ9R4QZDihCaS8UAOOLpgW",
        "time": 1629184560899,	// 修改时间
        "amendment": {
            "price": {
                "before": "30004",
                "after": "30003.2"
            },
            "origQty": {
                "before": "1",
                "after": "1"
            },
            "count": 3	// 修改记数，代表该修改记录是这笔订单第几次修改
        }
    },
    {
        "amendmentId": 5361,
        "symbol": "BTCUSDT",
        "pair": "BTCUSDT",
        "orderId": 20072994037,
        "clientOrderId": "LJ9R4QZDihCaS8UAOOLpgW",
        "time": 1629184533946,
        "amendment": {
            "price": {
                "before": "30005",
                "after": "30004"
            },
            "origQty": {
                "before": "1",
                "after": "1"
            },
            "count": 2
        }
    },
    {
        "amendmentId": 5325,
        "symbol": "BTCUSDT",
        "pair": "BTCUSDT",
        "orderId": 20072994037,
        "clientOrderId": "LJ9R4QZDihCaS8UAOOLpgW",
        "time": 1629182711787,
        "amendment": {
            "price": {
                "before": "30002",
                "after": "30005"
            },
            "origQty": {
                "before": "1",
                "after": "1"
            },
            "count": 1
        }
    }
]
```