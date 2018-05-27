---
title: MVC、MVP、MVVM 使用关系总结
---

## MVC

MVC全名是Model View Controller，是模型(model)－视图(view)－控制器(controller)的缩写，一种软件设计典范，用一种业务逻辑、数据、界面显示分离的方法组织代码，将业务逻辑聚集到一个部件里面，在改进和个性化定制界面及用户交互的同时，不需要重新编写业务逻辑。MVC被独特的发展起来用于映射传统的输入、处理和输出功能在一个逻辑的图形化用户界面的结构中。

### 数据关系

- View 接受用户交互请求
- View 将请求转交给 Controller
- Controller 操作 Model 进行数据更新
- 数据更新之后，Model 通知 View 更新数据变化
- View 更新变化数据

### 方式

所有方式都是单向通信

### 结构实现

View：使用 Composite模式 
View和Controller：使用 Strategy模式 
Model和 View：使用 Observer模式同步信息

### 使用

MVC中的View是可以直接访问Model的！从而，View里会包含Model信息，不可避免的还要包括一些业务逻辑。在MVC模型里，更关注的Model的不变，而同时有多个对Model的不同显示，及View。所以，在MVC模型里，Model不依赖于View，但是 View是依赖于Model的。不仅如此，因为有一些业务逻辑在View里实现了，导致要更改View也是比较困难的，至少那些业务逻辑是无法重用的。

## MVP

mvp的全称为Model-View-Presenter，Model提供数据，View负责显示，Controller/Presenter负责逻辑的处理。MVP与MVC有着一个重大的区别：在MVP中View并不直接使用Model，它们之间的通信是通过Presenter (MVC中的Controller)来进行的，所有的交互都发生在Presenter内部，而在MVC中View会直接从Model中读取数据而不是通过 Controller。