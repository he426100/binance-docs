# 币安杠杆交易 API 文档 - AI 上下文

> **项目**: 币安杠杆交易 API 接口分析
> **文档路径**: `/data/downloads/wallet/binance-margin_trading-api-docs/markdown/docs/zh-CN`
> **最后更新**: 2026-02-07

## 📋 项目概述

本文档分析币安杠杆交易 API 的接口依赖关系，帮助 AI 助手快速理解实现杠杆交易所需的接口清单和调用顺序。

**核心模块**:
- `wallet` - 钱包模块（资产管理、充提币、账户信息）
- `margin_trading` - 杠杆交易模块（账户、交易、借贷、市场数据）

## 🎯 杠杆交易类型

### 全仓杠杆 (Cross Margin)
- **特点**: 所有资产共享一个保证金池，风险共担
- **杠杆倍数**: 3x (Classic) / 5x (Classic) / 10x (Pro) / 20x (Pro)
- **风险率**: 全账户统一计算
- **适用场景**: 资金利用率高，适合多币种交易

### 逐仓杠杆 (Isolated Margin)
- **特点**: 每个交易对独立保证金，风险隔离
- **杠杆倍数**: 根据交易对不同（通常 3x-10x）
- **风险率**: 按交易对独立计算
- **适用场景**: 风险可控，适合单一交易对操作

## 🔑 全仓杠杆交易必需接口清单

### 阶段 1: 准备阶段（资金准备）

#### 1.1 查询现货余额
```
POST /sapi/v3/asset/getUserAsset
模块: wallet/asset
权重: 5 (IP)
用途: 确认现货账户有足够资金
注意: 接口为 POST 方法，路径为 v3 版本
```

#### 1.2 划转到全仓杠杆账户
```
POST /sapi/v1/asset/transfer
模块: wallet/asset
权重: 900 (UID)
必需参数: type, asset, amount, timestamp
条件必需参数:
  - fromSymbol: 当 type 为 ISOLATEDMARGIN_MARGIN 或 ISOLATEDMARGIN_ISOLATEDMARGIN 时必需
  - toSymbol: 当 type 为 MARGIN_ISOLATEDMARGIN 或 ISOLATEDMARGIN_ISOLATEDMARGIN 时必需
可选参数: recvWindow
用途: 将现货资金转入全仓杠杆账户
前置条件: API Key 需开通"允许万向划转"权限
```

### 阶段 2: 账户查询（可选但推荐）

#### 2.1 查询全仓账户详情
```
GET /sapi/v1/margin/account
模块: margin_trading/account
权重: 10 (IP)
用途: 查看账户余额、风险率、可用资产
关键返回字段:
  - marginLevel (风险率)
  - borrowEnabled, tradeEnabled (账户开关)
  - accountType (MARGIN_1=Classic, MARGIN_2=Pro)
  - collateralMarginLevel (抵押保证金率)
  - totalAssetOfBtc, totalLiabilityOfBtc (总资产/负债)
  - userAssets[] (各资产详情: free, locked, borrowed, interest)
```

#### 2.2 查询支持的杠杆资产
```
GET /sapi/v1/margin/allAssets
模块: margin_trading/market-data
权重: 1 (IP)
用途: 确认资产是否支持杠杆交易
关键字段: isBorrowable、isCollateral
```

#### 2.3 查询支持的交易对
```
GET /sapi/v1/margin/allPairs
模块: margin_trading/market-data
权重: 1 (IP)
用途: 确认交易对是否支持全仓杠杆
关键字段: isMarginTrade、isBuyAllowed、isSellAllowed
```

### 阶段 3: 借币（如需杠杆）

#### 3.1 查询最大可借额度
```
GET /sapi/v1/margin/maxBorrowable
模块: margin_trading/borrow-and-repay
权重: 50 (IP)
参数: asset, isolatedSymbol (可选)
用途: 确认可借额度，避免借币失败
```

