# Classic Portfolio Margin Account Information

## 查询经典统一账户账户信息 (USER\_DATA)[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/portfolio-margin-endpoints#%E6%9F%A5%E8%AF%A2%E7%BB%8F%E5%85%B8%E7%BB%9F%E4%B8%80%E8%B4%A6%E6%88%B7%E8%B4%A6%E6%88%B7%E4%BF%A1%E6%81%AF-user_data "查询经典统一账户账户信息 (USER_DATA)的直接链接")

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/portfolio-margin-endpoints#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询经典统一账户当前账户信息

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/portfolio-margin-endpoints#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/pmAccountInfo`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/portfolio-margin-endpoints#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**5**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/portfolio-margin-endpoints#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述 |
|------------|--------|------|----|
| asset      | STRING | YES  |    |
| recvWindow | LONG   | NO   |    |
| timestamp  | LONG   | YES  |    |

> - 最大可转出余额指可以转出到现货钱包到金额。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/portfolio-margin-endpoints#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "maxWithdrawAmountUSD": "1627523.32459208",   //经典统一账户以USD计价的最大可转出余额
    "asset": "BTC",            // 资产
    "maxWithdrawAmount": "27.43689636",        //最大可转出余额
}
```