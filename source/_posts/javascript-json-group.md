---
title: Javascript中JSON数据分组优化实践
date: 2017-12-21
---

现有一堆数据，我需要按时间进行分组，以便前端视图呈现

```json
[
  {
    "date": "2017-12-22",
    "start_time": "10:00:00",
    "end_time": "10:00:00",
    "status": "Performance Time"
  },
  {
    "date": "2017-12-22",
    "start_time": "10:40:00",
    "end_time": "10:40:00",
    "status": "Performance Time"
  },
  {
    "date": "2017-12-23",
    "start_time": "10:00:00",
    "end_time": "10:00:00",
    "status": "Performance Time"
  },
  {
    "date": "2017-12-23",
    "start_time": "10:40:00",
    "end_time": "10:40:00",
    "status": "Performance Time"
  }
]
```

需转化为如下

```json
[
  {
    date: "2017-12-22",
    data: [
      {
        date: "2017-12-22",
        start_time: "10:00:00",
        end_time: "10:00:00",
        status: "Performance Time"
      },
      {
        date: "2017-12-22",
        start_time: "10:40:00",
        end_time: "10:40:00",
        status: "Performance Time"
      }
    ]
  },
  {
    date: "2017-12-23",
    data: [
      {
        date: "2017-12-23",
        start_time: "10:00:00",
        end_time: "10:00:00",
        status: "Performance Time"
      },
      {
        date: "2017-12-23",
        start_time: "10:40:00",
        end_time: "10:40:00",
        status: "Performance Time"
      }
    ]
  }
]
```

## 1.原始方法，网络一大堆

```javascript
  var map = {},
    nList = []
  //遍历原始数组
  for (var i = 0; i < arr.length; i++) {
    var item = arr[i]
    //如果map没有则在新nList中添加
    if (!map[item.date]) {
      nList.push({
        date: item.date,
        data: [item]
      })
      map[item.date] = item
    } else {
      //遍历nList
      for (var j = 0; j < nList.length; j++) {
        var nItem = nList[j]、
        //如查找到date符合则添加
        if (nItem.date == item.date) {
          nItem.data.push(item)
          //跳出循环
          break
        }
      }
    }
  }
```

运行效率：遍历 1000 个约 3ms，总觉得不优雅，而且没用到 ES5 的特性，于是决定自己优化一下！

## 2.使用 ES5 特性

将 for 替换为 forEach 和 every

```javascript
let map = {},
  nList = []
arr.forEach(item => {
  if (!map[item.date]) {
    nList.push({
      date: item.date,
      data: [item]
    })
    map[item.date] = item
  } else {
    //因为forEach不支持break，所以使用every实现
    nList.every(nItem => {
      if (nItem.date === item.date) {
        nItem.data.push(item)
        return false
      }
      return true
    })
  }
})
```

性能优化 50%，约 1.5ms！

## 3.性能优化实践

因为我的数组中的 date 是按**顺序排列**，而且没有重复，这样可以考虑**去除第二个循环**

```javascript
let map = {},
  nList = []
//设置初始key为0
let _nkey = 0
arr.forEach((item, index) => {
  if (index === 0) {
    nList.push({
      date: item.date,
      data: [item]
    })
  } else {
    let oItem = arr[index - 1]
    //和前一个date一致则在当前添加，否则添加至nList
    if (item.date === oItem.date) {
      nList[_nkey]['data'].push(item)
    } else {
      nList.push({
        date: item.date,
        data: [item]
      })
      _nkey++
    }
  }
})
```

效率再次优化 50%，约 1ms！

## 项目最终效果：

![](https://user-gold-cdn.xitu.io/2017/12/21/16077be7a1ff598c?w=2107&h=1354&f=jpeg&s=116718)
