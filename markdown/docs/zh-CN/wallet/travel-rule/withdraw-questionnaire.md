# 提币问卷内容(针对需要旅行规则的本地站)

## 本地站列表[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E6%9C%AC%E5%9C%B0%E7%AB%99%E5%88%97%E8%A1%A8 "本地站列表的直接链接")

- [日本](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E6%97%A5%E6%9C%AC)
- [哈萨克斯坦](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%93%88%E8%90%A8%E5%85%8B%E6%96%AF%E5%9D%A6)
- [新西兰](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E6%96%B0%E8%A5%BF%E5%85%B0)
- [巴林](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%B7%B4%E6%9E%97)
- [阿联酋](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E9%98%BF%E8%81%94%E9%85%8B)
- [印度](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%8D%B0%E5%BA%A6)
- [欧洲(波兰,法国)](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E6%AC%A7%E6%B4%B2%E6%B3%A2%E5%85%B0%E6%B3%95%E5%9B%BD)
- [南非](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%8D%97%E9%9D%9E)

> 如果您不确定使用的问卷内容，请参阅`检查问卷需求`.

## 日本[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E6%97%A5%E6%9C%AC "日本的直接链接")

| 名称             | 类型      | 是否必需    | 描述                                                                 |
|----------------|---------|---------|--------------------------------------------------------------------|
| isAddressOwner | INTEGER | YES     | 1: 发给自己，2:发给其他收款人                                                  |
| bnfType        | INTEGER | YES \*1 | 0:个人账户，1:企业账户                                                      |
| kanjiName      | STRING  | YES \*1 |                                                                    |
| kanaName       | STRING  | YES \*1 |                                                                    |
| latinName      | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                                         |
| country        | STRING  | YES     | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。             |
| city           | STRING  | YES     |                                                                    |
| sendTo         | INTEGER | YES     | 1:虚拟货币服务商，2:私有钱包                                                   |
| vasp           | STRING  | YES \*2 | 收款人的Vasp CODE                                                      |
| vaspCountry    | STRING  | YES \*2 | VASP国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。            |
| vaspRegion     | STRING  | YES \*3 |                                                                    |
| txnPurpose     | INTEGER | YES \*4 | 1:在日本国内购物，2:遗产、赠予或生活费，3:跨境交易, 4:投资，5:支付第三方VASP的服务费用，6:偿还贷款，7:礼物或捐款 |
| isAttested     | BOOLEAN | YES     |                                                                    |

> 1. 当 `isAddressOwner` 是 `2` 时必填。 &gt; 2当 `sendTo` 是 `1` 时必填。 &gt; 3当 `vaspCountry` 是 `cn`(中国) 或 `ua`(乌克兰) 时。 &gt; 1. 如果 `vaspCountry` 是 `cn`(中国)，`vaspRegion` 必须是 `notNortheasternProvinces`(东北三省) 或者 `other`， 即黑龙江，吉林和辽宁。
> 2. 如果 `vaspCountry` 是 `ua`(乌克兰)，`vaspRegion` 不能为 `crimea`(克里米亚)，`donetsk`(顿涅茨克) 或 `luhansk`(卢甘斯克), 可以是 `other`。
> 3. 当 `txnPurpose` 是 `others` 时必填。
> 4. 如果 `txnPurpose` 为 `3`，提款将被拒绝，因为 Binance Japan 禁止用于支付进口和/或中间贸易的交易。
> 5. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 6. `Binance entities`的VASP code是`BINANCE`。

## 哈萨克斯坦[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%93%88%E8%90%A8%E5%85%8B%E6%96%AF%E5%9D%A6 "哈萨克斯坦的直接链接")

| 名称                 | 类型      | 是否必需    | 描述                                                     |
|--------------------|---------|---------|--------------------------------------------------------|
| isAddressOwner     | BOOLEAN | YES     | 收款人是不是自己                                               |
| bnfType            | INTEGER | YES \*1 | 0:个人账户, 1:企业账户                                         |
| beneficiaryName    | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| beneficiaryCountry | STRING  | YES     | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| beneficiaryCity    | STRING  | YES     |                                                        |
| txnPurpose         | STRING  | YES     | 合理值: service, goods, p2p, charity, others              |
| txnPurposeOthers   | STRING  | YES \*6 |                                                        |
| sendTo             | INTEGER | YES     | 2:交易所, 1:私有钱包                                          |
| vasp               | STRING  | YES \*2 | 收款人的VASP Code                                          |
| vaspName           | STRING  | YES \*3 | VASP名                                                  |
| isAttested         | BOOLEAN | YES     |                                                        |

