# 关闭站内划转(USER\_DATA)

关闭站内划转

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/account/disable-fast-withdraw-switch#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/account/disableFastWithdrawSwitch`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/account/disable-fast-withdraw-switch#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/account/disable-fast-withdraw-switch#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

- **注意:**
  
  ```text
    此请求会关闭您账户的站内快速划转。您需要为api-key开通"trade"权限才能发送此请求。
  ```

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/account/disable-fast-withdraw-switch#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```text
{}
```