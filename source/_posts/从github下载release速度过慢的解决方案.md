---
title: 从github下载release速度过慢的解决方案
categories: Akilarの糖葫芦
tags: git
abbrlink: '7357e481'
date: 2020-07-29 10:09:23
---

# 写在最前

昨天刚学会了git clone的加速方式，正得意满满的时候发现直接fork仓库并不会把人家的release带过来，要下载release中的各种安装包，还是得老老实实的去原来的仓库找，而github中的release托管在amazon上，从国内访问时断时续的，虽说依靠wget或者curl可以解决断点续传的问题，但是依然无益于提高那慢的可怜的下载速度。虽然科学上网就能直接解决这一方案，但是在疫情期间见识到**外国黑客组织举世攻华**的场面以后，我总算明白大学时老师对我们说的建长城是为了保护我们的话了，基于这一理由，我暂时不建议各位翻墙了。这里提供两种不用翻墙的方案。

# 使用Free Download Manager

找到需要下载的release中的安装包，右键，复制链接，粘贴到[Free Download Manager](https://d.serctl.com/?dl_start)中，提交，稍等片刻后从它这里下载即可。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E4%BB%8Egithub%E4%B8%8B%E8%BD%BDrelease%E9%80%9F%E5%BA%A6%E8%BF%87%E6%85%A2%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200729101743352.png)
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E4%BB%8Egithub%E4%B8%8B%E8%BD%BDrelease%E9%80%9F%E5%BA%A6%E8%BF%87%E6%85%A2%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200729101822410.png)
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E4%BB%8Egithub%E4%B8%8B%E8%BD%BDrelease%E9%80%9F%E5%BA%A6%E8%BF%87%E6%85%A2%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200729101901681.png)

# 使用芒果Geek开发的代下载服务
这个是芒果Geek大神开发的代下载服务网站，操作方式和上述方案基本一致。
找到需要下载的release中的安装包，右键，复制链接，粘贴到[Github代下载服务](http://g.widora.cn/)网站中，输入验证码，等待压缩完成后下载即可，体验上比Free Download Manager还要快一些。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E4%BB%8Egithub%E4%B8%8B%E8%BD%BDrelease%E9%80%9F%E5%BA%A6%E8%BF%87%E6%85%A2%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200729101743352.png)
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E4%BB%8Egithub%E4%B8%8B%E8%BD%BDrelease%E9%80%9F%E5%BA%A6%E8%BF%87%E6%85%A2%E7%9A%84%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200729102554936.png)
