---
title: Egg.js 使用 TypeScript 遇到的问题
date: 2018-05-01
categories: [后端]
tags: [TypeScript, egg]
---

这里总结下在 Egg.js 中使用 TypeScript 遇到的问题

<!--more-->

Egg.js 是阿里云出品的基于 Koa 的企业级框架。

详见 [Egg.js 官网](https://eggjs.org)

---

# 常见问题

## Config 配置问题

配置 config.local 及 config.prod 时需要引入 DefaultConfig

```typescript
import { DefaultConfig } from './config.default';

export default () => {
  const config: DefaultConfig = {};

  config.xxx = {
    // ...
  }

  return config
}