#### 3.2 执行借币
```
POST /sapi/v1/margin/borrow-repay
模块: margin_trading/borrow-and-repay
权重: 1500 (UID)
必需参数: asset, isIsolated, amount, type, timestamp
条件必需参数: symbol (当 isIsolated=TRUE 时必需)
可选参数: recvWindow
用途: 借入资产用于杠杆交易
注意:
  - 开始计息，需定期还款
  - 同一资产不能并发借还操作
  - 建议操作间隔 >100ms
```

### 阶段 4: 交易执行（核心）

#### 4.1 创建杠杆订单
```
POST /sapi/v1/margin/order
模块: margin_trading/trade
权重: 6 (UID)
必需参数: symbol, side, type, timestamp
条件必需参数:
  - quantity 或 quoteOrderQty (二选一)
  - price (限价单必需)
  - stopPrice (止损/止盈单必需)
可选参数:
  - isIsolated (默认 FALSE)
  - sideEffectType (默认 NO_SIDE_EFFECT)
  - timeInForce (GTC/IOC/FOK)
  - newOrderRespType (ACK/RESULT/FULL，默认 FULL)
  - icebergQty (冰山订单数量)
  - selfTradePreventionMode (自成交防止模式)
  - autoRepayAtCancel (撤单后是否自动还款，默认 true)
  - newClientOrderId (客户自定义订单ID)
  - recvWindow
返回字段 (newOrderRespType=FULL 时):
  - marginBuyBorrowAmount, marginBuyBorrowAsset (仅在实际发生借款时返回)
用途: 执行杠杆交易
```

**sideEffectType 详细说明**:

1. **NO_SIDE_EFFECT（普通模式，默认）**
   - 直接使用杠杆账户内的现有资产下单
   - 不自动借款或还款
   - 需要手动调用借贷接口或确保账户余额充足
   - 适用场景：已手动借币或账户有足够余额

2. **MARGIN_BUY（自动借款模式）**
   - 根据最大杠杆倍数，自动借入资产下单
   - 相当于"借款 + 下单"
   - **关键**：下单成功即完成借款，借款与订单成交无关
   - 买单：报价资产不足时自动借入报价资产
   - 卖单：基础资产不足时自动借入基础资产
   - 返回参数包含 `marginBuyBorrowAmount` 和 `marginBuyBorrowAsset`
   - 适用场景：想要一步完成借款和下单

3. **AUTO_REPAY（自动还款模式）**
   - 订单成交后，自动使用收到的资产偿还该资产的负债
   - 相当于"下单 + 订单成交 + 还款"
   - 遵循"先还利息再还本金"原则
   - 仅对借入资产生效
   - **限制**：不适用于 `/sapi/v1/margin/order/otoco` 和 `/sapi/v1/margin/order/oto` 接口
   - 适用场景：平仓后立即还款

4. **AUTO_BORROW_REPAY（同时自动借款和还款）**
   - 结合 MARGIN_BUY 和 AUTO_REPAY 两种模式
   - 相当于"借款 + 下单 + 订单成交 + 还款"
   - 实现"保证金翻转"效果
   - **限制**：不适用于 `/sapi/v1/margin/order/otoco` 和 `/sapi/v1/margin/order/oto` 接口
   - 适用场景：复杂的多腿交易策略

**使用建议**:
- 初学者建议使用 `NO_SIDE_EFFECT`，手动控制借还款
- 简单买入可使用 `MARGIN_BUY` 简化流程
- 平仓时使用 `AUTO_REPAY` 自动还款
- 执行后务必查询账户状态，确认借贷情况

#### 4.2 查询订单状态
```
GET /sapi/v1/margin/order
模块: margin_trading/trade
权重: 2 (IP)
参数: symbol, orderId 或 origClientOrderId
用途: 确认订单执行情况
```

#### 4.3 查询成交记录
```
GET /sapi/v1/margin/myTrades
模块: margin_trading/trade
权重: 10 (IP)
参数: symbol, startTime, endTime
用途: 查看交易历史和成交价格
```

### 阶段 5: 还币（如有借款）