> 1. 当 `isAddressOwner` 是 `false` 时必填。
> 2. 当 `sendTo` 是 `2` 时必填。
> 3. 当 `vasp` 是 `others` 时必填。
> 4. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 5. `Binance entities`的VASP code是`BINANCE`。
> 6. 当 `txnPurpose` 是 `others` 时必填.

## 新西兰[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E6%96%B0%E8%A5%BF%E5%85%B0 "新西兰的直接链接")

| 名称             | 类型      | 是否必需    | 描述                                                     |
|----------------|---------|---------|--------------------------------------------------------|
| isAddressOwner | INTEGER | YES     | 1:提现给自己, 2:提现给其他人                                      |
| bnfType        | INTEGER | YES \*1 | 0:个人账户, 1:企业账户                                         |
| bnfName        | STRING  | YES \*2 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| country        | STRING  | YES \*2 | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| bnfCorpName    | STRING  | YES \*3 | 收款人企业名称.                                               |
| bnfCorpCountry | STRING  | YES \*3 | 收款人企业所在国家, 有关此信息，请参阅`附录`中的`国家和地区`部分。                   |
| sendTo         | INTEGER | YES     | 1:私有钱包, 2:交易所                                          |
| vasp           | STRING  | YES \*4 | 收款人的VASP Code                                          |
| vaspName       | STRING  | YES \*5 | 交易所名称                                                  |
| declaration    | BOOLEAN | YES     |                                                        |

> 1. 当 `isAddressOwner` 是 `2` 时必填。
> 2. 当 `bnfType` 是 `0` 时必填.
> 3. 当 `bnfType` 是 `1` 时必填.
> 4. 当 `sendTo` 是 `2` 时必填.
> 5. 当 `vasp` 是 `others` 时必填.
> 6. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 7. `Binance entities`的 VASP code是`BINANCE`。

## 巴林[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%B7%B4%00%E6%9E%97 "巴林的直接链接")

| 名称             | 类型      | 是否必需    | 描述                                                     |
|----------------|---------|---------|--------------------------------------------------------|
| isAddressOwner | INTEGER | YES     | 1:提现给自己, 2:提现给其他人                                      |
| bnfType        | INTEGER | YES \*1 | 0:个人账户, 1:企业账户                                         |
| bnfFirstName   | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| bnfLastName    | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| country        | STRING  | YES \*1 | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| city           | STRING  | YES \*1 |                                                        |
| sendTo         | INTEGER | YES     | 1:私有钱包, 2:交易所                                          |
| vasp           | STRING  | YES \*2 | 收款人的VASP Code                                          |
| vaspName       | STRING  | YES \*3 | VASP名                                                  |

> 1. 当 `isAddressOwner` 是 `2` 时必填。
> 2. 当 `sendTo` 是 `2` 时必填。
> 3. 当 `vasp` 是 `others` 时必填。
> 4. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 5. `Binance entities`的VASP code是`BINANCE`。

## 阿联酋[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E9%98%BF%E8%81%94%E9%85%8B "阿联酋的直接链接")

| 名称             | 类型      | 是否必需    | 描述                                                     |
|----------------|---------|---------|--------------------------------------------------------|
| isAddressOwner | INTEGER | YES     | 1:提现给自己, 2:提现给其他人                                      |
| bnfType        | INTEGER | YES \*1 | 0:个人账户, 1:企业账户                                         |
| bnfName        | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| country        | STRING  | YES \*1 | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| city           | STRING  | YES \*1 |                                                        |
| sendTo         | INTEGER | YES     | 1:私有钱包, 2:交易所                                          |
| vasp           | STRING  | YES \*2 | 收款人的VASP Code                                          |
| vaspName       | STRING  | YES \*3 | VASP名                                                  |

> 1. 当 `isAddressOwner` 是 `2` 时必填。
> 2. 当 `sendTo` 是 `2` 时必填。
> 3. 当 `vasp` 是 `others` 时必填。
> 4. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 5. `Binance entities`的VASP code是`BINANCE`。

## 印度[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%8D%B0%E5%BA%A6 "印度的直接链接")

