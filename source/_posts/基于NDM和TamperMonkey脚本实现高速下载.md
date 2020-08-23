---
title: 基于NDM和TamperMonkey脚本实现高速下载
abbrlink: e332c532
date: 2020-08-23 21:23:31
tags: [百度网盘,win10,NDM]
categories: Akilarの糖葫芦
keywords: 百度网盘,Win10
description: 使用TamperMonkey提供的网盘助手脚本配合NPM下载器，实现一定程度上的下载加速，仅作为对Pandownload失效后的代替品
top_img:
comments:
cover:
sticky:
---
# 写在最前
本意是想着在pandownload失效以后，寻找一种新的办法来增加百度网盘下载速度，但是尝试过后，发现效果比预想的还要好，几乎对任何链接都能提供下载。所以特地整理成教程。希望能够帮到那些被龟爬的下载速度折磨的欲仙欲死的人们。教程非常简单，纯粹是安装几个软件就能解决的事情，不涉及任何代码操作，所以就不放图片教程了。

# [NDM](http://www.neatdownloadmanager.com/index.php/en/)
全称是NeatDownloadManager，感觉上就是模仿IDM的一个下载软件，比IDM还要简洁，优点是完全免费，缺点是不支持BT。直接下载安装即可。如果有经济能力其实更推荐买个永久版的IDM。
为了能够在浏览器上使用它的下载功能，还需要安装NDM的浏览器插件，软件自带Chrome和Firefox的插件链接，如果是Edge用户可能暂时还没法在应用市场搜到，虽然chrome的插件包能够在一定程度上通用，考虑到不是所有人都会科学上网，这里附上插件的链接。
蓝奏云：https://wws.lanzous.com/irb02fyzt7a
安装方式是浏览器右上角->...->扩展，把插件包拖动到这里就好了。

# Tampermonkey插件
油猴插件配合GreasyFork的庞大脚本资源可以说是神器了，这里需要用到网盘助手这个脚本，油猴插件的安装方式可以参考之前写的[玩转MicrosoftEdge](https://akilar.top/posts/8c8df126.html)的教程。关于网盘助手的使用方式则是可以看脚本的介绍界面。

# 正常使用
NDM需要启动才能配合网盘助手以及NDME插件。所以正确顺序是，先打开NDM，然后用网盘助手的直链生成功能获取直链，然后右键，使用NDM下载。个人亲测效果虽然算不上惊艳，但是好歹然原本低于32KB/s的传输速度变成了500KB/s上下。要是在相对好一点的带宽网络下，应该还能进一步提高。
