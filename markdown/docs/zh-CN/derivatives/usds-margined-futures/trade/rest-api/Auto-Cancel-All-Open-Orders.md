# 倒计时撤销所有订单 (TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Auto-Cancel-All-Open-Orders#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

- 该接口可以被用于确保在倒计时结束时撤销指定symbol上的所有挂单。 在使用这个功能时，接口应像心跳一样在倒计时内被反复调用，以便可以取消既有的倒计时并开始新的倒数计时设置。
- 用法示例： 以30s的间隔重复此接口，每次倒计时countdownTime设置为120000(120s)。  
  如果在120秒内未再次调用此接口，则您指定symbol上的所有挂单都会被自动撤销。  
  如果在120秒内以将countdownTime设置为0，则倒数计时器将终止，自动撤单功能取消。
- 系统会**大约每10毫秒**检查一次所有倒计时情况，因此请注意，使用此功能时应考虑足够的冗余。  
  我们不建议将倒记时设置得太精确或太小。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Auto-Cancel-All-Open-Orders#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/fapi/v1/countdownCancelAll`

**权重:** **10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Auto-Cancel-All-Open-Orders#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称            | 类型     | 是否必需 | 描述                               |
|---------------|--------|------|----------------------------------|
| symbol        | STRING | YES  |                                  |
| countdownTime | LONG   | YES  | 倒计时。 1000 表示 1 秒； 0 表示取消倒计时撤单功能。 |
| recvWindow    | LONG   | NO   |                                  |
| timestamp     | LONG   | YES  |                                  |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/trade/rest-api/Auto-Cancel-All-Open-Orders#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"symbol": "BTCUSDT", 
	"countdownTime": "100000"
}
```