#### 5.1 查询借贷记录
```
GET /sapi/v1/margin/borrow-repay
模块: margin_trading/borrow-and-repay
权重: 10 (IP)
参数: type=BORROW, asset
可选参数: isolatedSymbol, startTime, endTime
用途: 查看当前借款和利息
时间范围限制:
  - 传 asset: 最大 30 天
  - 不传 asset: 最大 7 天
  - 默认返回最近 7 天
```

#### 5.2 执行还币
```
POST /sapi/v1/margin/borrow-repay
模块: margin_trading/borrow-and-repay
权重: 1500 (UID)
必需参数: asset, isIsolated, amount, type, timestamp
条件必需参数: symbol (当 isIsolated=TRUE 时必需)
可选参数: recvWindow
用途: 归还借款和利息
注意: 遵循"先还利息再还本金"原则
```

### 阶段 6: 资金转出

#### 6.1 查询最大可转出额度
```
GET /sapi/v1/margin/maxTransferable
模块: margin_trading/transfer
权重: 50 (IP)
参数: asset, isolatedSymbol (可选)
用途: 确认可转出金额，避免影响风险率
```

#### 6.2 划转回现货账户
```
POST /sapi/v1/asset/transfer
模块: wallet/asset
权重: 900 (UID)
参数: type=MARGIN_MAIN, asset, amount
用途: 将资金转回现货账户
```

## 🔑 逐仓杠杆交易必需接口清单

### 阶段 1: 准备阶段

#### 1.1 查询现货余额
```
POST /sapi/v3/asset/getUserAsset
模块: wallet/asset
权重: 5 (IP)
用途: 确认现货账户有足够资金
注意: 接口为 POST 方法，路径为 v3 版本
```

#### 1.2 划转到逐仓账户（自动激活）
```
POST /sapi/v1/asset/transfer
模块: wallet/asset
权重: 900 (UID)
必需参数: type, asset, amount, timestamp
条件必需参数: toSymbol (交易对，逐仓转入时必需)
可选参数: fromSymbol, recvWindow
用途: 将资金转入指定交易对的逐仓账户
注意: 首次转入会自动激活该交易对的逐仓账户
```

#### 1.3 启用逐仓账户（仅在账户被停用时需要）
```
POST /sapi/v1/margin/isolated/account
模块: margin_trading/account
权重: 300 (UID)
参数: symbol (如 BTCUSDT)
用途: 重新启用之前停用的逐仓账户
注意: 仅支持启用之前停用的账户，首次使用不需要此步骤
```

### 阶段 2: 账户查询

#### 2.1 查询逐仓账户信息
```
GET /sapi/v1/margin/isolated/account
模块: margin_trading/account
权重: 10 (IP)
参数: symbols (可选，最多5个交易对)
用途: 查看逐仓账户余额、风险率
关键返回字段:
  - assets[] (各交易对账户信息)
  - marginLevel (风险率)
  - marginLevelStatus (EXCESSIVE/NORMAL/MARGIN_CALL/PRE_LIQUIDATION/FORCE_LIQUIDATION)
  - marginRatio (保证金率)
  - indexPrice (指数价格)
  - liquidatePrice (强平价格)
  - enabled, tradeEnabled (账户开关)
```

#### 2.2 查询支持的逐仓交易对
```
GET /sapi/v1/margin/isolated/allPairs
模块: margin_trading/market-data
权重: 1 (IP)
用途: 确认交易对是否支持逐仓杠杆
```

### 阶段 3: 借币

#### 3.1 查询最大可借额度
```
GET /sapi/v1/margin/maxBorrowable
模块: margin_trading/borrow-and-repay
权重: 50 (IP)
参数: asset, isolatedSymbol (必需)
用途: 确认该交易对的可借额度
```

#### 3.2 执行借币
```
POST /sapi/v1/margin/borrow-repay
模块: margin_trading/borrow-and-repay
权重: 1500 (UID)
参数: asset, isIsolated=TRUE, symbol (交易对), amount, type=BORROW
用途: 在指定交易对借入资产
```

### 阶段 4: 交易执行

