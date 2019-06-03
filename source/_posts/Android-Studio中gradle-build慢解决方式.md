---
title: Android Studio安装备忘
categories: Akilarの糖葫芦
tags: Android
abbrlink: 256c7ca
date: 2019-06-02 12:24:47
images:
top:
---
# 写在最前
每次安装Android Studio都能被那超慢的速度搞崩溃，这次写下备忘，按照这个来，应该就不会那么慢了。

# 下载安装Android Studio

下载toolbox，通过它直接安装最新版本即可。
[Toolbox](https://www.jetbrains.com/toolbox/app/)
可能会打不开，只是小水管问题，多刷新几次即可。

# 打开Android Studio
首先打开科学上网，调整为全局模式，提供**稳定的网络环境**。不知道怎么做的，去看我的两篇重装日记。
- [win10 1809 机械革命深海幽灵z2 重装日记](https://akilarlxh.github.io/post/29cf4234.html)的3.3或3.4节
- [ubuntu18.04LTS 机械革命深海幽灵z2 重装日记](https://akilarlxh.github.io/post/2f7e1a55.html)的7.4节


第一次打开会提示
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Android-Studio%E4%B8%ADgradle-build%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E5%BC%8F/20190602123201095.png)
选择第二项。

在启动的时候会弹出下图
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Android-Studio%E4%B8%ADgradle-build%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E5%BC%8F/20190602123257566.png)
虽然确实会用到代理，不过我们已经配置了全局科学上网模式。所以这里我们点取消。之后全部默认安装即可。

# 新建一个项目
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Android-Studio%E4%B8%ADgradle-build%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E5%BC%8F/20190602124410404.png)
一路默认即可。

然后就是一直困扰我的**Gradle build慢**的问题。

第一次建立工程卡在该界面的时候，是因为在从网上下载gradle构建工具，科学上网都拯救不了的下载速度。这里点击取消关闭该界面，采用手动配置gradle。

点完Cancle多半还会转半天，直接关闭Android Studio即可。实在卡的时候试试按ESC键。

打开C:\Users\username\ .gradle\ wrapper\ dists
查看对应的gradle版本。
比如我就是
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Android-Studio%E4%B8%ADgradle-build%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E5%BC%8F/20190602125502131.png)
然后到gradle发布网站下载对应版本。
[Gradle distributions](http://services.gradle.org/distributions/)

之后把下载下来的压缩包放到**C:\Users\ username \ .gradle\ wrapper\ dists\ gradle-5.1.1-all\ 97z1ksx6lirer3kbvdnh7jtjg ** 里。

***不要解压！*** ***不要解压！*** ***不要解压！***

这个**97z1ksx6lirer3kbvdnh7jtjg**是自动生成的，不一定一样。

然后在打开Android Studio，重新sync project即可。

# 打开原有的工程

先把图中这四个文件删了再打开即可。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Android-Studio%E4%B8%ADgradle-build%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E5%BC%8F/20190602125942731.png)

# 参考文章

[Android studio安装与配置](https://www.cnblogs.com/xiadewang/p/7820377.html)