| 名称             | 类型      | 是否必需    | 描述                                                     |
|----------------|---------|---------|--------------------------------------------------------|
| isAddressOwner | INTEGER | YES     | 1:提现给自己, 2:提现给其他人                                      |
| bnfType        | INTEGER | YES \*1 | 0:个人账户, 1:企业账户                                         |
| bnfName        | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| country        | STRING  | YES \*1 | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| city           | STRING  | NO      |                                                        |
| sendTo         | INTEGER | YES     | 1:私有钱包, 2:交易所                                          |
| vasp           | STRING  | YES \*2 | 收款人的VASP Code                                          |
| vaspName       | STRING  | YES \*3 | VASP名                                                  |

> 1. 当 `isAddressOwner` 是 `2` 时必填。
> 2. 当 `sendTo` 是 `2` 时必填。
> 3. 当 `vasp` 是 `others` 时必填。
> 4. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 5. `Binance entities`的VASP code是`BINANCE`。

## 欧洲(波兰,法国)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E6%AC%A7%E6%B4%B2%E6%B3%A2%E5%85%B0%E6%B3%95%E5%9B%BD "欧洲(波兰,法国)的直接链接")

| 名称             | 类型      | 是否必需    | 描述                                                     |
|----------------|---------|---------|--------------------------------------------------------|
| isAddressOwner | INTEGER | YES     | 1:提现给自己, 2:提现给其他人                                      |
| bnfType        | INTEGER | YES \*1 | 0:个人账户, 1:企业账户                                         |
| bnfFirstName   | STRING  | YES \*2 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| bnfLastName    | STRING  | YES \*2 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| country        | STRING  | YES \*2 | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| bnfCorpName    | STRING  | YES \*3 | 收款人企业名称.                                               |
| bnfCorpCountry | STRING  | YES \*3 | 收款人企业所在国家, 有关此信息，请参阅`附录`中的`国家和地区`部分。                   |
| sendTo         | INTEGER | YES     | 1:私有钱包, 2:交易所                                          |
| vasp           | STRING  | YES \*4 | 收款人的VASP Code                                          |
| vaspName       | STRING  | YES \*5 | 交易所名称                                                  |
| declaration    | BOOLEAN | YES     |                                                        |

> 1. 当 `isAddressOwner` 是 `2` 时必填。
> 2. 当 `bnfType` 是 `0` 时必填.
> 3. 当 `bnfType` 是 `1` 时必填.
> 4. 当 `sendTo` 是 `2` 时必填.
> 5. 当 `vasp` 是 `others` 时必填.
> 6. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 7. `Binance entities`的 VASP code是`BINANCE`。

## 南非[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/withdraw-questionnaire#%E5%8D%97%E9%9D%9E "南非的直接链接")

| 名称             | 类型      | 是否必需    | 描述                                                     |
|----------------|---------|---------|--------------------------------------------------------|
| isAddressOwner | INTEGER | YES     | 1:提现给自己, 2:提现给其他人                                      |
| bnfType        | INTEGER | YES \*1 | 0:个人账户, 1:企业账户                                         |
| bnfName        | STRING  | YES \*2 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| country        | STRING  | YES \*2 | 收款人国家二位字母代码(ISO-3166)，必须为小写, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| bnfCorpName    | STRING  | YES \*3 | 收款人企业名称.                                               |
| bnfCorpCountry | STRING  | YES \*3 | 收款人企业所在国家, 有关此信息，请参阅`附录`中的`国家和地区`部分。                   |
| sendTo         | INTEGER | YES     | 1:私有钱包, 2:交易所                                          |
| vasp           | STRING  | YES \*4 | 收款人的VASP Code                                          |
| vaspName       | STRING  | YES \*5 | 交易所名称                                                  |
| declaration    | BOOLEAN | YES     |                                                        |

> 1. 当 `isAddressOwner` 是 `2` 时必填。
> 2. 当 `bnfType` 是 `0` 时必填.
> 3. 当 `bnfType` 是 `1` 时必填.
> 4. 当 `sendTo` 是 `2` 时必填.
> 5. 当 `vasp` 是 `others` 时必填.
> 6. 您可以从`Vasp List` API中获取VASP，如果找不到VASP，请在`vasp list`中输入`others`，并在`vaspName`字段中输入VASP的名称。
> 7. `Binance entities`的 VASP code是`BINANCE`。