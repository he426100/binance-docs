# 通过下载Id获取合约资金流水下载链接(USER\_DATA)

## 接口描述[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Futures-Transaction-History-Download-Link-by-Id#%E6%8E%A5%E5%8F%A3%E6%8F%8F%E8%BF%B0 "接口描述的直接链接")

过下载Id获取合约资金流水下载链接

## HTTP请求[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Futures-Transaction-History-Download-Link-by-Id#http%E8%AF%B7%E6%B1%82 "HTTP请求的直接链接")

GET `/fapi/v1/income/asyn/id`

## 请求权重[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Futures-Transaction-History-Download-Link-by-Id#%E8%AF%B7%E6%B1%82%E6%9D%83%E9%87%8D "请求权重的直接链接")

**10**

## 请求参数[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Futures-Transaction-History-Download-Link-by-Id#%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0 "请求参数的直接链接")

| 名称         | 类型     | 是否必需 | 描述          |
|------------|--------|------|-------------|
| downloadId | STRING | YES  | 通过下载id 接口获取 |
| recvWindow | LONG   | NO   |             |
| timestamp  | LONG   | YES  |             |

- 下载链接有效期：24小时。

## 响应示例[​](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/account/rest-api/Get-Futures-Transaction-History-Download-Link-by-Id#%E5%93%8D%E5%BA%94%E7%A4%BA%E4%BE%8B "响应示例的直接链接")

> **响应:**

```javascript
{
	"downloadId":"545923594199212032", // 下载Id
  	"status":"completed",     // 状态，枚举类型：completed 已完成，processing 处理中
  	"url":"www.binance.com",  // 适配该笔ID请求的下载链接       
  	"notified":true,          // 忽略
  	"expirationTimestamp":1645009771000,  // 晚于该时间戳之后链接将自动失效
  	"isExpired":null,
}
```

> **或** (服务器仍在处理中会返回)

```javascript
{
	"downloadId":"545923594199212032",
  	"status":"processing",
  	"url":"", 
  	"notified":false,
  	"expirationTimestamp":-1
  	"isExpired":null,
}
```