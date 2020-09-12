---
title: Ubuntu安装盘制作教程
categories:
  - 🍫Akilarの巧克力
tags:
  - 🍫Unbutu
  - 💠系统重装
author: Akialrlxh
description: 本文所用Ubuntu系统版本为Ubuntu 18.04LTS，其余版本也适用。
abbrlink: 328a67be
date: 2019-04-08 14:42:00
---
# 写在最前
<div class="note info"><p>严格来说这是一个杂交搬运贴，但是当时那些出处我已经懒得贴了。算上这次，已经是我第6次重装Ubuntu了，往往倒不是说Ubuntu挂了，就是每次依赖安装失败以后我都懒得去看那剪不断理还乱的文件分支，总觉得这样的系统就脏了，不是纯洁的样子了。不能接受。还不如重装来的痛快。</p></div>



# 安装准备
<div class="note default no-icon"><p>

首先肯定要有一个`Ubuntu安装U盘`，这个网上傻瓜式教程太多了，
哪怕是我的体质也没在这个步骤遇到过问题
~~（事实上一直是借用楠皮的U盘，我自己的U盘老是识别不出来）。~~
不过今天我从吉皮哪里搞到了一个U盘，Ubuntu安装盘不用太好，
usb2.0，8g以上绰绰有余了。正好因为独显驱动导致外接屏幕无法识别了，闹心，干脆再重装。
首先在`Win10`里把U盘`格式化`，选择`FAT32`的格式。</p></div>



# 从Ubuntu官网下载镜像文件

<div class="note primary"><p>

[Ubuntu download](https://www.ubuntu.com/download/desktop)</p></div>


<div class="note default no-icon"><p>我这会是Ubuntu18.04.2LTS，下面还有个18.10的，怎么说呢，学软件的应该都知道越新的版本越有风险吧。还是选择长期支持的稳定版本好了。
  如果有钟情于老版本的，这里附上Ubuntu历史版本的镜像库：</p></div>



 <div class="note primary"><p>

 [Ubuntu history mirror](http://mirrors.melbourne.co.uk/ubuntu-releases/)</p></div>



# 下载ultriso
<div class="note default no-icon"><p>这个直接官网下载一下就好，反正只用一次。</p></div>

<div class="note primary"><p>

[ultriso](https://cn.ultraiso.net/xiazai.html)</p></div>

<div class="note default no-icon"><p>试用版就可以了，没必要去找那些破解版。</p></div>






# 制作安装盘

<div class="note default no-icon"><p>后面直接照搬一下人家的图文教程</p></div>

## 1
<div class="note default"><p>

![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612071928636.png)

</p></div>


## 2
<div class="note default"><p>

按照下图中红色字体说明，选择你需要制作的Ubuntu版本，点击`打开`按钮
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072049787.png)
</p></div>

## 3
<div class="note default"><p>

选择`启动`--`写入硬盘映像`
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072019938.png)</p></div>

## 4
<div class="note default"><p>

在写入方式中选择`USB-HDD`或者`USB-HDD+`（两者均可，默认是USB-HDD+），然后点击`便捷启动`：
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072115995.png)</p></div>

## 5
<div class="note primary"><p>

选择`便捷启动`--`写入新的驱动器引导扇区`--`Syslinux`，然后在跳出的窗口中点击`是`，最后会提示`引导扇区写入成功`，然后点击`确定`：
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072149401.png)
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072206677.png)
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072222507.png)</p></div>


## 6
<div class="note warning"><p>

选择`写入`，会提示`你确定继续操作吗？`，选择`是`：
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072240039.png)</p></div>

## 7
<div class="note success"><p>

等到`完成比例`达到`100%`，就制作完成了，可以关闭ultriso了：
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/20190612072256306.png)</p></div>
