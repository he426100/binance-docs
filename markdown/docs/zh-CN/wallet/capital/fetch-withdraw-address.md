# 查询提现地址簿

## 接口描述[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-withdraw-address#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询提现地址簿

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-withdraw-address#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/capital/withdraw/address/list`

## 请求权重(IP)[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-withdraw-address#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8Dip "请求权重(IP)的直接链接")

**10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-withdraw-address#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

NONE

## 响应示例[​](https://developers.binance.com/docs/zh-CN/wallet/capital/fetch-withdraw-address#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
[
    {
        "address": "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa",
        "addressTag": "",
        "coin": "BTC",
        "name": "Satoshi",        //用户自定义
        "network": "BTC",
        "origin": "bla",      //如果 originType != 'others'，则该值为空，否则 origin 由用户手动填写
        "originType": "others",  //地址来源类型，包括但不限于: 交易所地址类型: Binance, CoinBase, HTX, Bitfinex, OKX, Bithumb, Kraken, Kucoin, Gemini, Bitget, Bybit, Upbit, Gate.io; 个人钱包类型: Binance Web3 Wallet, Trust Wallet, MetaMask, Rabby Wallet, Phantom, OKX Web 3 Wallet, Coinbase Wallet, Bitget Wallet; 其他 Others 类型: others(支持多语言)
        "whiteStatus": true      //是否是白名单
    }
]
```