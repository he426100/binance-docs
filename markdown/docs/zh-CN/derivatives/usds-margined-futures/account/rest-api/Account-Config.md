# 账户配置(USER\_DATA)

查询账户配置

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Account-Config#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/accountConfig`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Account-Config#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Account-Config#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Account-Config#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{   
    "feeTier": 0,               // 费率等级
    "canTrade": true,           // 是否可以交易
    "canDeposit": true,         // 是否可以存款
    "canWithdraw": true,        // 是否可以提现
    "dualSidePosition": true,
    "updateTime": 0,            // 忽略
    "multiAssetsMargin": false,
    "tradeGroupId": -1
}
```