#### 4.1 创建逐仓订单
```
POST /sapi/v1/margin/order
模块: margin_trading/trade
权重: 6 (UID)
参数: symbol, side, type, quantity, price, isIsolated=TRUE
可选参数: sideEffectType
用途: 在逐仓账户执行交易
```

#### 4.2 查询订单状态
```
GET /sapi/v1/margin/order
模块: margin_trading/trade
权重: 2 (IP)
参数: symbol, orderId, isIsolated=TRUE
用途: 确认订单执行情况
```

### 阶段 5: 还币

#### 5.1 查询借贷记录
```
GET /sapi/v1/margin/borrow-repay
模块: margin_trading/borrow-and-repay
权重: 10 (IP)
参数: type=BORROW, asset, isolatedSymbol
用途: 查看该交易对的借款情况
```

#### 5.2 执行还币
```
POST /sapi/v1/margin/borrow-repay
模块: margin_trading/borrow-and-repay
权重: 1500 (UID)
参数: asset, isIsolated=TRUE, symbol, amount, type=REPAY
用途: 归还该交易对的借款
```

### 阶段 6: 资金转出

#### 6.1 查询最大可转出额度
```
GET /sapi/v1/margin/maxTransferable
模块: margin_trading/transfer
权重: 50 (IP)
参数: asset, isolatedSymbol (必需)
用途: 确认该交易对的可转出金额
```

#### 6.2 划转回现货账户
```
POST /sapi/v1/asset/transfer
模块: wallet/asset
权重: 900 (UID)
必需参数: type, asset, amount, timestamp
条件必需参数: fromSymbol (交易对，逐仓转出时必需)
可选参数: recvWindow
用途: 将资金从逐仓转回现货账户
```

## 📊 接口依赖关系图

```mermaid
graph TD
    A[现货账户] -->|万向划转| B[全仓杠杆账户]
    A -->|万向划转| C[逐仓杠杆账户]

    B -->|查询账户| D[账户详情]
    C -->|查询账户| E[逐仓账户信息]

    D -->|借币| F[借贷操作]
    E -->|借币| G[逐仓借贷]

    F -->|交易| H[全仓订单]
    G -->|交易| I[逐仓订单]

    H -->|还币| J[还款操作]
    I -->|还币| K[逐仓还款]

    J -->|划转| A
    K -->|划转| A

    style A fill:#e1f5ff
    style B fill:#fff4e1
    style C fill:#ffe1f5
    style H fill:#e1ffe1
    style I fill:#e1ffe1
```

## 🔗 模块间依赖关系

### wallet → margin_trading
- **资金流入**: `wallet/asset` 的万向划转接口是杠杆交易的资金入口
- **必需参数**:
  - 全仓: `type=MAIN_MARGIN`
  - 逐仓: `type=MAIN_ISOLATED_MARGIN` + `toSymbol`

### margin_trading/account → margin_trading/trade
- **前置条件**:
  - 全仓: 账户需有足够余额或可借额度
  - 逐仓: 需先启用对应交易对的逐仓账户
- **数据流**: 账户余额 → 订单可用额度

### margin_trading/borrow-and-repay → margin_trading/trade
- **借币场景**:
  - 手动借币: 先调用借币接口，再下单
  - 自动借币: 下单时设置 `sideEffectType=MARGIN_BUY`
- **还币场景**:
  - 手动还币: 交易后调用还币接口
  - 自动还币: 下单时设置 `sideEffectType=AUTO_REPAY`

### margin_trading/market-data → 所有模块
- **作用**: 提供交易对配置、资产信息、利率数据
- **调用时机**: 交易前查询，确保资产和交易对可用

## 📝 调用顺序建议

### 全仓杠杆交易完整流程

