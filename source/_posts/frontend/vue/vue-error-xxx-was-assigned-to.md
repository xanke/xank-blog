---
title: Vue "xxx" was assigned to but it has no setter. 错误
date: 2018-06-04
categories: [前端, Vue]
tags: [Vue, Element-ui]
---

<!--more-->

### 问题描述

在使用Element-ui 的 **el-select** 组件时，绑定 setLocal 事件会出现 **Vue "xxx" was assigned to but it has no setter.** 错误

### 错误代码

```html
<el-select v-if="local" v-model="local" @change="setLocal" placeholder="请选择">
  <el-option v-for="item in LOCAL_LIST" :key="item.value" :label="item.label" :value="item.value">
  </el-option>
</el-select>
```

```javascript
setLocal({ commit }, data) {
  commit('SET_LOCAL', data)
}
```

### 错误原因

因为 **@change** 触发的方法，会对 **local** 进行赋值，而 **v-model** 为双向绑定方法，从而导致变量重复赋值。

---

### 正确代码

将 **v-model** 替换为 **:value** 即可

```html
<el-select v-if="local" :value="local" @change="setLocal" placeholder="请选择">
  <el-option v-for="item in LOCAL_LIST" :key="item.value" :label="item.label" :value="item.value">
  </el-option>
</el-select>
```