# 账户信息流连接

- 以下文档目前仅支持全仓杠杆账户
- 本篇所列出 API 接口的 base URL : [**https://api.binance.com**](https://api.binance.com)
- 用于订阅账户数据的 `listenKey` 从创建时刻起有效期为60分钟。
- 可以通过 `PUT` 一个 `listenKey` 延长60分钟有效期。
- 可以通过 `DELETE` 一个 `listenKey` 立即关闭当前数据流，并使该 `listenKey` 无效。
- 在具有有效 `listenKey` 的帐户上执行`POST`将返回当前有效的 `listenKey` 并将其有效期延长60分钟。
- 一个`listenKey`就是一个数据流。
- 用户可以侦听/订阅数个数据流。
- websocket 接口的 base URL: **wss://margin-stream.binance.com**
- U订阅账户数据流的 stream 名称为 **/ws/&lt;listenKey&gt;** 或 **/stream?streams=&lt;listenKey&gt;**
- 每个链接有效期不超过24小时，请妥善处理断线重连。