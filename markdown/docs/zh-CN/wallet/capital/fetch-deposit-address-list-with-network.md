# 查询充值地址列表(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-deposit-address-list-with-network#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

根据网络币种或币种获取充值地址列表

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-deposit-address-list-with-network#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/capital/deposit/address/list`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-deposit-address-list-with-network#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-deposit-address-list-with-network#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称        | 类型     | 是否必需 | 描述               |
|-----------|--------|------|------------------|
| coin      | STRING | YES  | `coin`是网络的地址空间名称 |
| network   | STRING | NO   | 网络               |
| timestamp | LONG   | YES  | 时间戳              |

> - 如果没传网络，会返回网络对应的默认网络。
> - 可以通过后面的接口，来获取网络和 isDefault 字段，在返回的响应里`Get /sapi/v1/capital/config/getall`.

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-deposit-address-list-with-network#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "coin": "ETH",  //这里 coin 实际上指 network 的地址空间, 类 ETH 网络都使用 ETH 的地址
    "address": "0xD316E95Fd9E8E237Cb11f8200Babbc5D8D177BA4",
    "tag":"",
    "isDefault": 0
  }, 
  {
    "coin": "ETH",
    "address": "0xD316E95Fd9E8E237Cb11f8200Babbc5D8D177BA4",
    "tag":"",
    "isDefault": 0
  }, 
  {
    "coin": "ETH",
    "address": "0x00003ada75e7da97ba0db2fcde72131f712455e2",
    "tag":"",
    "isDefault": 1  
  }
]
```