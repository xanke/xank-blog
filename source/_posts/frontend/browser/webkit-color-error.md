---
title: 网页渲染的颜色竟然和设定值的不同！Chrome 61+ 色差解决办法
date: 2018-01-12
categories: [浏览器]
tags: [浏览器]
---

最近在和设计对 UI 的时候发现色彩总是对不上。。。

打开屏幕截图工具识色，竟然发现浏览器渲染的颜色和设定值不一样！

这差点让我开始怀疑人生了。。竟然还有这样的 Bug

<!--more-->

![](http://cdn.xank.cn/3211410604-5a587023a051d_articlex.jpg)

上图可以看到，实际设定 rgb(227,109,1)，缺渲染出 rgb(211,115,47)，便暗一些。。

### 百度搜索无果~~开始翻墙 Google

很快找到
https://productforums.google.com/forum/#!topic/chrome/VZWlM41RWZ8

![](http://cdn.xank.cn/1479601025-5a5870c618149_articlex.jpg)

解释大致是 Chrome61 开始会遵循显示器上的配置文件。

发现我的连的是双屏显示器（一台 Surface Stuido 外连 Dell 的屏幕）可能其中一台的颜色配置文件不相同导致的问题。

打开显示器色彩配置：

![](http://cdn.xank.cn/2549055120-5a5872e4f2c84_articlex.jpg)

好吧~ 另一台显示器无法修改色彩配置，看来只能从浏览器来解决这个问题了。

### 解决办法（2 选 1）

方法一：关闭硬件加速，重启后浏览器就恢复正常
![](http://cdn.xank.cn/2502267973-5a5871a67cc6a_articlex.jpg)

方法二：打开 chrome://flags/#force-color-profile，将色彩配置设置为 sRGB
![](http://cdn.xank.cn/1730018709-5a587215ae709_articlex.jpg)
