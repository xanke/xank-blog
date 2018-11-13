## Webpack 升级 4.0 问题

## 需要升级的包

webpack: 4.25.1
webpack-cli: 3.1.2
webpack-dev-server: 3.1.10

stylus-loader: 3.0.2
html-webpack-plugin: 3.2.0
vue-loader: 15.4.2

## 需要修改的配置

webpack.dev.conf.js

```javascript
// 新增
const { VueLoaderPlugin } = require('vue-loader')

// ...
plugins: [
  // 新增
  new VueLoaderPlugin()
]
// ...
```

package.json 设置 mode

```json
"scripts": {
  "dev": "webpack --mode development", // 开发环境
  "build": "webpack --mode production"  // 生产环境
}
```
