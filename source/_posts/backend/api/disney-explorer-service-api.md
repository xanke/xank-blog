---
title: 迪士尼（Disney）Api 结构分析 - 资源服务
date: 2018-05-26
categories: [后端, Api]
tags: [Api, Disney]
---

迪士尼 API 结构解析 - 资源服务

Explorer-Service

<!--more-->

## 获取资源列表

### URL 格式:

/explorer-service/public/destinations/**shdr**/facilities?region=**cn**

#### 参数：

* shdr: 乐园标识
* cn: 语言代号

### 请求格式

发送本地已缓存的资源列表

```json
id=eventMeetingsEvents;entityType=Event;destination=shdr;cacheId=-1413844276
id=eventDisneyCelebration;entityType=Event;destination=shdr;cacheId=-1534582309
...

// id 项目 ID
// entityType 项目类型
// destination 乐园标识
// cacheId 缓存随机数
```

### 返回格式

```json
[
  {
    "id":
      "recHakunaMatataOasisShanghaiDisneylandHotel;entityType=Recreation;destination=shdr",
    "cacheId":
      "recHakunaMatataOasisShanghaiDisneylandHotel;entityType=Recreation;destination=shdr;cacheId=404725051",
    "name": "上海迪士尼乐园酒店“哈库拉玛塔塔”乐苑",
    "type": "recreation",
    "webLink":
      "https://www.shanghaidisneyresort.com/recreation/hakuna-matata-oasis-shanghai-disneyland-hotel/",

    // 相关位置
    "relatedLocations": [
      {
        "id":
          "recHakunaMatataOasisShanghaiDisneylandHotel;entityType=point-of-interest;destination=shdr",
        "type": "primaryLocation",
        "name": "上海迪士尼乐园酒店“哈库拉玛塔塔”乐苑",
        "coordinates": [
          {
            "latitude": "31.14190981",
            "longitude": "121.6722429",
            "type": "Guest Entrance"
          }
        ],
        "ancestors": [
          {
            "id": "shdr;entityType=destination;destination=shdr",
            "type": "destination"
          },
          {
            "id": "hotelSHDLH;entityType=resort;destination=shdr",
            "type": "resort"
          }
        ]
      }
    ],

    // 媒体列表
    "medias": [
      {
        "type": "finderListMobileSquare",
        "url":
          "https://secure.cdn1.wdpromedia.cn/resize/mwImage/1/125/125/90/wdpromedia.disney.go.com/media/wdpro-shdr-assets/prod/zh-cn-cn/system/images/shdr-rec-hakuna-matata-oasis-shanghai-disneyland-hotel-hero-sq-new.jpg"
      },
      {
        "type": "finderDetailMobileHero",
        "url":
          "https://secure.cdn2.wdpromedia.cn/resize/mwImage/1/720/405/90/wdpromedia.disney.go.com/media/wdpro-shdr-assets/prod/zh-cn-cn/system/images/shdr-rec-hakuna-matata-oasis-shanghai-disneyland-hotel-hero-new.jpg"
      }
    ],

    // 特征列表
    "facets": [
      {
        "id": "outdoor",
        "name": "室外",
        "group": "activityType",
        "facetId": "shdr-recFacet-activity-outdoor-global_95718"
      },
      {
        "id": "childrens-activity-centers",
        "name": "儿童活动中心",
        "group": "activityType",
        "facetId":
          "shdr-recFacet-activity-childrens-activity-centers-global_95714"
      },
      {
        "id": "all-ages",
        "name": "所有年龄",
        "group": "age",
        "facetId": "shdr-facet-age-all-ages-global_95462"
      }
    ],

    // 简介列表
    "descriptions": [
      {
        "type": "shortDescriptionMobile",
        "text":
          "尽享“哈库拉玛塔塔”乐苑“无忧无虑”的好时光！其灵感源自迪士尼经典动画影片《狮子王》，这里有热带草原主题的戏水区和树篱迷宫，是上海迪士尼乐园酒店宾客的专属游乐场所。"
      }
    ],

    // 父级列表
    "ancestors": [
      {
        "id": "shdr;entityType=destination;destination=shdr",
        "type": "destination"
      },
      {
        "id": "hotelSHDLH;entityType=resort;destination=shdr",
        "type": "resort"
      }
    ]
  }
  // ...
]
```

如果服务器的 cacheId 不同，则返回新列表

其中 relatedLocations, medias, facets, descriptions, ancestors, ancestors 都使用了列表存储，这样更容易拓展相关内容，而不需要新建立字段。

## 获取等候时间

### URL 格式

/explorer-service/public/wait-times/**shdr**;entityType=**destination**;destination=**shdr**?region=**CN**

#### 参数：

* destination: 项目类型
* 其它同上

### 返回格式

```json
{
  "entries": [
    {
      "id": "attCampDiscovery;entityType=Attraction;destination=shdr",
      "waitTime": {
        "fastPass": {
          "available": false
        },
        "status": "Closed",
        "singleRider": false
      }
    },
    {
      "id": "attChallengeTrails;entityType=Attraction;destination=shdr",
      "waitTime": {
        "fastPass": {
          "available": false
        },
        "status": "Closed",
        "singleRider": false
      }
    }
    // ...
  ]
}
```

返回一个 Object 格式，其中 entries 显示所有的项目状态信息

## 获取项目开放时间

### URL 格式

/explorer-service/public/ancestor-activities-schedules/**shdr**;entityType=**destination;destination=shdr?filters=Attraction,Entertainment,MerchandiseFacility,guest-service,Recreation,recreation-activity,restaurant,Spa,tour,Event,resort,resort-area,theme-park,water-park,land,Entertainment-Venue**&startDate=**2018-01-26**&endDate=**2018-02-26**&region=**CN**

#### 参数：

* destination: 需要搜索的内容
* startDate: 设定开始时间
* endDate: 设定结束时间，最长支持 2 个月
* 其它同上

### 返回格式

```json
{
  "ancestor": {
    "id": "shdr;entityType=destination;destination=shdr"
  },
  "activities": [
    {
      "id": "attAdventuresWinniePooh;entityType=Attraction;destination=shdr",
      "schedule": {
        "timeZone": "Asia/Shanghai",
        "schedules": [
          {
            "type": "Operating",
            "startTime": "08:00:00",
            "endTime": "20:30:00",
            "date": "2018-01-26"
          },
          {
            "type": "Operating",
            "startTime": "08:00:00",
            "endTime": "20:30:00",
            "date": "2018-01-27"
          },
          {
            "type": "Operating",
            "startTime": "08:00:00",
            "endTime": "20:30:00",
            "date": "2018-01-28"
          },
          {
            "type": "Operating",
            "startTime": "08:00:00",
            "endTime": "20:30:00",
            "date": "2018-01-29"
          }
        ]
      }
    }
    // ...
  ]
}
```

返回一个 Object， 包含 **ancestor** 和 **activities** 即所有项目开发时间表，个人觉得 ancestor 有点多余。

activities 中的 **schedule** 包含了 **timeZone 时区**， 这个解决了多时区的问题

---

以上即是 Explor-Service API 的所有接口，通过以上三个接口，即可完成乐园等候时间的采集
