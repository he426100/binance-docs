# 市场数据连接

- 本篇所列出的所有wss接口需用下列方式连接：
  
  - Base Url：**wss://fstream.binance.com**
  - 三个分流入口，按数据类型分别接入：
    
    - **Public**（高频公共行情/盘口数据）：`wss://fstream.binance.com/public`
    - **Market**（常规公共市场数据）：`wss://fstream.binance.com/market`
    - **Private**（用户私有数据）：`wss://fstream.binance.com/private`
  - 支持两种访问模式：
    
    - `ws` 模式：通过 URL path 拼接订阅流 — **/ws/&lt;streamName&gt;**
    - `stream` 模式：通过 query 参数传入 — **/stream?streams=&lt;streamName1&gt;/&lt;streamName2&gt;/&lt;streamName3&gt;**
  - 连接样例：
    
    - `wss://fstream.binance.com/market/ws/bnbusdt@aggTrade`
    - `wss://fstream.binance.com/public/ws/bnbusdt@depth/ethusdt@depth`
    - `wss://fstream.binance.com/market/stream?streams=bnbusdt@aggTrade/btcusdt@markPrice`

> **重要提示：** 如果连接 URL 中未指定分流路径（`/public`、`/market` 或 `/private`），则该连接将仅能接收 **Public** 类别的数据。属于 `/market` 或 `/private` 类别的 stream 将不会推送数据。例如，`wss://fstream.binance.com/ws/btcusdt@depth` 仍可正常接收（因为 `@depth` 属于 `/public`），但 `wss://fstream.binance.com/ws/btcusdt@markPrice` 将无法接收（因为 `@markPrice` 属于 `/market`）。各 stream 与入口的完整映射关系及迁移说明，请参考 [WebSocket Base URL 迁移公告](https://developers.binance.com/docs/zh-CN/derivatives/usds-margined-futures/websocket-market-streams/Important-WebSocket-Change-Notice)。

- 订阅组合streams时，事件payload会以这样的格式封装 **{"stream":"&lt;streamName&lt;","data":&lt;rawPayload&gt;}**
- stream名称中所有交易对均为**小写**。
- 每个链接有效期不超过24小时，请妥善处理断线重连。
- 服务端每3分钟会发送ping帧，客户端应当在10分钟内回复pong帧，否则服务端会主动断开链接。允许客户端发送不成对的pong帧(即客户端可以以高于15分钟每次的频率发送pong帧保持链接)。
- Websocket服务器每秒最多接受10个订阅消息。
- 如果用户发送的消息超过限制，连接会被断开连接。反复被断开连接的IP有可能被服务器屏蔽。
- 单个连接最多可以订阅 **1024** 个Streams。