# 查询用户API Key权限(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/account/api-key-permission#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询用户API Key权

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/account/api-key-permission#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/account/apiRestrictions`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/account/api-key-permission#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/account/api-key-permission#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/account/api-key-permission#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
   "ipRestrict": false,  // 是否限制ip访问
   "createTime": 1623840271000,   // 创建时间
   "enableReading": true,
   "enableWithdrawals": false,   // 此选项允许通过此api提现。开启提现选项必须添加IP访问限制过滤器
   "enableInternalTransfer": true,  // 此选项授权此密钥在您的母账户和子账户之间划转资金
   "enableMargin": false,   // 此选项在全仓账户完成划转后可编辑
   "enableFutures": false,  // 合约交易权限，需注意开通合约账户之前创建的API Key不支持合约API功能
   "permitsUniversalTransfer": true,  // 授权该密钥可用于专用的万向划转接口，用以操作其支持的多种类型资金划转。各业务自身的划转接口使用权限，不受本授权影响
   "enableVanillaOptions": false,  // 欧式期权交易权限
   "enableFixApiTrade": false,   // FIX API交易权限
   "enableFixReadOnly": true,   // FIX API读取权限
   "enableSpotAndMarginTrading": false, // 现货和杠杆交易权限
   "enablePortfolioMarginTrading":true  //  统一账户交易权限
}
```