# 查询可交易币对信息

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/List-all-convert-pairs#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询可交易的币对的信息，以及它们分别所支持交易金额的上下限。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/List-all-convert-pairs#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/convert/exchangeInfo`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/List-all-convert-pairs#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**20(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/List-all-convert-pairs#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称        | 类型     | 是否必需           | 描述     |
|-----------|--------|----------------|--------|
| fromAsset | STRING | EITHER OR BOTH | 用户售出币种 |
| toAsset   | STRING | EITHER OR BOTH | 用户买入币种 |

> - 用户应当fromAsset和toAsset参数至少填一个。
> - 如果fromAsset和toAsset只填写了一个参数，将会返回部分币对信息。
> - BNFCR资产仅对MICA地区用户有效

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/convert/List-all-convert-pairs#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
  {
    "fromAsset":"BTC",
    "toAsset":"USDT",
    "fromAssetMinAmount":"0.0004",
    "fromAssetMaxAmount":"50",
    "toAssetMinAmount":"20",
    "toAssetMaxAmount":"2500000"
  }
]
```