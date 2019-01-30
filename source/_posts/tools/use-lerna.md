---
title: 使用 Lerna 管理 packages
date: 2018-11-01
categories: [工具, lerna]
tags: [npm, lerna]
---

在一个大型前端项目中，为了方便代码共享，就需要将代码库拆成独立的包，为了方便管理这些包，这时候 Lerna 就派上用场了。

<!--more-->

[官方网站](https://lernajs.io/)

## 创建 Lerna

1. 安装并初始化工程

```sh
npm i lerna -g

git init && lerna init
```

2. 执行成功后，目录下将会生成这样的目录结构

```sh
 - packages(目录)
 - lerna.json(配置文件)
 - package.json(工程描述文件)
```

3. 添加一个 package

进入 packages 目录创建一个目录

```sh
npm init
```

## Lerna 管理模式

**固定模式(默认)：**

packages 下的所有包共用一个版本号(version)，会自动将所有的包绑定到一个版本号上(该版本号也就是 lerna.json 中的 version 字段)，所以任意一个包发生了更新，这个共用的版本号就会发生改变。

**独立模式**

```sh
lerna init --independent
```

独立模式允许每一个包有一个独立的版本号，在使用 lerna publish 命令时，可以为每个包单独制定具体的操作，同时可以只更新某一个包的版本号。此种模式时，lerna.json 中的 version 字段指定为 independent 即可。

## 发布包

首先需要注册 Npm 账号
https://www.npmjs.com

然后本地登陆 Npm 账号

```sh
npm login
```

Lerna 发布

```sh
lerna publish
```

发布选项

## Lerna 命令

```sh
lerna bootstrap
```

安装依赖

```sh
lerna changed
```

检查自上次发布以来的所有包更改

```sh
lerna diff [package]
```

检查自上次发布以来的单个包更改

```sh
lerna run [script]
```

在包含该脚本的每个包中运行 npm 脚本

```sh
lerna ls
```

查看该目录的所有包

## 开发与调试

进入该包目录运行

```sh
npm link
```

然后在拥有该包的项目中执行完成创建链接

```sh
npm link [package]
```

关闭链接

```sh
npm unlink [package]
```
