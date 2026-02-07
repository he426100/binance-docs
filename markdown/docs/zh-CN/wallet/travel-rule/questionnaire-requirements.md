# 检查问卷需求(针对需要旅行规则的本地站)(支持多网络)(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/questionnaire-requirements#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

基于当前的用户的API key，接口讲返回针对改用户提交问卷所需的信息。

## HTTP 请求[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/questionnaire-requirements#http-%E8%AF%B7%E6%B1%82 "HTTP 请求的直接链接")

GET `/sapi/v1/localentity/questionnaire-requirements`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/questionnaire-requirements#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**1**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/questionnaire-requirements#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必须 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/questionnaire-requirements#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript

{
    "questionnaireCountryCode":"AE"
}

```