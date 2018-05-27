---
title: Docker MongoDB 单实例与集群搭建
date: 2018-02-21
categories: [服务器, Docket]
tags: [Docker, MongoDB]
---

在 Docker 搭建 MongoDB

<!--more-->

## 单实例创建

```shell
docker run -e TZ="Asia/Shanghai" --name mongo -d -p 27017:27017 --mount type=bind,source=/data/mongo,target=/data/db daocloud.io/mongo
```

* -e TZ="Asia/Shanghai" 时区配置
* --name mongo
* -d
* -p 27017:27017
* --mount type=bind,source=/data/mongo,target=/data/db 挂载 DB 目录

## 集群搭建（复制集）

启动 3 个 MongoDB 容器

```shell
docker run -d -p 27001:27017 \
  --name mongo-1 \
  --mount type=bind,source=/data/mongo-1,target=/data/db \
  -e TZ="Asia/Shanghai" \
  mongo mongod --replSet mongo-data

docker run -d -p 27002:27017 \
  --name mongo-2 \
  --mount type=bind,source=/data/mongo-2,target=/data/db \
  -e TZ="Asia/Shanghai" \
  mongo mongod --replSet mongo-data

docker run -d -p 27003:27017 \
  --name mongo-3 \
  --mount type=bind,source=/data/mongo-3,target=/data/db \
  -e TZ="Asia/Shanghai" \
  mongo mongod --replSet mongo-data
```

进入容器管理，配置集群

```shell
docker exec -it mongo-1 mongo

config = {
  "_id" : "mongo-repliset",
  "members" : [
    {
      "_id" : 0,
      "host" : "127.0.0.1:17001"
    },
    {
      "_id" : 1,
      "host" : "127.0.0.1:17033"
    },
    {
      "_id" : 2,
      "host" : "127.0.0.1:17033"
    }
  ]
}
rs.initiate(config)
```
