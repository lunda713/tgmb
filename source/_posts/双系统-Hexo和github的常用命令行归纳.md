---
title: 双系统 Hexo和github的常用命令行归纳
author: Akilarlxh
tags:
  - ubuntu
  - hexo
  - 双系统
  - git
  - win10
categories:
  - Akilarの糖葫芦
abbrlink: 803c5fab
date: 2019-04-12 13:58:00
---
# 写在最前

因为想到每次忘记git命令的话，都要回去看一下安装教程有点麻烦，就直接把这些常用内容择出来专门做个归纳。

这里假定来看的都是win10+ubuntu双系统，为了能够在两个系统上都能正常控制Hexo的版本切换，我会分别说下在两个端的每次操作要用哪些代码。


# ubuntu：
## 打开终端
可以快捷键打开后切换目录，也可以右键->打开终端。

```
Ctrl+Alt+T
cd ~/Documents/Hexo
```
cd是切换目录，可以自己定位你自己的目录。想不起来全名没关系，按**Tab**键可以自动补全。

## git命令行操作（source分支）
这里我们假定你已经在windows那边提交过代码，那么我们在ubuntu下的代码版本是低于远程仓库的。
所以要先拉取云端上的项目。用pull命令拉取。
```
sudo git pull origin source
```
之后就可以进行编辑，这部分涉及到master分支的操作，也即是hexo的命令。

编辑完博客内容以后，要把本地的内容提交到远程仓库。
```
sudo git add .
sudo git commit -m "你的提交备注"
sudo git push -u origin source
```
## hexo命令行操作（master分支）
这里我们假定你刚刚从远程仓库拉取了最新的源码，那么现在，我们可以开始编辑博客了。
```
sudo hexo s
```
然后就能通过 [https://localhost:4000](https://localhost:4000) 预览本地页面了。
如果你安装了hexo-admin插件。
```
sudo npm install hexo-admin --save
```
就能通过 [https://localhost:4000/admin](https://localhost:4000/admin) 管理编辑你的markdown文件了。

若是提示你4000端口被占用，没关系，换个端口就好。使用 -p 命令（port缩写）。
```
sudo hexo server -p 5000
//这里我指定了5000端口
```
值得一提的是，ubuntu下terminal中，ctrl+C无法直接退出，因为热键被占用。
必须要用**Ctrl+Shift+C**才行。

编辑完成以后，先用git命令提交你的源代码到git的source分支（二、2），
然后把你的博客部署到master分支的网页上。
```
sudo hexo g -d
```
如果你修改了文章的categories或者tags的内容，因为本地的_drafts可能有缓存没有清理干净，可能导致被修改的categories或者tags残留。这里要使用clean命令清理缓存。
```
sudo hexo clean
```
## 按时间顺序走全套流程
在[Hexo]的根目录下打开terminal
```
sudo git pull origin source
sudo hexo s
//新建文章命令是[sudo hexo n "new title"],也可以通过hexo-admin插件在浏览器上新建。
|-----------------
//打开https://localhost:4000/admin编辑
//或这就在本地编辑。
|-----------------
sudo git add .
sudo git commit -m "……"
sudo git push -u origin source
sudo hexo clean
sudo hexo g -d
```

# win10：

## 打开终端
可以快捷键打开后切换目录，也可以找到文件夹以后，按住shift，右键->在此处打开powershell。
或者右键->git bash here

```
Win+X 再按 P 或 A
d:
cd /Documents/Projects/Hexo
```
d:是切换磁盘，我是把WIN10的Hexo文件目录设置在D盘，而快捷键启动是默认在C盘。其他盘的切换也是这样，盘符加上“：”即可

cd是切换目录，可以自己定位你自己的目录。想不起来全名没关系，按**Tab**键可以自动补全。

## git命令行操作（source分支）
这里我们假定你已经在ubuntu那边提交过代码，那么我们在win10下的代码版本是低于远程仓库的。
所以要先拉取云端上的项目。用pull命令拉取。
```
git pull origin source
```
之后就可以进行编辑，这部分涉及到master分支的操作，也即是hexo的命令。

编辑完博客内容以后，要把本地的内容提交到远程仓库。
```
git add .
git commit -m "你的提交备注"
git push -u origin source
```
## hexo命令行操作（master分支）
这里我们假定你刚刚从远程仓库拉取了最新的源码，那么现在，我们可以开始编辑博客了。
```
hexo s
```
然后就能通过 [https://localhost:4000](https://localhost:4000) 预览本地页面了。
如果你安装了hexo-admin插件。
```
npm install hexo-admin --save
```
就能通过 [https://localhost:4000/admin](https://localhost:4000/admin) 管理编辑你的markdown文件了。

若是提示你4000端口被占用，没关系，换个端口就好。使用 -p 命令（port缩写）。
```
hexo server -p 5000
//这里我指定了5000端口
```
编辑完成以后，先用git命令提交你的源代码到git的source分支（三、2），
然后把你的博客部署到master分支的网页上。
```
hexo g -d
```
## 按时间顺序走全套流程
在[Hexo]的根目录下打开powershell或者git bash
```
git pull origin source
hexo s
//新建文章命令是[hexo n "new title"],也可以通过hexo-admin插件在浏览器上新建。
|-----------------
//打开https://localhost:4000/admin编辑
//或这就在本地编辑。
|-----------------
git add .
git commit -m "……"
git push -u origin source
hexo clean
hexo g -d
```

## git bash和git GUI汉化
win10的git安装版自带一个git bash的终端和git GUI图形化界面，不过原则上我是要鄙弃的，毕竟用图形化界面一点也不elegant。考虑到看我教程的多半都是初学者，所以还是写一下好了。

图形化界面本身是没啥难度的，重点在于汉化。

### git bash
在git bash界面任意位置上右键->Options..->Window->UI language->zh_CN,然后点击右下角的Apply。
### git gui
git gui没有直接的汉化设置，需要我们自己替换他的字符集。先下载[stayor的汉化项目](https://github.com/stayor/git-gui-zh)，也可以git clone
```
git clone https://github.com/stayor/git-gui-zh.git
```
然后把项目中的**zh_cn.msg**文件复制到**$GITROOT/mingw64/share/gitk/lib/msgs/zh_cn.msg**路径下
例如windows默认安装路径是：**C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\zh_cn.msg**
