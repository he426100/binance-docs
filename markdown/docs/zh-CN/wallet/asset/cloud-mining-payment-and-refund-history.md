# 云算力历史记录分页查询(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/asset/cloud-mining-payment-and-refund-history#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

云算力支付和退款历史分页查询

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/asset/cloud-mining-payment-and-refund-history#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/asset/ledger-transfer/cloud-mining/queryByPage`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/wallet/asset/cloud-mining-payment-and-refund-history#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**600**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/asset/cloud-mining-payment-and-refund-history#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称           | 类型      | 是否必需 | 描述                |
|--------------|---------|------|-------------------|
| tranId       | LONG    | NO   | 流水号               |
| clientTranId | STRING  | NO   | 外部唯一流水号           |
| asset        | STRING  | NO   | 不传或者空字符串查全部       |
| startTime    | LONG    | YES  | 开始时间（包含），单位：毫秒    |
| endTime      | LONG    | YES  | 结束时间（不包含），单位：毫秒   |
| current      | INTEGER | NO   | 当前页面，默认1，最小值为1    |
| size         | INTEGER | NO   | 页面大小，默认10，最大值为100 |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/asset/cloud-mining-payment-and-refund-history#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "total":5,
  "rows":[
    {"createTime":1667880112000,"tranId":121230610120,"type":248,"asset":"USDT","amount":"25.0068","status":"S"},
    {"createTime":1666776366000,"tranId":119991507468,"type":249,"asset":"USDT","amount":"0.027","status":"S"},
    {"createTime":1666764505000,"tranId":119977966327,"type":248,"asset":"USDT","amount":"0.027","status":"S"},
    {"createTime":1666758189000,"tranId":119973601721,"type":248,"asset":"USDT","amount":"0.018","status":"S"},
    {"createTime":1666757278000,"tranId":119973028551,"type":248,"asset":"USDT","amount":"0.018","status":"S"}
  ]
}
```