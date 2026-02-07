# 用户万向划转(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-universal-transfer#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

用户万向划转

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-universal-transfer#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/asset/transfer`

您需要开通api key `允许万向划转`权限来调用此接口。

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-universal-transfer#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**900**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-universal-transfer#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型      | 是否必需 | 描述 |
|------------|---------|------|----|
| type       | ENUM    | YES  |    |
| asset      | STRING  | YES  |    |
| amount     | DECIMAL | YES  |    |
| fromSymbol | STRING  | NO   |    |
| toSymbol   | STRING  | NO   |    |
| recvWindow | LONG    | NO   |    |
| timestamp  | LONG    | YES  |    |

- `fromSymbol` 必须要发送，当类型为 ISOLATEDMARGIN\_MARGIN 和 ISOLATEDMARGIN\_ISOLATEDMARGIN
- `toSymbol` 必须要发送，当类型为 MARGIN\_ISOLATEDMARGIN 和 ISOLATEDMARGIN\_ISOLATEDMARGIN
- 目前支持的type划转类型:
  
  - MAIN\_UMFUTURE 现货钱包转向U本位合约钱包
  - MAIN\_CMFUTURE 现货钱包转向币本位合约钱包
  - MAIN\_MARGIN 现货钱包转向杠杆全仓钱包
  - UMFUTURE\_MAIN U本位合约钱包转向现货钱包
  - UMFUTURE\_MARGIN U本位合约钱包转向杠杆全仓钱包
  - CMFUTURE\_MAIN 币本位合约钱包转向现货钱包
  - MARGIN\_MAIN 杠杆全仓钱包转向现货钱包
  - MARGIN\_UMFUTURE 杠杆全仓钱包转向U本位合约钱包
  - MARGIN\_CMFUTURE 杠杆全仓钱包转向币本位合约钱包
  - CMFUTURE\_MARGIN 币本位合约钱包转向杠杆全仓钱包
  - ISOLATEDMARGIN\_MARGIN 杠杆逐仓钱包转向杠杆全仓钱包
  - MARGIN\_ISOLATEDMARGIN 杠杆全仓钱包转向杠杆逐仓钱包
  - ISOLATEDMARGIN\_ISOLATEDMARGIN 杠杆逐仓钱包转向杠杆逐仓钱包
  - MAIN\_FUNDING 现货钱包转向资金钱包
  - FUNDING\_MAIN 资金钱包转向现货钱包
  - FUNDING\_UMFUTURE 资金钱包转向U本位合约钱包
  - UMFUTURE\_FUNDING U本位合约钱包转向资金钱包
  - MARGIN\_FUNDING 杠杆全仓钱包转向资金钱包
  - FUNDING\_MARGIN 资金钱包转向杠杆全仓钱包
  - FUNDING\_CMFUTURE 资金钱包转向币本位合约钱包
  - CMFUTURE\_FUNDING 币本位合约钱包转向资金钱包
  - MAIN\_OPTION 现货钱包转向期权钱包
  - OPTION\_MAIN 期权钱包转向现货钱包
  - UMFUTURE\_OPTION U本位合约钱包转向期权钱包
  - OPTION\_UMFUTURE 期权钱包转向U本位合约钱包
  - MARGIN\_OPTION 杠杆全仓钱包转向期权钱包
  - OPTION\_MARGIN 期权全仓钱包转向杠杆钱包
  - FUNDING\_OPTION 资金钱包转向期权钱包
  - OPTION\_FUNDING 期权钱包转向资金钱包
  - MAIN\_PORTFOLIO\_MARGIN 现货钱包转向统一账户钱包
  - PORTFOLIO\_MARGIN\_MAIN 统一账户钱包转向现货钱包
  - MAIN\_ISOLATED\_MARGIN 现货钱包转向逐仓账户钱包
  - ISOLATED\_MARGIN\_MAIN 逐仓钱包转向现货账户钱包

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/user-universal-transfer#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
    "tranId":13526853623
}
```