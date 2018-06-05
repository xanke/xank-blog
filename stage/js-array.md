## Map 方法

```javascript
const nameList = []
for (let item of list) {
  const { name } = item
  nameList.push(name)
}

const nameList = list.map(item => item.name)
```
