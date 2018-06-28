---
title: Yarn 常用命令大全
date: 2018-01-24
categories: [工具, Yarn]
tags: [Yarn]
---

Yarn 是一个依赖管理工具。它能够管理你的代码，并与全世界的开发者分享代码。Yarn 是高效、安全和可靠的，你完全可以安心使用。

<!--more-->

## 三大优点

- 速度超快：Yarn 缓存了每个下载过的包，所以再次使用时无需重复下载。同时利用并行下载以最大化资源利用率，因此安装速度更快。
- 超级安全：在执行代码之前，Yarn 会通过算法校验每个安装包的完整性。
- 超级可靠：使用详细、简洁的锁文件格式和明确的安装算法，Yarn 能够保证在不同系统上无差异的工作。

## 主要特性

- 离线模式：如果你以前安装过某个包，再次安装时可以在没有任何互联网连接的情况下进行。
- 确定性：不管安装顺序如何，相同的依赖关系将在每台机器上以相同的方式安装。
- 网络性能：Yarn 有效地对请求进行排队处理，避免发起的请求如瀑布般倾泻，以便最大限度地利用网络资源。
- Same Packages：从 npm 安装所有包，让你的工作流程保持一致。
- 网络弹性：重试机制确保单个请求失败并不会导致整个安装失败。
- 扁平模式：将依赖包的不同版本归结为单个版本，以避免创建多个副本。

## 常用命令（与npm对比）

安装包

| npm | Yarn | 用法 |
| --- | ---- |--|
| npm install | yarn install |安装|
| npm install [package] | *(N/A)* |安装包|
| npm install [package] --global | yarn global add [package] |安装包到全局|
| npm install [package] --save| yarn add [package]|安装并添加进 package.json 生产环境|
| npm install [package] --save-dev| yarn add [package] [--dev/-D]|安装并添加进 package.json 开发环境|

更新包

| npm | Yarn | 用法 |
| --- | ---- |--|
| npm update [package] |yarn upgrade [package] |更新包|

删除包

| npm | Yarn | 用法 |
| --- | ---- |--|
| npm uninstall  [package] | *(N/A)* |移除包|
| npm uninstall [package] --save| yarn remove  [package]|移除 package.json 生产环境的包|
| npm uninstall [package] --save-dev| yarn remove [package]|移除 package.json 开发环境的包|

清理操作

| npm | Yarn | 用法 |
| --- | ---- |--|
| npm cache clean | yarn cache clean|清理包缓存|
| rm -rf node_modules && npm install| yarn upgrade|重新安装包|

## 相关网站

https://yarn.bootcss.com/