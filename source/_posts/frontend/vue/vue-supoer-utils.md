---
title: Vue 中的经典方法（更新中）
date: 2018-05-22
categories: [前端, Vue]
tags: [Vue, Utils]
---

这里整理了一些我阅读 Vue 源码中看到的一些比较不错的 Function。

<!--more-->

## 判断两个数组是否相等

```javascript
function valueEquals(a, b) {
  // see: https://stackoverflow.com/questions/3115982/how-to-check-if-two-arrays-are-equal-with-javascript
  if (a === b) return true
  if (!(a instanceof Array)) return false
  if (!(b instanceof Array)) return false
  if (a.length !== b.length) return false

  // 最后一个循环遍历每个元素并对它们进行比较。如果数组没有排序，那么如果项目的顺序不完全相同，它将失败
  for (let i = 0; i !== a.length; ++i) {
    if (a[i] !== b[i]) return false
  }
  return true
}
```

## 深度递归合并两个对象

```javascript
function mergeData(to, from) {
  if (!from) return to
  let key, toVal, fromVal
  const keys = Object.keys(from)
  for (let i = 0; i < keys.length; i++) {
    key = keys[i]
    toVal = to[key]
    fromVal = from[key]
    if (!hasOwn(to, key)) {
      set(to, key, fromVal)
    } else if (isPlainObject(toVal) && isPlainObject(fromVal)) {
      mergeData(toVal, fromVal)
    }
  }
  return to
}

// 严格判断是否是纯 JavaScript 对象类型
function isPlainObject(obj) {
  return _toString.call(obj) === '[object Object]'
}
```

## 首字母转大写

```javascript
function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1)
}
```

## 类数组转数组

```javascript
function toArray (list, start) {
  start = start || 0
  let i = list.length - start
  const ret = new Array(i)
  while (i--) {
    ret[i] = list[i + start]
  }
  return ret
}
```