```
1. [可选] GET /sapi/v1/margin/allAssets - 查询支持的资产
2. [可选] GET /sapi/v1/margin/allPairs - 查询支持的交易对
3. POST /sapi/v3/asset/getUserAsset - 查询现货余额
4. POST /sapi/v1/asset/transfer (MAIN_MARGIN) - 划转到全仓
5. GET /sapi/v1/margin/account - 查询全仓账户
6. [如需借币] GET /sapi/v1/margin/maxBorrowable - 查询可借额度
7. [如需借币] POST /sapi/v1/margin/borrow-repay (BORROW) - 借币
8. POST /sapi/v1/margin/order - 创建订单
9. GET /sapi/v1/margin/order - 查询订单状态
10. [如有借款] POST /sapi/v1/margin/borrow-repay (REPAY) - 还币
11. GET /sapi/v1/margin/maxTransferable - 查询可转出额度
12. POST /sapi/v1/asset/transfer (MARGIN_MAIN) - 划转回现货
```

### 逐仓杠杆交易完整流程

```
1. [可选] GET /sapi/v1/margin/isolated/allPairs - 查询支持的逐仓交易对
2. POST /sapi/v3/asset/getUserAsset - 查询现货余额
3. POST /sapi/v1/asset/transfer (MAIN_ISOLATED_MARGIN) - 划转到逐仓（首次转入自动激活）
4. [仅在账户被停用时] POST /sapi/v1/margin/isolated/account - 重新启用逐仓账户
5. GET /sapi/v1/margin/isolated/account - 查询逐仓账户
6. [如需借币] GET /sapi/v1/margin/maxBorrowable - 查询可借额度
7. [如需借币] POST /sapi/v1/margin/borrow-repay (BORROW) - 借币
8. POST /sapi/v1/margin/order (isIsolated=TRUE) - 创建订单
9. GET /sapi/v1/margin/order - 查询订单状态
10. [如有借款] POST /sapi/v1/margin/borrow-repay (REPAY) - 还币
11. GET /sapi/v1/margin/maxTransferable - 查询可转出额度
12. POST /sapi/v1/asset/transfer (ISOLATED_MARGIN_MAIN) - 划转回现货
```

## ⚠️ 关键注意事项

### 权限要求
1. **API Key 权限**: 必须开通"允许万向划转"权限
2. **交易权限**: 需开通"允许现货和杠杆交易"权限
3. **账户状态**: 账户需完成 KYC 认证

### 风险控制
1. **风险率监控**:
   - 全仓: `marginLevel` < 1.3 会被强平
   - 逐仓: 每个交易对独立计算风险率
2. **借币利息**: 按小时计息，每日结算
3. **强平机制**: 风险率过低时系统自动平仓

### 接口限制
1. **频率限制**:
   - 借贷操作: 权重 1500，建议间隔 100ms
   - 万向划转: 权重 900，避免频繁调用
   - 下单: 权重 6，注意订单频率限制
2. **并发限制**: 同一资产的借还操作不能并发

### 数据一致性
1. **余额更新**: 借贷、交易后余额可能有延迟（通常 < 100ms）
2. **订单状态**: 使用 WebSocket 获取实时订单更新
3. **风险率计算**: 基于实时价格，波动较大时需频繁查询

## 📚 模块索引

### wallet 模块
- [asset](markdown/docs/zh-CN/wallet/asset/CLAUDE.md) - 资产管理（万向划转、小额资产转换）
- [account](markdown/docs/zh-CN/wallet/account/CLAUDE.md) - 账户信息
- [capital](markdown/docs/zh-CN/wallet/capital/CLAUDE.md) - 充提币管理
- [travel-rule](markdown/docs/zh-CN/wallet/travel-rule/CLAUDE.md) - 旅行规则合规
- [others](markdown/docs/zh-CN/wallet/others/CLAUDE.md) - 其他功能

### margin_trading 模块
- [account](markdown/docs/zh-CN/margin_trading/account/CLAUDE.md) - 账户管理（全仓/逐仓账户查询）
- [trade](markdown/docs/zh-CN/margin_trading/trade/CLAUDE.md) - 交易执行（订单管理）
- [borrow-and-repay](markdown/docs/zh-CN/margin_trading/borrow-and-repay/CLAUDE.md) - 借贷还款
- [transfer](markdown/docs/zh-CN/margin_trading/transfer/CLAUDE.md) - 杠杆账户划转历史
- [market-data](markdown/docs/zh-CN/margin_trading/market-data/CLAUDE.md) - 市场数据
- [trade-data-stream](markdown/docs/zh-CN/margin_trading/trade-data-stream/CLAUDE.md) - 交易数据流
- [risk-data-stream](markdown/docs/zh-CN/margin_trading/risk-data-stream/CLAUDE.md) - 风险数据流

