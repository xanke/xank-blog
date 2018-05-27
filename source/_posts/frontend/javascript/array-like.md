---
title: 解读 JavaScript 类数组
date: 2018-05-21
categories: [前端, JavaScript]
tags: [JavaScript, Array]
---

JavaScript 类数组深度解读

<!--more-->

## 什么是类数组

JavaScript 中，数组是一个特殊的对象，其 property 名为正整数，且其 length 属性会随着数组成员的增减而发生变化，同时又从 Array 构造函数中继承了一些用于进行数组操作的方法。

而对于一个普通的对象来说，如果它的所有 property 名均为正整数，同时也有相应的 length 属性，那么虽然该对象并不是由 Array 构造函数所创建的，它依然呈现出数组的行为，在这种情况下，这些对象被称为“类数组对象”。

例：

```javascript
var o = { 0: 42, 1: 52, 2: 63, length: 3 }
```

### 类数组的特点:

* 并不是由 Array 构造函数所创建的
* 拥有 length 属性，其它属性（索引）为非负整数(对象中的索引会被当做字符串来处理，这里你可以当做是个非负整数串来理解)
* 不具有数组所具有的方法（shift, unshift, splice ...）

### 常见的类数组

* arguments 对象
* DOM 方法的返回结果，比如 document.getElementsByTagName()

## 类数组转换成数组之后进行操作有什么优势

由于类数组不具有数组所具有的操作数组的方法，将类数组转换为数组后就能调用如 push,sort 等强大的方法，方便快捷

## 判断一个对象是否属于类数组

从原型入手

```javascript
function isArrayLike(obj) {
  return Array.prototype.isPrototypeOf(obj)
}
```

跨原型链调用 toString()方法

```javascript
function isArrayLike(obj) {
  return Object.prototype.toString.call(obj) === '[object Object]'
}
```

Array.isArray() 方法

```javascript
function isArrayLike(obj) {
  return Array.isArray(obj)
}
```

instanceof 方法

```javascript
function isArrayLike(obj) {
  return obj instanceof Array
}
```

## 类数组转换为数组方法

方法一

```javascript
function toArray(s) {
  try {
    return Array.prototype.slice.call(s)
  } catch (e) {
    const arr = []
    for (let i = 0, len = s.length; i < len; i++) {
      arr[i] = s[i]
    }
    return arr
  }
}
```

方法二

```javascript
function toArray(list, start = 0) {
  let i = list.length - start
  let ret = new Array(i)
  while (i--) {
    ret[i] = list[i + start]
  }
  return ret
}
```

> slice 的内部实现

```javascript
Array.prototype.slice = function(start, end) {
  var result = new Array()
  start = start || 0
  end = end || this.length //this指向调用的对象，当用了call后，能够改变this的指向，也就是指向传进来的对象，这是关键
  for (var i = start; i < end; i++) {
    result.push(this[i])
  }
  return result
}
```
