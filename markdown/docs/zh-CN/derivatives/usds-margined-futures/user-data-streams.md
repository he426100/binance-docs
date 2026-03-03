# 账户信息流连接

- 本篇所列出REST接口的baseurl [**https://fapi.binance.com**](https://fapi.binance.com)
- 用于订阅账户数据的 `listenKey` 从创建时刻起有效期为60分钟
- 可以通过`PUT`一个`listenKey`延长60分钟有效期，如收到`-1125`报错提示此`listenKey`不存在，建议重新使用`POST /fapi/v1/listenKey`生成`listenKey`
- 可以通过`DELETE`一个 `listenKey` 立即关闭当前数据流，并使该`listenKey` 无效
- 在具有有效`listenKey`的帐户上执行`POST`将返回当前有效的`listenKey`并将其有效期延长60分钟
- 本篇所列出的websocket接口，连接方式如下：
  
  - Base Url: **wss://fstream.binance.com**
  - 订阅账户数据流的stream名称为 **/ws/\`&lt;listenKey&gt;\`**
  - 连接样例：
  - `wss://fstream.binance.com/ws/XaEAKTsQSRLZAGH9tuIu37plSRsdjmlAVBoNYPUITlTAko1WI22PgmBMpI1rS8Yh`
- 每个链接有效期不超过24小时，请妥善处理断线重连。
- 单一账户，单一连接的推送数据流消息可以保证时间序; **强烈建议您使用 E 字段进行排序**
- 考虑到剧烈行情下, RESTful接口可能存在查询延迟，我们强烈建议您优先从Websocket user data stream推送的消息来获取订单，仓位等信息。