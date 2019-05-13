---
title: Atom插件安装和推荐
date: 2019-05-13 13:37:46
categories: Akilarの糖葫芦
tags: Atom
images:
top:
---

# 安装Atom

在[Atom官网](https://atom.io/)下载对应版本，因为是个小水管，所以经常会遇到加载失败的问题，有点耐心就可以。

可以预览一下，我的配置效果是这样的。
![](/Atom插件安装和推荐/20190513014951914.png)
# 安装Atom插件

在国内希望通过Atom自带的package安装插件几乎是天方夜谭，所以我这里推荐的是使用**node.js**配合**git**来使用命令行安装。
## 安装node.js和git
同样的，需要安装node.js和git，安装方法可以对应系统版本参考我那两篇Hexo博客搭建教程。

- [Ubuntu 18.04LTS Hexo+github搭建个人博客](https://akilarlxh.github.io/post/e5502ef6.html)
- [Win10 1809 Hexo+github搭建个人博客](https://akilarlxh.github.io/post/6ef63e2d.html)

内容都是放在最前面的了，找起来很容易。

## 安装插件

安装步骤都是一样的，所以这里我拿一个汉化包插件举例，就算再怎么劝，我到底还是喜欢多一点中文啊。

打开atom，在左上角找到File->Settings->Install

在搜索框里搜索我们要的插件
**atom-simplified-chinese-menu**
![](/Atom插件安装和推荐/20190513015804849.png)
不要按右边那个醒目的Install按钮，无限加载看一下午没什么意义。

点击进入介绍界面，找到他的git仓库网址
![](/Atom插件安装和推荐/20190513020036320.png)
然后就到github了，把这个clone到atom的插件文件夹里
![](/Atom插件安装和推荐/20190513020210545.png)
在**C:\Users\用户名\.atom\packages**文件夹打开终端，输入
```
git clone https://github.com/chinakids/atom-simplified-chinese-menu

```
等待git clone 完成，通过cd命令进入这个文件夹,然后使用npm命令安装

```
cd .\atom-simplified-chinese-menu\
npm install
```
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20190513023001785.png)
npm install执行完毕后，重启一下atom就可以在Files->Settings->Packages里找到安装的插件了，启用以后就可以了。有些插件会有自定义配置，这个反正在他的介绍或者github主页里肯定会介绍的。我就不画蛇添足了。

ubuntu安装方式类似，都是要先找到atom的packages文件夹在哪里。其他都差不多的。

# 插件推荐

为了方便我直接贴github的网址了，免了打开atom搜索的部分，不用谢。

<div class="note primary"><p>[activate-power-mode](https://github.com/JoelBesada/activate-power-mode)
这是一个是代码动起来的插件，具体什么意思呢，代码删除时有一种早期红白机游戏机的特效，具体可以看插件介绍，我最初想要安装插件的动机就是这个特效。
</p></div>

<div class="note primary"><p>[atom-beautify](https://github.com/Glavin001/atom-beautify)
用来整理代码的，不过对python之类对空格对齐都有要求的代码还请谨慎使用。整理代码的快捷键是Ctrl+Alt+B。
</p></div>

<div class="note primary"><p>[file-type-icons](https://github.com/lee-dohm/file-type-icons)
会替换不同类型的文件图标，效果还不错。md风格美美哒。
</p></div>

<div class="note primary"><p>[minimap](https://github.com/atom-minimap/minimap)
类似于sublime的小地图，就是代码总览啦，蛮好看的，多个小窗口阅读的时候有点碍事的话可以在package里停用。
</p></div>

我常用的就这几个了，其他还有啥有趣的可以自己去探索。

# 总结

插件适当安装就可以了，好玩的东西可多了，但是投入太多就不好了。
