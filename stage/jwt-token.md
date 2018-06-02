---
title: JWT 介绍及与传统 Token 优缺点分析
---

## 什么是 JWT

JSON Web Token (JWT)是一种基于 token 的认证方案。 

JWT 是JSON风格轻量级的授权和身份认证规范，可实现无状态、分布式的Web应用授权。

JWT通常由三部分组成: 头信息（header）, 消息体（payload）和签名（signature）。

### JWT 主要特点

- 简洁 (Compact)

可以通过URL, POST 参数或者在 HTTP header 发送，因为数据量小，传输速度快

- 自包含 (Self-contained)

负载中包含了所有用户所需要的信息，避免了多次查询数据库


## JWT 与 Token 区别

JWT 是有状态的，其中 payload 可包含用户状态，每次验证可以不需要查库，有助于提高性能

Token 为随机字符串，每次验证都需要查库来判断

## JWT 的优势

- 不需要 CSRF 的保护

## JWT 在服务器集群中的优势

传统 Token 由于会话状态保存在了服务器, 所以需要多个服务器间同步会话状态。而JWT就是将会话状态保存在了客户端，没有多服务器间同步麻烦。

简单而言 JWT 就是解决了多个服务器同步会话状态的问题，因为它符合无状态。

## JWT 安全及注意事项

不能在 payloads 存放敏感数据，因为 payloads 是可逆的 base64 编码。

为 JWT 增加有效期，

如 JWT 保存了用户角色、等级等信息，每次变动需要强制更新 JWT。

使用 HTTPS

添加浏览器指纹识别：https://www.cnblogs.com/lhb25/p/browser-fingerprinting-js-library.html

## JWT 缺陷

1. 无法作废已颁布的令牌，


https://blog.csdn.net/a82793510/article/details/53509427