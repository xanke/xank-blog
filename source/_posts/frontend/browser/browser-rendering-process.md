---
title: 浏览器渲染过程解析
date: 2018-05-27
categories: [前端, 浏览器]
tags: [浏览器]
---

浏览器渲染过程解析和现代浏览器渲染引擎优化

<!--more-->

## 浏览器渲染页面的过程

浏览器请求、加载、渲染一个页面，时间花在下面五件事情上：

* DNS 查询
* TCP 连接
* HTTP 请求
* 服务器响应
* 客户端渲染

## 客户端渲染

1.  处理 HTML 并构建 DOM 树
2.  处理 CSS 并构建 CSSOM 树
3.  将 DOM 树 和 CSSOM 树合并成 渲染树（Render Tree）
4.  根据渲染树来布局，以计算结点几何信息
5.  将各个节点绘制到屏幕上

这五个不一定一次性顺序完成，只要 DOM 或 CSSOM 被修改，以上过程需要重新执行，这样才能计算出哪些像素需要在屏幕上重新渲染。

## 阻塞渲染

* script 标签会阻塞 HTML 解析

### defer 属性

```html
<script src="app.js" defer></script>
```

defer 属性表示延迟执行引入的 JavaScript，即这段 JavaScript 加载时 HTML 并未停止解析，这两个过程是并行的。整个 document 解析完毕且 defer-script 也加载完成之后（这两件事情的顺序无关），会执行所有由 defer-script 加载的 JavaScript 代码，然后触发 DOMContentLoaded 事件。

defer 不会改变 script 中代码的执行顺序。

#### defer 与相比普通 script 的区别

* 载入 JavaScript 文件时不阻塞 HTML 的解析
* 执行阶段被放到 HTML 标签解析完成之后。

### async 属性

```html
<script src="app.js" async></script>
```

async 属性表示异步执行引入的 JavaScript，与 defer 的区别在于，如果已经加载好，就会开始执行——无论此刻是 HTML 解析阶段还是 DOMContentLoaded 触发之后。需要注意的是，这种方式加载的 JavaScript 依然会阻塞 load 事件。换句话说，async-script 可能在 DOMContentLoaded 触发之前或之后执行，但一定在 load 触发之前执行。

async 的加载与执行是并行的（异步）

## DOMContentLoaded 与 Load

DOMContentLoaded： 顾名思义，就是 DOM 内容加载完毕。那什么是 dom 内容加载完毕呢？我们从打开一个网页说起。当输入一个 URL，页面的展示首先是空白的，然后过一会，页面会展示出内容，但是页面的有些资源比如说图片资源还无法看到，此时页面是可以正常的交互，过一段时间后，图片才完成显示在页面。从页面空白到展示出页面内容，会触发 DOMContentLoaded 事件。而这段时间就是 HTML 文档被加载和解析完成。

* 我们在 jQuery 中经常使用的 $(document).ready(function() { // ...代码... }); 其实监听的就是 DOMContentLoaded 事件
* IE6、IE7 不支持 DOMContentLoaded，但它支持 onreadystatechange 事件

Load：页面上所有的资源（图片，音频，视频等）被加载以后才会触发 load 事件，简单来说，页面的 load 事件会在 DOMContentLoaded 被触发之后才触发。

## 现代浏览器的渲染引擎优化

### 局部渲染

现代浏览器为了更好的用户体验，渲染引擎将尝试尽快在屏幕上显示的内容。它不会等到所有 HTML 解析之前开始构建和布局渲染树。部分的内容将被解析并显示。也就是说浏览器能够渲染不完整的 DOM 树和 CSSOM，尽快的减少白屏的时间。

### 猜测预加载

现代浏览器中，为了减缓渲染被阻塞的情况，当解析被阻塞的时候，浏览器会有一个轻量级的 HTML（或 CSS）扫描器（scanner）继续在文档中扫描，查找那些将来可能能够用到的资源文件的 url，在渲染器使用它们之前将其下载下来。
