---
title: Docker 常用命令速查
date: 2018-01-25
categories: [服务器, Docker]
tags: [Docker]
---

<img src="http://cdn.xank.cn/QQ%E6%88%AA%E5%9B%BE20180522121826.jpg" class="full-image"/>

<!--more-->

## 容器操作

docker run ：创建一个新的容器并运行一个命令

```shell
docker run
--env # 环境变量
--name # 指定名称
-d #后台运行
[image]
[cmd]
--mount #挂载目录 type=bind,source=/data/logs,target=/app/logs
```

启动与重启

```shell
docker start [container] # 启动容器


docker restart [container] # 重启容器
```

进入容器

```shell
docker exec -it [container] /bin/bash  
```

## 查看操作

列出容器

```shell
docker ps #列出正在运行的容器

docker ps -a # 查看所有容器，包括未运行的
```

查看容器详情

```shell
docker inspect [container]
```

查看容器日志

```shell
docker logs [container]
```

## 清理操作

清理终止的容器

```shell
docker container prune
```

删除虚悬镜像

```shell
docker image prune
```

## 启动容器常用配置

docker run

设置容器自动重启

```shell
--restart=always

# --restart
# always：无论容器的退出代码是什么，Docker都会自动重启该容器。
# on-failure：只有当容器的退出代码为非0值的时候才会自动重启。另外，该参数还接受一个可选的重启次数参数，`--restart=on-fialure:5`表示当容器退出代码为非0时，Docker会尝试自动重启该容器，最多5次。
```

设置时区
```shell
-e TZ="Asia/Shanghai"
```