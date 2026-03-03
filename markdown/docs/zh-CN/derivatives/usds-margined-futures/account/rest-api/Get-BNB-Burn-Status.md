# 获取BNB抵扣开关状态(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-BNB-Burn-Status#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询用户 ***所有 symbol*** 合约交易BNB抵扣开关状态(手续费抵扣开或关)

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-BNB-Burn-Status#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/feeBurn`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-BNB-Burn-Status#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**30**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-BNB-Burn-Status#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-BNB-Burn-Status#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"feeBurn": true // "true": 手续费抵扣开; "false": 手续费抵扣关
}
```