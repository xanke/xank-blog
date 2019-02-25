
### once:只调用一次的函数

```javascript
export function once (fn: Function): Function {
  let called = false
  return function () {
    if (!called) {
      called = true
      fn.apply(this, arguments)
    }
  }
}
```

**解析：** 以called作为回调标识符。调用此函数时，called标示符改变，下次调用就无效了。也是典型的闭包调用