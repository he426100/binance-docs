# 充值问卷内容(针对需要旅行规则的本地站)

## 本地站列表[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E6%9C%AC%E5%9C%B0%E7%AB%99%E5%88%97%E8%A1%A8 "本地站列表的直接链接")

- [日本](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E6%97%A5%E6%9C%AC)
- [哈萨克斯坦](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%93%88%E8%90%A8%E5%85%8B%E6%96%AF%E5%9D%A6)
- [巴林](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%B7%B4%E6%9E%97)
- [阿联酋](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E9%98%BF%E8%81%94%E9%85%8B)
- [印度](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%8D%B0%E5%BA%A6)
- [欧洲(波兰,法国)](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E6%AC%A7%E6%B4%B2%E6%B3%A2%E5%85%B0%E6%B3%95%E5%9B%BD)
- [南非](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%8D%97%E9%9D%9E)

## 日本[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E6%97%A5%E6%9C%AC "日本的直接链接")

| 名称                | 类型      | 是否必须    | 描述                                                     |
|-------------------|---------|---------|--------------------------------------------------------|
| depositOriginator | INTEGER | YES     | 0:发款人自己, 1:发款人不是自己                                     |
| bnfType           | INTEGER | YES     | 0:个人账号, 1:企业账号                                         |
| country           | STRING  | YES \*1 | 发款人国家二位字母代码(ISO-3166)，必须为小写. 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| region            | STRING  | YES \*2 | 发款人所在地区.                                               |
| city              | STRING  | YES \*1 | 发款人所在城市                                                |
| kanjiName         | STRING  | YES \*1 |                                                        |
| kanaName          | STRING  | YES \*1 |                                                        |
| latinName         | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| vaspName          | STRING  | YES     |                                                        |
| isAttested        | BOOLEAN | YES     |                                                        |

> 1. 当 `depositOriginator` 是 `1` 时必填。
> 2. 当 `country` 是 `cn`(中国) 或 `ua`(乌克兰) 时。
>    
>    1. 如果 `country` 是 `cn`(中国)，`region` 需要为 `isNortheasternProvinces`(东北三省)，即黑龙江，吉林和辽宁，或者 `other`。
>    2. 如果 `country` 是 `ua`(乌克兰)，`region` 不能为 `crimea`(克里米亚)，`donetsk`(顿涅茨克) 或 `luhansk`(卢甘斯克), 可以为 `other`。

## 哈萨克斯坦[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%93%88%E8%90%A8%E5%85%8B%E6%96%AF%E5%9D%A6 "哈萨克斯坦的直接链接")

| 名称               | 类型     | 是否必须    | 描述                                                     |
|------------------|--------|---------|--------------------------------------------------------|
| originatorName   | STRING | YES     | 发款人姓名                                                  |
| country          | STRING | YES     | 发款人国家二位字母代码(ISO-3166)，必须为小写. 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| city             | STRING | YES     | 发款人所在城市                                                |
| txnPurpose       | STRING | YES     | 合理值: service, goods, p2p, charity, others              |
| txnPurposeOthers | STRING | YES \*1 |                                                        |

> 1. 当 `txnPurpose` 是 `others` 时必填.

## 巴林[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%B7%B4%E6%9E%97 "巴林的直接链接")

| 名称                | 类型      | 是否必须    | 描述                                                      |
|-------------------|---------|---------|---------------------------------------------------------|
| depositOriginator | INTEGER | YES     | 1:发款人是自己, 2:发款人不是自己                                     |
| orgType           | INTEGER | YES \*1 | 0:个人账号, 1:企业账号                                          |
| orgFirstName      | STRING  | YES \*1 | 发款人名, 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                        |
| orgLastName       | STRING  | YES \*1 | 发款人姓, 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                        |
| country           | STRING  | YES \*1 | 发款人居住国二位字母代码(ISO-3166)，必须为小写. 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| city              | STRING  | YES \*1 |                                                         |
| receiveFrom       | INTEGER | YES     | 1:私有钱包, 2:其他交易所                                         |
| vasp              | STRING  | YES \*2 | 发款人的VASP code                                           |
| vaspName          | STRING  | YES \*3 | VASP名                                                   |

> 1. 当 `depositOriginator` 是 `2` 时必填。
> 2. 当 `receiveFrom` 是 `2` 时必填。
> 3. 当 `vasp` 是 `others` 时必填。
> 4. 如果`vasp`不在`预先加载VASP列表`中, `vasp`字段请填`others`, `vaspName`字段请填交易所的名字。
> 5. `Binance entities`的VASP code是`BINANCE`。

## 阿联酋[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E9%98%BF%E8%81%94%E9%85%8B "阿联酋的直接链接")

| 名称                | 类型      | 是否必须    | 描述                                                     |
|-------------------|---------|---------|--------------------------------------------------------|
| depositOriginator | INTEGER | YES     | 1:发款人是自己, 2:发款人不是自己                                    |
| orgType           | INTEGER | YES \*1 | 0:个人账号, 1:企业账号                                         |
| orgName           | STRING  | YES \*1 | 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                             |
| country           | STRING  | YES \*1 | 发款人国籍二位字母代码(ISO-3166)，必须为小写. 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| city              | STRING  | YES \*1 |                                                        |
| receiveFrom       | INTEGER | YES     | 1:私有钱包, 2:其他交易所                                        |
| vasp              | STRING  | YES \*2 | 收款人的VASP code                                          |
| vaspName          | STRING  | YES \*3 | VASP名                                                  |

