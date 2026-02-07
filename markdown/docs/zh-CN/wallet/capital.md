# 获取所有币信息(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/capital#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

获取针对用户的所有(Binance支持充提操作的)币种信息。

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/capital#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/capital/config/getall`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/capital#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/capital#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型   | 是否必需 | 描述 |
|------------|------|------|----|
| recvWindow | LONG | NO   |    |
| timestamp  | LONG | YES  |    |

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/capital#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "coin": "1MBABYDOGE",
        "depositAllEnable": true,
        "withdrawAllEnable": true,
        "name": "1M x BABYDOGE",
        "free": "34941.1",
        "locked": "0",
        "freeze": "0",
        "withdrawing": "0",
        "ipoing": "0",
        "ipoable": "0",
        "storage": "0",
        "isLegalMoney": false,
        "trading": true,
        "networkList": [
            {
                "network": "BSC",
                "coin": "1MBABYDOGE",
                "withdrawIntegerMultiple": "0.01",
                "isDefault": false,
                "depositEnable": true,
                "withdrawEnable": true,
                "depositDesc": "",   // 仅在充值关闭时返回
                "withdrawDesc": "",  // 仅在提现关闭时返回
                "specialTips": "",
                "specialWithdrawTips": "",
                "name": "BNB Smart Chain (BEP20)",
                "resetAddressStatus": false,
                "addressRegex": "^(0x)[0-9A-Fa-f]{40}$",
                "memoRegex": "",
                "withdrawFee": "10",
                "withdrawMin": "20",
                "withdrawMax": "9999999999",
                "withdrawInternalMin": "0.01",  // 内部转账最小提现数
                "depositDust": "0.01",
                "minConfirm": 5,  // 上账所需的最小确认数
                "unLockConfirm": 0,  // 解锁需要的确认数 
                "sameAddress": false, // 过时字段，建议使用withdrawTag
                "withdrawTag": false, // 提现时是否需要memo
                "estimatedArrivalTime": 1,
                "busy": false,
                "contractAddressUrl": "https://bscscan.com/token/",
                "contractAddress": "0xc748673057861a797275cd8a068abb95a902e8de",
                "denomination": 1000000  // 1 1MBABYDOGE = 1000000 BABYDOGE
            },
            {
                "network": "ETH",
                "coin": "1MBABYDOGE",
                "withdrawIntegerMultiple": "0.01",
                "isDefault": true,
                "depositEnable": true,
                "withdrawEnable": true,
                "depositDesc": "",
                "withdrawDesc": "",
                "specialTips": "",
                "specialWithdrawTips": "",
                "name": "Ethereum (ERC20)",
                "resetAddressStatus": false,
                "addressRegex": "^(0x)[0-9A-Fa-f]{40}$",
                "memoRegex": "",
                "withdrawFee": "1511",
                "withdrawMin": "3022",
                "withdrawMax": "9999999999",
                "withdrawInternalMin": "0.01",  
                "depositDust": "0.01",
                "minConfirm": 6,
                "unLockConfirm": 64,
                "sameAddress": false,
                "withdrawTag": false,
                "estimatedArrivalTime": 2,
                "busy": false,
                "contractAddressUrl": "https://etherscan.io/address/",
                "contractAddress": "0xac57de9c1a09fec648e93eb98875b212db0d460b",
                "denomination": 1000000 
            }
        ]
    }
]
```