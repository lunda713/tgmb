---
title: 玩转Microsoft Edge
categories: Akilarの棉花糖
tags: Win10
abbrlink: 8c8df126
date: 2020-08-10 15:14:47
images:
top:
---
# 写在最前

最早是在楠皮教会我怎么用谷歌浏览器的时候接触到浏览器插件这种东西，要不怎么说天下浏览器出谷歌呢，国内好多打着自主研发幌子的浏览器，一看内核，都是chromium，具体就不点名了。
然后，Microsoft Edge（以下简称edge）在升级到新版以后活脱脱就是个chrome的翻版，因为用的就是谷歌的内核，edge也有自己的插件市场，所以，在导入了chrome的配置之后，我得以完美的从chrome过度到edge。

# 升级新版edge

这个非常简单，目前能找到的最新版win10的iso镜像自带的浏览器依然是老版本edge，但是打开以后就会提示是否升级，当然也可以主动访问[新版edge的官方网页](https://www.microsoft.com/zh-cn/edge)进行下载。安装完成后，如果你之前用的是chrome，那你可以直接导入chrome的使用数据。点击edge浏览器右上角的 。。。->设置->个人资料->导入浏览器数据，导入位置选择chrome或者firefox或者任何你想要的浏览器。会把chrome的插件、密码存储等等内容统统转移过来，所以要小心密码被盗。不要随意在非私人电脑上做这些操作。

# 安装插件

以下是我根据自己的日常体验保留的几个很不错的插件，可以在Microsoft Edge的扩展市场中找到。
- 直接访问[Microsoft Edge的扩展](https://microsoftedge.microsoft.com/addons?hl=zh-CN)
- 右上角。。。->扩展->获取 Microsoft Edge 扩展

## [Adguard广告拦截器](https://microsoftedge.microsoft.com/addons/detail/adguard-%E5%B9%BF%E5%91%8A%E6%8B%A6%E6%88%AA%E5%99%A8/pdffkfellgipmhklpdmokmckkkfcopbh?hl=zh-CN)
顾名思义，能够拦截大部分垃圾广告，支持自定义添加内容。安装好以后还会自动根据用户使用习惯优化拦截规则。

## [Dark mode](https://microsoftedge.microsoft.com/addons/detail/dark-mode/boldmdfoencgjfblcelefkjfafmpiahm?hl=zh-CN)
说白了就是浏览器夜间模式，不过我使用下来有些鸡肋，国内很多视频网站都做了关灯功能，腾讯视频干脆就是暗色调配色。

## [Undo Closed Tabs Button](https://microsoftedge.microsoft.com/addons/detail/undo-closed-tabs-button/hfigadnahbppkfoomjopnladdokbmnkc?hl=zh-CN)
诚如首页第一条评论所言，给残废的edge添加了一些功能。能够恢复刚刚关闭的页面。想必这是用惯了国产浏览器的用户迫切需要的功能。

## [Tampermonkey](https://microsoftedge.microsoft.com/addons/detail/tampermonkey/iikmkjmpaadaobahmlepeloendndfphd?hl=zh-CN)
油猴插件是一个用户脚本管理插件，单纯的安装它并没有什么用处，但是配合广大开发者提供的脚本，这就是神器了，有了它们，你可以在B站解除港澳台地区限制，曲线救国看新番顺便学习繁体字，也可以破解大部分视频网站的vip限制（虽然清晰度差强人意）。

脚本推荐在[Greasyfork](https://greasyfork.org/zh-CN/scripts)找。这是一个完全免费的插件分享网站。

顺便分享一下我常用的几个脚本。
### [AC-baidu:重定向优化百度搜狗谷歌必应搜索_favicon_双列](https://greasyfork.org/zh-CN/scripts/14178-ac-baidu-%E9%87%8D%E5%AE%9A%E5%90%91%E4%BC%98%E5%8C%96%E7%99%BE%E5%BA%A6%E6%90%9C%E7%8B%97%E8%B0%B7%E6%AD%8C%E5%BF%85%E5%BA%94%E6%90%9C%E7%B4%A2-favicon-%E5%8F%8C%E5%88%97)
脚本的作者更新非常积极，基本上三天两头一个小版本更新。这个脚本能够实现对大多数网页的页面重构，重定向。屏蔽广告，同时最新版本还增加了页面css自定义，美化过后的百度主页相当好看。当然高手玩家还能自己写更漂亮的网页界面。

### [My Novel Reader](https://greasyfork.org/zh-CN/scripts/292-my-novel-reader)
小说阅读脚本，统一阅读样式，内容去广告、修正拼音字、段落整理，自动下一页。（直接复制粘贴了，在用网页看轻小说的时候很好用。至于手机阅读推荐下载“阅读APP”，一个开源的阅读软件，具体使用教程可以在酷安的该软件评论区找到）

### [解除B站区域限制](https://greasyfork.org/zh-CN/scripts/25718-%E8%A7%A3%E9%99%A4b%E7%AB%99%E5%8C%BA%E5%9F%9F%E9%99%90%E5%88%B6)
所以说港澳台大陆本就是一家嘛。

# 写在最后
老生常谈了，我记得在Atom的配置教程里就有提过，插件和脚本的探索是无止境的，只要还有富有想象力的开发者在就会有无数种脚本和插件，所以尽量朝着把浏览器配置的更加方便的方向走就好，可不要为了追求花里胡哨而安装一大堆无用的装饰品来拖慢运行速度，那就得不偿失了。以上，祝各位在应用市场和插件市场里玩的愉快。
