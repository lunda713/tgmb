title: ubuntu18.04LTS安装盘制作教程
categories:
  - Akilarの巧克力
tags:
  - ubuntu
  - 启动盘制作
  - 系统重装
author: Akialrlxh
date: 2019-04-08 14:42:00
---
# 一、写在最前
严格来说这是一个杂交搬运贴，但是当时那些出处我已经懒得贴了。算上这次，已经是我第6次重装ubuntu了，往往倒不是说ubuntu挂了，就是每次依赖安装失败以后我都懒得去看那剪不断理还乱的文件分支，总觉得这样的系统就脏了，不是纯洁的样子了。不能接受。还不如重装来的痛快。

# 二、安装准备

首先肯定要有一个ubuntu安装U盘，这个网上傻瓜式教程太多了，
哪怕是我的体质也没在这个步骤遇到过问题
~~（事实上一直是借用楠皮的U盘，我自己的U盘老是识别不出来）。~~
不过今天我从吉皮哪里搞到了一个U盘，Ubuntu安装盘不用太好，
usb2.0，8g以上绰绰有余了。正好因为独显驱动导致外接屏幕无法识别了，闹心，干脆再重装。
首先在win10里把U盘格式化，选择FAT32的格式。

# 三、从ubuntu官网下载镜像文件
[ubuntu download](https://www.ubuntu.com/download/desktop)
 我这会是Ubuntu18.04.2LTS，下面还有个18.10的，怎么说呢，学软件的应该都知道越新的版本越有风险吧。还是选择长期支持的稳定版本好了。
 如果有钟情于老版本的，这里附上Ubuntu历史版本的镜像库：
 [ubuntu history mirror](http://mirrors.melbourne.co.uk/ubuntu-releases/)

# 四、下载ultriso

这个直接官网下载一下就好，反正只用一次。
[ultriso](https://cn.ultraiso.net/xiazai.html)
试用版就可以了，没必要去找那些破解版。

# 五、制作安装盘

后面直接照搬一下人家的图文教程
![03](https://img-blog.csdn.net/20180729095536644?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

按照下图中红色字体说明，选择你需要制作的Ubuntu版本，点击打开按钮
![04](https://img-blog.csdn.net/20180729100056848?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

选择“启动”--“写入硬盘映像”
![05](https://img-blog.csdn.net/20180729100401962?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

在写入方式中选择"USB-HDD”或者"USB-HDD+"（两者均可，默认是USB-HDD+），然后点击“便捷启动”：
![06](https://img-blog.csdn.net/2018072910082775?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

 选择“便捷启动”--“写入新的驱动器引导扇区”--“Syslinux”，然后在跳出的窗口中点击“是”，最后会提示“引导扇区写入成功”，然后点击“确定”：
![0701](https://img-blog.csdn.net/20180729101335112?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
![0702](https://img-blog.csdn.net/2018072910143113?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
![0703](https://img-blog.csdn.net/20180729101512370?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

选择“写入”，会提示“你确定继续操作吗？”，选择“是”：
![08](https://img-blog.csdn.net/20180729101800746?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

等到“完成比例”达到100%，就制作完成了，可以关闭ultriso了：
![9](https://img-blog.csdn.net/20180729102007154?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dhbnlxMDc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)