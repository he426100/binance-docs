# 新建低延迟交易SpecialKey(TRADE)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Create-Special-Key-of-Low-Latency-Trading#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

- 杠杆交易为VIP4及以上的用户提供了低延迟交易接口，这类接口通过特定的[SpecialKey](https://www.binance.com/zh-CN/support/faq/%E5%B8%81%E5%AE%89%E6%9D%A0%E6%9D%86-margin-special-key-%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98-3208663e900d4d2e9fec4140e1832f4e)实现杠杆交易。
- 若您的VIP级别为3及以下，请联系您的VIP经理获取相关SpecialKey的使用许可标准。

**该接口支持以下产品：**

- 全仓杠杆
- 逐仓杠杆
- 统一账户Pro模式
- 全仓杠杆Pro模式（需要签订额外的协议并符合资格标准）

**该接口不支持以下产品：**

- 统一账户普通模式

我们提供以下3类接口：

- Ed25519 (recommended)
- HMAC
- RSA

这3类接口中，我们推荐用户使用**use Ed25519 API keys**，它具有最高的性能和安全系数。

我们接受PKCS#8 (BEGIN PUBLIC KEY). 关于如何生成RSA密钥对发送API请求，请参考 [FAQ](https://www.binance.com/zh-TC/support/faq/%E5%A6%82%E4%BD%95%E5%9C%A8%E5%B9%A3%E5%AE%89%E4%B8%8A%E7%94%9F%E6%88%90-rsa-%E9%87%91%E9%91%B0%E5%B0%8D%E4%B8%A6%E7%99%BC%E9%80%81-api-%E8%AB%8B%E6%B1%82-2b79728f331e43079b27440d9d15c5db) 。

## 如何使用杠杆专用密钥[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Create-Special-Key-of-Low-Latency-Trading#%E5%A6%82%E4%BD%95%E4%BD%BF%E7%94%A8%E6%9D%A0%E6%9D%86%E4%B8%93%E7%94%A8%E5%AF%86%E9%92%A5 "如何使用杠杆专用密钥的直接链接")

- 使用以下 `sapi` 接口创建您的杠杆专用 SpecialKey。
- 关于访问全仓杠杆账户，请勿发送 `symbol` 参数。
- 关于访问逐仓杠杆账户，请在创建 SpecialKey 的请求中传入相关的 `symbol` 参数。
- 使用生成的 SpecialKey（以及对应的 Secret key，如适用）通过 **现货** REST API (`https://api.binance.com/api/v3/*`) 端点执行杠杆交易和 listenKey 生成操作。

关于如何使用其他API，请参考[REST API](https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md#signed-trade-and-user_data-endpoint-security) 或 [WebSocket API](https://github.com/binance/binance-spot-api-docs/blob/master/web-socket-api.md#request-security) 。

您需要为special key开通"允许现货及杠杆交易"权限才能调用此接口。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Create-Special-Key-of-Low-Latency-Trading#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

POST `/sapi/v1/margin/apiKey`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Create-Special-Key-of-Low-Latency-Trading#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**1(UID)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Create-Special-Key-of-Low-Latency-Trading#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

NameTypeMandatoryDescription

apiNameSTRINGYES

symbolSTRINGNOisolated margin pair

ipSTRINGNOCan be added in batches, separated by commas. Max 30 for an API key

publicKeySTRINGNO1. If publicKey is inputted it will create an RSA or Ed25519 key.  
2\. Need to be encoded to URL-encoded format

permissionModeENUMNO该参数只对Ed25519 API密钥有效，若为其他加密方式不需要传递该参数。取值为 TRADE （TRADE表示所有权限） 或 READ（READ表示 USER\_DATA, FIX\_API\_READ\_ONLY）。 默认取值为TRADE。

recvWindowLONGNOThe value cannot be greater than `60000`

timestampLONGYES

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/trade/Create-Special-Key-of-Low-Latency-Trading#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
  "apiKey":"npOzOAeLVgr2TuxWfNo43AaPWpBbJEoKezh1o8mSQb6ryE2odE11A4AoVlJbQoGx",
  "secretKey":"87ssWB7azoy6ACRfyp6OVOL5U3rtZptX31QWw2kWjl1jHEYRbyM1pd6qykRBQw8p", //secretKey will be null when creating an RSA key
  "type": "HMAC_SHA256"   //HMAC_SHA256 or RSA
}
```

**常见错误代码：**

- **UNSUPPORTED\_OPERATION** : 该接口不支持统一账户普通模式，请转换账户类型到支持该接口的产品模式。
- **Forbidden**: 全仓Pro模式需要签订额外的协议，请联系您的VIP经历获得相应支持。