# 查询账户最大可借贷额度(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Max-Borrow#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

查询账户最大可借贷额度

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Max-Borrow#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/sapi/v1/margin/maxBorrowable`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Max-Borrow#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**50(IP)**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Max-Borrow#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称             | 类型     | 是否必需 | 描述              |
|----------------|--------|------|-----------------|
| asset          | STRING | YES  |                 |
| isolatedSymbol | STRING | NO   | 逐仓交易对，适用于逐仓查询   |
| recvWindow     | LONG   | NO   | 默认值不能大于 `60000` |
| timestamp      | LONG   | YES  |                 |

- `borrowLimit` 的值也可以查看 [https://www.binance.com/cn/margin-fee](https://www.binance.com/cn/margin-fee)

## 响应示例[​](https://developers.binance.com/docs/zh-CN/margin_trading/borrow-and-repay/Query-Max-Borrow#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

```javascript
{
	"amount": "1.69248805", // 系统可借充足情况下用户账户当前最大可借额度
	"borrowLimit": "60" // 平台限制的用户当前等级可以借的额度
}
```