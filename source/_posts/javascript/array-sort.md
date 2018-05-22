---
title: JavaScript Array Sort 用法
date: 2017-06-31
tags: ['JavaScript']
categories: ['前端']
---

Array.sort() 方法用于对数组的元素进行排序,并返回数组。默认排序顺序是根据字符串 Unicode 码点。

<!--more-->

## 语法

Array.sort(sortby)

参数 sortby 可选。规定排序顺序。必须是函数。

> 注：如果调用该方法时没有使用参数，将按字母顺序对数组中的元素进行排序，说得更精确点，是按照字符编码的顺序进行排序。要实现这一点，首先应把数组的元素都转换成字符串（如有必要），以便进行比较。

## 常用排列方法

升序排列

```javascript
Array.sort((a, b) => (a < b ? -1 : 1))

Array.sort((a, b) => a - b)
```

降序排列

```javascript
Array.sort((a, b) => (a > b ? -1 : 1))

Array.sort((a, b) => a + b)
```

偶数排前

```javascript
Array.sort(a => (a % 2 === 0 ? -1 : 1))
```

奇数排前

```javascript
Array.sort(a => (a % 2 !== 0 ? -1 : 1))
```

随机排列

```javascript
Array.sort(() => (Math.random() > 0.5 ? -1 : 1))
```

## 对某个值进行排序

sort 方法接收一个函数作为参数，这里嵌套一层函数用来接收对象属性名，其他部分代码与正常使用 sort 方法相同。

```javascript
var arr = [
  { name: 'zopp', age: 0 },
  { name: 'gpp', age: 18 },
  { name: 'yjj', age: 8 }
]

function compare(property) {
  return function(a, b) {
    var value1 = a[property]
    var value2 = b[property]
    return value1 - value2
  }
}

arr.sort(compare(property))
```

如何根据参数不同，来确定是升序排列，还是降序排序呢？

```javascript
sortBy: function(attr,rev){
  //第二个参数没有传递 默认升序排列
  if(rev ==  undefined){
    rev = 1;
  } else{
    rev = (rev) ? 1 : -1;
  }
  return function(a,b){
    a = a[attr];
    b = b[attr];
    if(a < b){
      return rev * -1;
    }
    if(a > b){
      return rev * 1;
    }
    return 0;
  }
}
```

使用方式

```javascript
newArray.sort(sortBy('number', false))
```

> V8 引擎 sort 函数只给出了两种排序 InsertionSort 和 QuickSort，数量小于 10 的数组使用 InsertionSort，比 10 大的数组则使用 QuickSort。

[V8 引擎 Array 源码](https://github.com/v8/v8/blob/ad82a40509c5b5b4680d4299c8f08d6c6d31af3c/src/js/array.js)
