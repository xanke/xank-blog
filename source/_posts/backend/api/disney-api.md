---
title: 迪士尼（Disney）后端架构解析
date: 2018-05-20
categories: [后端, Api]
tags: [Api, Disney]
---

这里总结了我研究 Disney App 中的 Api 设计架构大纲。

<!--more-->

## 服务列表

### 门票验证服务

/entitlement-view-assembly-service

用于获取门票类型和票号验证

### 资源服务

/explorer-service

提供乐园项目信息和等候时间

### 用户资料服务

/facility-service

返回用户头像资源

### 快速通行证服务

/shdr-gxp-service

用于快速通行证领取和查询

### 门票查询服务

/lexicon-view-assembler-service

可查询门票价格和剩余数量

### 列表服务

/lists-service

暂时未知

### 移动端服务

/mobile-service

按天返回乐园时间表信息

### 账户服务

/profile-service

用于账户登陆注册等

### 票务管理服务

/ticket-management-service

返回绑定的门票 ID

---

## API 参数

这里总结了 Api 请求的相关参数

### 乐园参数

| 乐园名           | ID       | 语言 | 时区 |
| ---------------- | -------- | ---- | ---- |
| 奥莱多迪士尼乐园 | 80007798 | US   | -5   |
| 加州迪士尼乐园   | 80008297 | US   | -8   |
| 巴黎迪士尼乐园   | dlp      | GB   | -1   |
| 香港迪士尼乐园   | hkdl     | CN   | +8   |
| 上海迪士尼乐园   | shdr     | CN   | +8   |

### 项目类型列表

| ID | 说明 |
| -- | -- |
| Spa | SPA |
| tour | 游客服务 |
| Event | 主题活动 |
| Attraction | 游乐设施 |
| Recreation | 洗手间 |
| restaurant | 餐厅 |
| MerchandiseFacility | 商店 |
| guest-service | 导览服务 |
| Entertainment | 娱乐演出 |
| recreation-activity | 休闲活动 |
| land | 主题园区 |
| resort | 度假区 |
| theme-park | 主题乐园 |
| water-park | 水上乐园 |
| Entertainment-Venue | 娱乐场所 |

### API 服务列表

| 路径 | 说明 |
| -- | -- |
| entitlement-view-assembly-service | 门票验证服务 |
| explorer-service | 资源服务 |
| facility-service | 用户资料服务 |
| shdr-gxp-service | 快速通行证服务 |
| lexicon-view-assembler-service | 门票查询服务 |
| lists-service | 列表服务 |
| mobile-service | 移动端服务 |
| profile-service | 账户服务 |
| ticket-management-service | 票务管理服务 |

---

以上便是迪士尼 API 架构，每个功能都分的非常细，应该是属于微服务架构，每个服务的详情我会在接下来的文章中详解。