## javascript 中的 this 作用域详解

### 1.全局的函数调用

```javascript
function globalTest() {
  this.name = 'global this'
  console.log(this.name)
}
globalTest() //global this
```

以上代码中，globalTest()是全局性的方法，属于全局性调用，因此 this 就代表全局对象 window。为了充分证明 this 是 window,对代码做如下更改：

```javascript
var name = 'global this'

function globalTest() {
  console.log(this.name)
}
globalTest() //global this
```

### 对象方法的调用

如果函数作为对象的方法调用，**this 指向的是这个上级对象，即调用方法的对象。** 在以下代码中，this 指向的是 obj 对象。

```javascript
function showName() {
  console.log(this.name)
}
var obj = {}
obj.name = 'ooo'
obj.show = showName
obj.show() //ooo
```

### 构造函数的调用

```javascript
function showName() {
  this.name = 'showName function'
}
var obj = new showName()
console.log(obj.name) //showName function
```

构造函数中的 this 指向新创建的对象本身。

**new 关键字可以改变 this 的指向，将这个 this 指向对象 obj**

### apply/call 调用时的 this

apply 和 call 都是为了改变函数体内部的 this 指向。

**call 方法：**

```javascript
call(thisObj，Object)
```

**apply 方法：**

```javascript
apply(thisObj，[argArray])
```

如果 argArray 不是一个有效的数组或者不是 arguments 对象，那么将导致一个 TypeError。

```javascript
var value = 'Global value'

function FunA() {
  this.value = 'AAA'
}

function FunB() {
  console.log(this.value)
}
FunB() //Global value 因为是在全局中调用的FunB(),this.value指向全局的value
FunB.call(window) //Global value,this指向window对象，因此this.value指向全局的value
FunB.call(new FunA()) //AAA, this指向参数new FunA()，即FunA对象

FunB.apply(window) //Global value
FunB.apply(new FunA()) //AAA
```

### 箭头函数中的 this 绑定问题

```javascript
var obj = {
  fn: function() {
    setTimeout(function() {
      console.log(this)
    })
  }
}
obj.fn() //window
```

这次 this 指向了最外层的 window 对象，因为 setTImeout()中的匿名函数里，并没有某个对象进行显示调用，所以 this 指向 window 对象

**使用箭头函数呢**

```javascript
var obj = {
  fn: function() {
    setTimeout(() => {
      console.log(this)
    })
  }
}
obj.fn() //object
```

- 箭头函数的 this 绑定看的是 this 所在的函数定义在哪个对象下，绑定到哪个对象则 this 就指向哪个对象
- 如果有对象嵌套的情况，则 this 绑定到最近的一层对象上