## 🔍 快速查询

### 我想实现全仓杠杆交易

**核心必需接口**（最少 3 个）:
1. `POST /sapi/v1/asset/transfer` (MAIN_MARGIN) - 划转资金到杠杆账户
2. `POST /sapi/v1/margin/order` (isIsolated=FALSE, sideEffectType=AUTO_BORROW_REPAY) - 交易（自动借还款）
3. `POST /sapi/v1/asset/transfer` (MARGIN_MAIN) - 划转资金回现货账户

**手动借还款模式**（需要 5 个接口）:
1. `POST /sapi/v1/asset/transfer` (MAIN_MARGIN) - 划转
2. `POST /sapi/v1/margin/borrow-repay` (BORROW) - 手动借币
3. `POST /sapi/v1/margin/order` (isIsolated=FALSE, sideEffectType=NO_SIDE_EFFECT) - 交易
4. `POST /sapi/v1/margin/borrow-repay` (REPAY) - 手动还币
5. `POST /sapi/v1/asset/transfer` (MARGIN_MAIN) - 转出

**推荐接口**:
- `GET /sapi/v1/margin/account` - 查询账户状态和风险率
- `GET /sapi/v1/margin/maxBorrowable` - 查询可借额度（手动借款时需要）

### 我想实现逐仓杠杆交易

**核心必需接口**（最少 3 个）:
1. `POST /sapi/v1/asset/transfer` (MAIN_ISOLATED_MARGIN) - 划转到逐仓（首次转入自动激活）
2. `POST /sapi/v1/margin/order` (isIsolated=TRUE, sideEffectType=AUTO_BORROW_REPAY) - 交易（自动借还款）
3. `POST /sapi/v1/asset/transfer` (ISOLATED_MARGIN_MAIN) - 划转回现货

**手动借还款模式**（需要 5 个接口）:
1. `POST /sapi/v1/asset/transfer` (MAIN_ISOLATED_MARGIN) - 划转（首次转入自动激活）
2. `POST /sapi/v1/margin/borrow-repay` (BORROW, isIsolated=TRUE) - 手动借币
3. `POST /sapi/v1/margin/order` (isIsolated=TRUE, sideEffectType=NO_SIDE_EFFECT) - 交易
4. `POST /sapi/v1/margin/borrow-repay` (REPAY, isIsolated=TRUE) - 手动还币
5. `POST /sapi/v1/asset/transfer` (ISOLATED_MARGIN_MAIN) - 转出

**推荐接口**:
- `GET /sapi/v1/margin/isolated/account` - 查询逐仓账户状态和风险率
- `GET /sapi/v1/margin/maxBorrowable` - 查询可借额度（手动借款时需要）

**仅在特殊情况下需要**:
- `POST /sapi/v1/margin/isolated/account` - 重新启用之前停用的逐仓账户

### 我想查询账户状态
- 全仓: `GET /sapi/v1/margin/account`
- 逐仓: `GET /sapi/v1/margin/isolated/account`
- 现货: `POST /sapi/v3/asset/getUserAsset`

### 我想查询借贷记录
- `GET /sapi/v1/margin/borrow-repay` (type=BORROW)
- `GET /sapi/v1/margin/interestHistory` - 利息历史

### 我想查询交易记录
- `GET /sapi/v1/margin/myTrades` - 成交记录
- `GET /sapi/v1/margin/allOrders` - 所有订单
- `GET /sapi/v1/margin/openOrders` - 当前挂单

---

**文档版本**: 1.0
**生成时间**: 2026-02-07
**适用范围**: 币安杠杆交易 API v1
