---
title: Vue 中的 VirtualDOM 实现
date: 2018-05-22
categories: [JavaScript]
tags: [JavaScript, Vue]
---

Vue 中的 VirtualDOM 实现

<!--more-->

## 为什么要使用 VirtualDOM

因为真正的 DOM 元素非常庞大，轻微的触碰就可能导致页面重绘，这样是想当消耗性能的。

相对于 DOM 对象，原生的 JavaScript 对象处理起来更快，而且更简单，DOM 树上的结构、属性更容易在 JavaScript 对象中表示出来。

例如:

```javascript
var element = {
  tag: 'ul', // 节点标签名
  children: [
    // 该节点的子节点
    { tag: 'li', data: { class: 'item' }, text: 'Item 1' },
    { tag: 'li', data: { class: 'item' }, text: 'Item 2' },
    { tag: 'li', data: { class: 'item' }, text: 'Item 3' }
  ]
}
```

对应的 HTML:

```html
<ul id='list'>
  <li class='item'>Item 1</li>
  <li class='item'>Item 2</li>
  <li class='item'>Item 3</li>
</ul>
```

Vue 将 DOM 抽象成 JavaScript 对象为节点的 DOM 树，可以在 VNode 节点模拟真实的 DOM,可以对这颗抽象树进行增删改操作，在这个过程中不需要直接操作真实的 DOM。修改后通过 Diff 算法得出一些需要修改的最小单位，再将这些最小单位的视图进行更新，这样减少了很多不必要的 DOM 操作，大大提高了性能。

Vue 就使用了这样的抽象节点 VNode，它是对真实 DOM 的一层抽象，而不依赖某个平台，它可以是浏览器平台，也可以是 Weex，甚至是 Node 平台，这也对前后端同构提供了可能。