> 1. 当 `depositOriginator` 是 `2` 时必填。
> 2. 当 `receiveFrom` 是 `2` 时必填。
> 3. 当 `vasp` 是 `others` 时必填。
> 4. 如果`vasp`不在`预先加载VASP列表`中, `vasp`字段请填`others`, `vaspName`字段请填交易所的名字。
> 5. `Binance entities`的VASP code是`BINANCE`。

## 印度[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%8D%B0%E5%BA%A6 "印度的直接链接")

| 名称                | 类型      | 是否必须    | 描述                                                     |
|-------------------|---------|---------|--------------------------------------------------------|
| depositOriginator | INTEGER | YES     | 1:发款人是自己, 2:发款人不是自己                                    |
| orgType           | INTEGER | YES \*1 | 0:个人账号, 1:企业账号                                         |
| orgName           | STRING  | YES \*1 | 发款人姓名, 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。                      |
| pan               | STRING  | YES \*1 | 永久账号（PAN）或国民身份证号码                                      |
| country           | STRING  | YES \*1 | 发款人国籍二位字母代码(ISO-3166)，必须为小写. 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| state             | STRING  | YES \*1 | 发款人所在州                                                 |
| city              | STRING  | YES \*1 | 发款人所在 城市/城镇/村庄                                         |
| pinCode           | STRING  | YES \*1 |                                                        |
| address           | STRING  | YES \*1 |                                                        |
| receiveFrom       | INTEGER | YES     | 1:私有钱包, 2:其他交易所                                        |
| vasp              | STRING  | YES \*2 | 收款人的VASP code                                          |
| vaspName          | STRING  | YES \*3 | VASP名                                                  |

> 1. 当 `depositOriginator` 是 `2`时必填.
> 2. 当 `receiveFrom` 是 `2`时必填.
> 3. 当 `vasp` 是 `others` 时必填。
> 4. 如果`vasp`不在`预先加载VASP列表`中, `vasp`字段请填`others`, `vaspName`字段请填交易所的名字。
> 5. `Binance entities`的VASP code是`BINANCE`。

## 欧洲(波兰,法国)[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E6%AC%A7%E6%B4%B2%E6%B3%A2%E5%85%B0%E6%B3%95%E5%9B%BD "欧洲(波兰,法国)的直接链接")

| 名称                | 类型      | 是否必须    | 描述                               |
|-------------------|---------|---------|----------------------------------|
| depositOriginator | INTEGER | YES     | 1:发款人是自己, 2:发款人不是自己              |
| orgType           | INTEGER | YES \*1 | 0:个人账号, 1:企业账号                   |
| orgFirstName      | STRING  | YES \*2 | 发款人名, 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。 |
| orgLastName       | STRING  | YES \*2 | 发款人姓, 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。 |
| country           | STRING  | YES \*2 | 发款人国家, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| corpName          | STRING  | YES \*3 | 发款企业姓名                           |
| corpCountry       | STRING  | YES \*3 | 发款企业所在国家                         |
| receiveFrom       | INTEGER | YES     | 1:私有钱包, 2:其他交易所                  |
| vasp              | STRING  | YES \*4 | 交易所编码                            |
| vaspName          | STRING  | YES \*5 | 交易所名称                            |
| declaration       | BOOLEAN | YES     |                                  |

> 1. 当 `depositOriginator` 是 `2` 时必填.
> 2. 当 `receiveFrom` is `2` 时必填.
> 3. 当 `orgType` is `0` 时必填.
> 4. 当 `orgType` is `1` 时必填.
> 5. 如果 `vasp` 不是 `Binance`, 请在 `vasp` 中填写 `others` 并在 `vaspName` 中填写交易所名称.

## 南非[​](https://developers.binance.com/docs/zh-CN/wallet/travel-rule/deposit-questionnaire#%E5%8D%97%E9%9D%9E "南非的直接链接")

| 名称                | 类型      | 是否必须    | 描述                                  |
|-------------------|---------|---------|-------------------------------------|
| depositOriginator | INTEGER | YES     | 1:发款人是自己, 2:发款人不是自己                 |
| orgType           | INTEGER | YES \*1 | 0:个人账号, 1:企业账号                      |
| orgName           | STRING  | YES \*2 | 发款人姓名, 姓名的相关信息，请参阅`附录`中的`姓名限制`部分。   |
| country           | STRING  | YES \*2 | 发款人国家, 有关此信息，请参阅`附录`中的`国家和地区`部分。    |
| corpName          | STRING  | YES \*3 | 发款企业姓名                              |
| corpCountry       | STRING  | YES \*3 | 发款企业所在国家, 有关此信息，请参阅`附录`中的`国家和地区`部分。 |
| receiveFrom       | INTEGER | YES     | 1:私有钱包, 2:其他交易所                     |
| vasp              | STRING  | YES \*4 | 交易所编码                               |
| vaspName          | STRING  | YES \*5 | 交易所名称                               |
| declaration       | BOOLEAN | YES     |                                     |

> 1. 当 `depositOriginator` 是 `2` 时必填.
> 2. 当 `receiveFrom` is `2` 时必填.
> 3. 当 `orgType` is `0` 时必填.
> 4. 当 `orgType` is `1` 时必填.
> 5. 如果 `vasp` 不是 `Binance`, 请在 `vasp` 中填写 `others` 并在 `vaspName` 中填写交易所名称.