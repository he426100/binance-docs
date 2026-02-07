# 提交充值问卷V2(针对需要旅行规则的本地站)(支持多网络)(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-provide-info-v2#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

提交充值问卷(针对需要旅行规则的本地站)。 只有来自私有钱包或尚未接入GTR的交易所的充值交易才需要提交充值问卷。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-provide-info-v2#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

PUT `/sapi/v2/localentity/deposit/provide-info`

## 请求权重(UID)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-provide-info-v2#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Duid "请求权重(UID)的直接链接")

**600**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-provide-info-v2#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称            | 类型     | 是否必需 | 描述          |
|---------------|--------|------|-------------|
| depositId     | LONG   | YES  | 充值记录ID      |
| questionnaire | STRING | YES  | JSON 格式问卷内容 |
| timestamp     | LONG   | YES  |             |

> - 每个本地站点的问卷内容都不一样,请参考`充值问卷内容`页。
> - 如果API返回 `Questionnaire format not valid.` 或 `Questionnaire must not be blank` 错误,请尝检查Questionnaire格式并使用 `URL-encoded format`。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-provide-info-v2#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"trId": 765127651,
 	"accepted": true,
 	"info": "Deposit questionnaire accepted."
}
```