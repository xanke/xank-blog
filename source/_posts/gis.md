---
title: GIS 相关资料整理
date: 2018-02-21
categories: [数据库]
tags: [GIS, Proj4, 地图, LeafletJS]
---

最近在研究 LeafletJS, 学习了一些 GIS 相关的资料，在这里做下整理。

<!--more-->

## Proj4

Proj4 是一个免费的 GIS 工具。主要提供了经纬度坐标与地理坐标的转换，坐标系的转换，包括基准变换等

## 我国常用投影

Albers，Lambert，Gauss－Kruger，UTM 投影。

Albers（等积投影）由于没有面积变形,所以在土地调查,植被盖度分类等涉及到要保持面积不能变形的情况.**中国的全国性地图许多采用等积投影。**

国际上称为 Albers 投影,是一种圆锥等积投影。

中国所使用的 Albers 的参数是双标准纬线，25N，47N，中央经线为 105E，椭球体为 Krassovsky。

## 坐标转换工具

https://github.com/wandergis/coordtransform

提供了百度坐标（BD09）、国测局坐标（火星坐标，GCJ02）、和WGS84坐标系之间的转换


## OSM 开源地图

OpenStreetMap（简称OSM）是一个网上地图协作计划，目标是创造一个内容自由且能让所有人编辑的世界地图。

官网：https://www.openstreetmap.org

## 相关资料

OpenStreetMap（OSM）数据方法知多少？
https://zhuanlan.zhihu.com/p/25889246

OSM 下载
http://download.geofabrik.de/asia.html
