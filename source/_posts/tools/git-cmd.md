---
title: Git 常用命令
date: 2013-05-20
categories: [工具, Git]
tags: [Git]
---

<!--more-->

## Remote

```shell
git remote # 列出已存在的远程分支

# > origin

git remote -v  # 显示出详细的url地址名和对应的别名

# > origin  https://github.com/test/abc (fetch)
# > origin  https://github.com/test/abc (push)

git remote add [name] [url] # 添加远程仓库

git remote rename [name] [newName] # 重命名远程仓库

git remote remove [name] # 删除远程仓库

git remote show [name] # 查看主机详细信息
```

修改源

```shell
git remote remove origin
git remote add origin [url]
```

## 常用命令

```shell
git clone [url] # 克隆代码库

git pull # 把远程库的代码更新到工作台

git pull --rebase origin master # 强行更新本地

git fetch # 把远程库的代码更新到本地库

git add . # 把本地的修改加到stage中

git commit -m 'content' # 把stage中的修改提交到本地库

git push # 推送本地代码到远程库
```

## 维护命令

```shell
git log # 查看当前分支上面的日志信息

git status # 查看当前分支有哪些修改
```

## 配置命令
```shell
git config --global user.name [user] # 设置用户名

git config --global user.email [email] # 设置邮箱
```