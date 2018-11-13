---
title: VS Code 前端使用常用扩展
date: 2018-10-25
categories: [Tool]
tags: [VS Code]
---

这里整理了 VS CODE 开发前端项目（VUE）常用的扩展

<!--more-->

### ESLint

将 ESLint 集成到 VS CODE 中（一个代码规范和错误检查工具）

[安装地址](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

[ESLint 配置文档](https://eslint.org/)

## Prettier - Code formatter

JavaScript / TypeScript / CSS 格式化工具

[安装地址](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

[源码和具体使用](https://github.com/prettier/prettier-vscode)

### Vetur

[安装地址](https://marketplace.visualstudio.com/items?itemName=octref.vetur)

Vue 开发必备，支持语法加亮，元素，代码片段，错误检查，格式化，自动完成及调试

[文档](https://vuejs.github.io/vetur)


### vscode-element-helper

ElementUI 辅助工具，支持快速组件文档查询，自动完成及代码片段。

[安装地址](https://marketplace.visualstudio.com/items?itemName=ElemeFE.vscode-element-helper)


1 - 选择组件标签，按快捷键 `ctrl + win + z` 打开该组件帮助文档

2 - 自动完成，为每个Element-UI 标签增加自动完成属性和方法

3 - 代码片段：msg, alert, confirm, prompt, msgb, notify

[源码和具体使用](https://github.com/ElemeFE/vscode-element-helper)


### JavaScript (ES6) code snippets

[安装地址](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets)

JavaScript (ES6) 代码片段，支持（JavaScirpt 和 TypeScript）。

部分常用片段整理

| 触发  | 内容 |
| -------: | ------- |
| `imp→`   | imports entire module `import fs from 'fs';`|
| `fre→`   | forEach loop in ES6 syntax `array.forEach(currentItem => {})`|
| `fof→`   | for ... of loop `for(const item of object) {}` |
| `fin→`   | for ... in loop `for(const item in object) {}` |
| `sti→`   | set interval helper method `setInterval(() => {});` |
| `sto→`   | set timeout helper method `setTimeout(() => {});` |
| `prom→`  | creates a new Promise `return new Promise((resolve, reject) => {});`|
| `thenc→` | adds then and catch declaration to a promise `.then((res) => {).catch((err) => {});`|
| `clg→`   | console log `console.log(object)` |

[源码和具体使用](https://github.com/xabikos/vscode-javascript)