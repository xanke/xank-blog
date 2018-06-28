---
title: TypeScript 学习整理
date: 2018-06-06
categories: [前端, TypeScript]
tags: [TypeScript]
---

<!--more-->

### 什么是 TypeScript？

TypeScript 是一种由微软开发的自由和开源的编程语言，它是 JavaScript 的一个**超集**，扩展了 JavaScript 的语法。


(官方文档)[https://www.tslang.cn/docs/handbook]


**语法特性**

- 类 Classes
- 接口 Interfaces
- 模块 Modules
- 类型注解 Type annotations
- 编译时类型检查 Compile time type checking
- Arrow 函数 (类似 C# 的 Lambda 表达式)

### 基础类型

```typescript
let name: string = 'Mike'

let agt: number = 27

let sentence: string = `My name is ${ name }.`

// 数组

let list: number [] = [1, 2, 3]

let list: Array<number> = [1, 2, 3]

// 元组

let x: [string, number] = ['hello', 10]

console.log(x[1]) // 10 当访问一个已知索引的元素，会得到正确的类型

// 当访问一个越界的元素，会使用联合类型替代

x[3] = 'world' // OK

x[4] = 25 // OK


```
### 枚举

enum类型是对JavaScript标准数据类型的一个补充。 像C#等其它语言一样，使用枚举类型可以为一组数值赋予友好的名字。

1