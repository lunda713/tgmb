---
title: Win10 1809 Hexo+github搭建个人博客
tags:
  - hexo
  - win10
  - git
categories:
  - Akilarの棉花糖
author: Akilar
abbrlink: 6ef63e2d
date: 2019-04-09 23:03:00
sticky: 2
---
# 写在最前

<div class="note info"><p>

最开始接触博客的契机是我第一次重装ubuntu的时候。看的是[楠皮的博客](https://blog.vanxnf.top)，之后又重装了7次ubuntu，每次都去看楠皮的博客，一个人撑起了他的博客访问量。自此，我终于意识到我也该写个博客了，一开始用到的是csdn，虽然csdn自带的网页markdown非常方便，还有快捷键支持，但是实在是架不住那边烦人的站点广告，之后也试过简书，虽然好看了许多，但是还是没有我当初浏览楠皮博客时那种丝般顺滑的感觉。</p></div>

<div class="note success"><p>最后，在无数个下定决心的双休日，我终于在前天，也即是20190407，记牢这个历史性的时刻，搭建成功了我的第一个个人博客，虽然还很简略，没什么文章，但是不急，把我那200多篇个人日记慢慢搬过来就好了。</p></div>


# 准备工作

<div class="note default"><p>首先要安装必要的软件</p></div>

##  [Node.js](https://nodejs.org/en/)

<div class="note primary"><p>

我下载的是目前最新的`11.13.0 `版本。（建议选择左边的稳定版本，右边的最新版本可能会出现莫名bug）
Node.js是基于Chrome的V8 JavaScript引擎构建的
运行在服务端的JavaScript开发平台,知道这些就够了。
反正作为一个包管理器，安装以后再也不用去打扰它的具体配置。默默运行就是了。</p></div>


##  [git](https://git-scm.com/)

<div class="note primary"><p>

我下载的是2.21.0版本，可以选择安装版，也可以选择绿色版，
不过绿色版需要加上`Git_HOME`，`%Git_HOME%\bin`之类的，我就偷懒了，
安装版一路默认安装即可。作为最强大的版本控制软件，
以后我还要专门写几篇活用教程的。

*20200719修订：这里提示一下，有些用户注册github账号时可能会遇到**“Unable to verify your captcha response”**报错，解决方案有以下三种：*
- 升级浏览器内核，其实直接下载安装最新版chrome或者Microsoft edge浏览器即可。
- 使用翻墙软件，具体怎么操作可以看另一篇博客[win10重装日记](https://akilarlxh.github.io/post/29cf4234.html)里的3.3-3.5章节。
- 把github域名添加到hosts文件中。这个操作方式请自行百度。
</p></div>


## [Atom](https://www.atom.io/)

<div class="note primary"><p>

Atom自带markdown渲染，`shift+ctrl+M`即可。而且安装简单。
界面美观，怎么吹都不过分啊。要是没有特殊需求的话这个就足够了。
事实上如果atom安装了插件之后会很酷炫，以后有空会专门写一篇来安利一下插件。
</p></div>

## [Typora](https://www.typora.io/)

 <div class="note primary"><p>typora是一个专业的markdown编辑器，比之atom的最大优势就是同步渲染速度，缺点是对于代码高亮的支持并不是很方便，自带源代码模式 ，拿来看看代码也不错</p></div>

 ## Hexo-admin
<div class="note warning"><p>

管理，而且可以拖动代码，像office word一样这是以上两个编辑器都没有的功能。
要用得先装好hexo，所以这个是后话了。</p></div>


# 安装Hexo

<div class="note primary"><p>

[Hexo官网](https://hexo.io/zh-cn/)</p></div>

<div class="note info"><p>内容仅供参考，具体搭建可以直接看下面的教程。放网页的目的是在这里可以找到全套的使用文档，而且hexo的作者是个台湾人，对中文的支持很不错。</p></div>

## 建立Hexo文件夹

<div class="note default no-icon"><p>

在你的非系统盘建立一个文件夹`Hexo`，这个习惯在[win10重装日记](https://akilarlxh.github.io/post/2f7e1a55.html)里提到过了，因为说起来个人博客和工程文件是分在一类的。</p></div>



## 更改镜像源

<div class="note default no-icon"><p>

然后在`Hexo`文件夹内`右键`->`Git Bash Here`
因为npm是国外的库，所以呢，没有翻墙的话会很慢，
事实上我就算翻墙照样慢，没办法，没有钱啊，买不起高速服务器。
亲身体会是不翻墙的话两个小时下不下一个插件，慢到怀疑人生。</p></div>

```
npm config set registry http://registry.npm.taobao.org
//这里使用的是阿里的镜像。

```
<div class="note success no-icon"><p>之后的安装就会迅速很多了。</p></div>

## 安装Hexo

<div class="note default no-icon"><p>因为已经改了镜像源，所以安装很快。不用谢我。</p></div>

```
npm install hexo-cli -g
```

## 部署Hexo

<div class="note default no-icon"><p>

依然是在`Hexo`文件夹中，在`git bash`中输入</p></div>

```
hexo init
```
## 安装插件

<div class="note default no-icon"><p>

依然是在`Hexo`文件夹中，在`git bash`中输入以下代码，虽然一股脑全放出来了，不过记得一条一条来。全部一起复制粘贴可能导致卡死~~，别问我咋知道的，说多了都是泪~~</p></div>

```
npm install hexo-generator-index --save
npm install hexo-generator-archive --save
npm install hexo-generator-category --save
npm install hexo-generator-tag --save
npm install hexo-server --save
npm install hexo-deployer-git --save
//关系到git的deploy支持，必须有。
npm install hexo-deployer-heroku --save
npm install hexo-deployer-rsync --save
npm install hexo-deployer-openshift --save
npm install hexo-renderer-marked --save
npm install hexo-renderer-stylus --save
npm install hexo-generator-feed --save
npm install hexo-generator-sitemap --save
npm install hexo-admin --save
//这就是我之前提到的hexo-admin，装了你不会后悔的。
```

## 常用命令
```
hexo clean
//清空缓存
hexo generate
hexo g //简写
//重新编译
hexo server
hexo s //简写
//打开本地访问
hexo new <layout> "文章title"
//新建文章
hexo deploy
hexo d //简写
//部署到github上，这个待会讲。
```
## 测试效果

<div class="note default no-icon"><p>

在`Hexo`右键打开`git bash`，输入</p></div>

```
hexo server
```

<div class="note default no-icon"><p>

![hexo server](https://s2.ax1x.com/2019/04/09/AomUuq.png)</p></div>

<div class="note success"><p>

然后在浏览器中打开`localhost:4000` ,就能看到
![hello world](https://s2.ax1x.com/2019/04/11/A7DdZq.png)
</p></div>

<div class="note info"><p>

如果你安装了hexo-admin插件，
就可以通过访问`localhost:4000/admin`来管理你的文章了。
并且在可视化界面中操作文章内容
恭喜你，博客的本地部署到这里算是告一段落了。</p></div>

## 补充内容

<div class="note default no-icon"><p>这部分关系到后面的主题配置，作为前瞻来写。</p></div>

### 创建“分类”页面

依然是在`Hexo`文件夹中，在`git bash`中输入

```
hexo new page categories
```
<div class="note default no-icon"><p>

打开`~/Hexo/sources/categories/index.md`
在它的头部加上`type`属性。</p></div>

```diff
---
  title: 文章分类
  date: 2017-05-27 13:47:40
+ type: "categories"
---
```
<div class="note default no-icon"><p>给文章添加分类，例：</p></div>

```
  layout: posts
  title: Win10 1809 Hexo+github搭建个人博客
  date: 2019-04-07 00:38:36
  categories: 学习笔记
  tags: [node.js, hexo]
```

### 创建“标签”页面
```
hexo new page tags
```
<div class="note default no-icon"><p>打开~/Hexo/sources/tags/index.md
在它的头部加上type属性。</p></div>

```diff
  title: tags
  date: 2018-08-06 22:48:29
+ type: "tags" #新添加的内容
```
<div class="note default no-icon"><p>给文章添加标签</p></div>

```
layout: posts
title: Win10 1809 Hexo+github搭建个人博客
date: 2019-04-07 00:38:36
categories: 学习笔记
tags: [node.js, hexo]//逗号是英文逗号
```
<div class="note default no-icon"><p>第二种写法是用-短划线列出来</p></div>

```
layout: posts
title: Win10 1809 Hexo+github搭建个人博客
date: 2019-04-07 00:38:36
categories: 学习笔记
tags:
- node.js//注意短线后有空格
- hexo
```

# 部署到GitHub

## 注册github账号

<div class="note default no-icon"><p>

首先，要有一个github账号:[github](https://github.com/)</p></div>

## 新建username.github.io仓库

<div class="note default no-icon"><p>

然后再单击`头像`->`Your repositories`
在自己的 GitHub 账号下创建一个新的仓库，命名为 `username.github.io`（username是你的账号名)。</p></div>

<div class="note warning"><p>

（20200720修订，专门写给老实孩子看的，这段主要是为了解释为啥要按照**username.github.io**这个要求来新建仓库名，不感兴趣的话跳过这段看后面的**配置Git 与 GitHub**就好，不用追根究底）
在这里，要知道，GitHub Pages 有两种类型：User/Organization Pages 和 Project Pages，而我所使用的是 User Pages。

简单来说，User Pages 与 Project Pages 的区别是：
1. User Pages 是用来展示用户的，而 Project Pages 是用来展示项目的。
2. 用于存放 User Pages 的仓库必须使用 username.github.io 的命名规则，而 Project Pages 则没有特殊的要求。
3. User Pages 将使用仓库的 master 分支，而 Project Pages 将使用 gh-pages 分支。
4. User Pages 通过 http(s)://username.github.io进行访问，而 Projects Pages 通过 http(s)://username.github.io/projectname进行访问。</p></div>

<div class="note info"><p>

- 相关资料 [GitHub Pages Basics / User, Organization, and Project Pages](https://help.github.com/articles/user-organization-and-project-pages/)</p></div>


## 配置Git 与 GitHub

<div class="note default no-icon"><p>

打开`git bash`,设置用户名称和邮件地址</p></div>

```
git config --global user.name "akilarlxh"
git config --global user.email "akilarlxh@gmail.com"
```

<div class="note default no-icon"><p>

为了能够在本地使用 git 管理 github 上的项目，需要进行一些配置，这里介绍 SSH 的方法。
检查电脑是否已经有 `SSH keys`。~~第一次安装肯定是没有的嘛~~。</p></div>

```
ssh-keygen -t rsa -C akilarlxh@gmail.com
//-C后面加你在github的用户名邮箱，这样公钥才会被github认可
less ~/.ssh/id_rsa.pub
//查看公钥内容稍后加入Github账户的sshkey中,
```
有些版本的win10可能缺少less语句支持，访问C:\Users\Username\.ssh\id_rsa.pub复制即可
(20200731修订：win10缺少C语言环境支持，可以在git bash中运行指令，笔者之前是因为使用的powershell来运行的才导致无法使用less指令）
<div class="note primary"><p>

![sshkey](https://s2.ax1x.com/2019/04/09/AoM9Re.png)</p></div>

<div class="note default no-icon"><p>

打开[github网页](https://github.com/)
单击头像->settings,在设置页面找到SSH and GPG keys
单击New SSH key
![gitkey](https://s2.ax1x.com/2019/04/09/AoMCxH.png)</p></div>

<div class="note default"><p>保存后，在git bash测试sshkey是否添加成功，输入</p></div>

```
ssh -T git@github.com
# Attempts to ssh to GitHub
```

<div class="note success"><p>

正常输出是：
The authenticity of host 'github.com (207.97.227.239)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)?
//此处请输入yes
Hi username! You've successfully authenticated, but GitHub does not
provide shell access.</p></div>

<div class="note error"><p>

可能遇到的bug,输出报错为
```
ssh: connect to host gitee.com port 22: Connection timed out
```
这是由于在当前网络环境中，端口22被占用了，我们改用其他端口再试试
```
ssh -T -p 443 git@ssh.github.com
# -p 443表示使用443端口，要是443也被占用，也可以尝试其他端口
```
</p></div>


## 配置hexo的本地配置文件

<div class="note default no-icon"><p>打开~/Hexo/_config.yml：
修改底部的deploy</p></div>

```
# 站点部署到github要配置Deployment
## Docs: http://zespia.tw/hexo/docs/deploy.html
deploy:
  type: git
  repository: git@github.com:username/username.github.io.git
  branch: master
```

<div class="note warning"><p>

这里`deploy`前面不要有`空格`，而所有`:`后面都要有空格。格式很重要。</p></div>

## 把本地hexo提交到git仓库

<div class="note default no-icon"><p>全部配置完毕，在hexo文件夹下打开git bash,执行</p></div>

```
hexo clean
hexo generate
hexo deploy
```

<div class="note danger no-icon"><p>

不出意外，就可以在浏览器上输入`https://username.github.io`访问你的博客了。</p></div>

## 可能出现的bug

<div class="note danger"><p>

报错`ERROR Deployer not found: git`</p></div>

<div class="note warning"><p>1.git用户名和邮箱配置错误，</p></div>

```
git config --global user.name%"username"
git config --global user.email%"username@example.com"
```

<div class="note default no-icon"><p>

这里的`%`，在正确的格式中是一个`空格`，如果你之前没有打空格，那么邮箱和用户名根本就没有记录进去，请把整个`4.3.配置git与github`全部重做一遍。</p></div>

<div class="note warning"><p>2.git deploy的插件没有安装正确，执行</p></div>

```
npm install hexo-deployer-git –save
```

<div class="note success"><p>之后再重新提交即可</p></div>

```
hexo deploy
```

## 域名配置

<div class="note success no-icon"><p>（20200723修订，最后还是屈服于境泽定律，实在是top域名价格太美丽，首年只要1元/年，之后续费也是25元/年，折算下来比我买v2ray服务还便宜）</p></div>

### 购买域名

<div class="note primary no-icon"><p>因为用用腾讯云的对象存储功能作为图床存储，所以我图个方便，就在腾讯云购买的top域名，其他的像阿里云的万网也是可行的。
**记得留意域名注册页面的活动优惠，直接购买域名是首年9元起步的，在活动里才能找到首年1元的选项，买的时候也要记得看之后的续费内容，不要花费多余的精力和金钱。**

- [腾讯云域名注册](https://dnspod.cloud.tencent.com/)
- [阿里云域名注册](https://wanwang.aliyun.com/)

购买成功后按照网站提示逐步完成域名实名认证和域名信息，等待下发域名证书。（我用的是腾讯云，审核速度很快，实名信息上传到电子证书下发还不到半小时）

**关于备案：**因为Hexo博客是托管在github上的，所以，除非你购买的域名是**.cn后缀的**或者你给博客使用的某些插件需要**部署在另外的云服务器**这两种情况，否则是不需要备案的。
</p></div>

### 绑定域名

<div class="note primary no-icon"><p>

1. 首先要获取博客的IP,打开cmd或者powershell，输入
```
ping username.github.io
# username记得替换成你的用户名
```
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Win10-1809-Hexo%2Bgithub%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/20200723100548766.png)


2. 获取到的ip地址填入域名解析。
这里以腾讯云为例。进入控制台->域名注册->我的域名。在购买的域名的操作栏选择解析。
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Win10-1809-Hexo%2Bgithub%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/20200723101044570.png)
3. 进入解析页面后需要添加两条记录。
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Win10-1809-Hexo%2Bgithub%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/20200723101444765.png)
4. 在**~/Hexo/source/**目录下新建**CNAME**文件（注意不要有后缀名，就叫CNAME即可，什么txt、js之类的后缀都不能有），在CNAME文件中添加上你购买的域名。
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Win10-1809-Hexo%2Bgithub%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/20200723101906965.png)
5. 配置username.github.io。打开username.github.io，点击右上角的setting
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Win10-1809-Hexo%2Bgithub%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/20200723102148239.png)
下拉找到Github Pages栏，在Custom domain中填入你购买的域名。
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Win10-1809-Hexo%2Bgithub%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/20200723102314604.png)
6. 最后，重新部署一下hexo即可通过你的域名来访问博客了。
```
hexo generate
hexo depoly
```
</p></div>


# 主题配置

<div class="note primary"><p>

我使用的nexT，理由是它界面简洁但是功能强大。
首先贴出它的使用文档
- [NexT使用文档](http://theme-next.iissnan.com/)</p></div>

<div class="note info"><p>

理论上你可以在这里找到所有使用教程。
 **参考文章**
01 [绝配：hexo+next主题及我走过的坑](https://www.jianshu.com/p/21c94eb7bcd1)
02 [Hexo NexT主题中集成gitalk评论系统](https://asdfv1929.github.io/2018/01/20/gitalk/)
03 [Hexo NexT使用Gitalk未找到相关的Issues进行评论Error:Validation Failed](https://liujunzhou.top/2018/8/10/gitalk-error/)
04 [给Hexo Next添加本地搜索功能](https://www.jianshu.com/p/608e4d2a511d)</p></div>

## 安装NexT

<div class="note default no-icon"><p>我是用的git clone的方法，文档中还有其他方法。</p></div>

```
//依然是在Hexo文件夹中，在git bash中输入
git clone https://github.com/theme-next/hexo-theme-next themes/next
//这个指令就是把NexT主题的项目文件拷贝到了~/Hexo/themes/next 路径下。
//建议找到~/Hexo/themes/next文件夹，删除里面的.git文件夹。以免在提交到Git仓库时，因为有多个.git文件夹，导致提交出错。

```

## 设置主题为NexT
<div class="note default no-icon"><p>

打开`~/Hexo/_config.yml`,找到theme行设置主题</p></div>

```
theme: next
//默认是landscape
```

## 配置NexT主题

<div class="note info"><p>

Hexo的配置文件分为站点配置文件和主题配置文件。
 -站点配置文件：` ~/Hexo/_config.yml`
 -主题配置文件：`~/Hexo/themes/next/_config.yml`
接下来我们就可以来按需配置主题内容了，
没有特别声明的，都在`~Hexo/themes/next`文件夹下的`_config.yml`文件里修改。</p></div>

### 站点 site

<div class="note primary"><p>

打开站点配置文件`~/Hexo/_config.yml`，先来修改你的站点名称</p></div>

```
# Site
title: Akilarの糖果屋 //站点名称
subtitle: Rookie programmer's growth diary //站点副标题
description: Nothing is true,everything is premited //站点描述
keywords: diary; experience; tutorial; //关键词
author: Akilar //作者
language: zh-CN //看themes/language下的文件是zh-Hans还是zh-CN
timezone:

```

<div class="note info"><p>官方文档里写的是有些配置需要将一部分代码添加到配置文件中，但其实不用，我们逐行看配置文件就会发现，有很多功能都已经放在配置文件里了，只是注释掉了，我们只需要取消注释，把需要的相关信息补全即可使用</p></div>

<div class="note primary"><p>

打开`~/Hexo/themes/next/_config.yml`</p></div>

### 菜单栏 menu
<div class="note default no-icon"><p>原生菜单栏有主页、关于、分类、标签等数个选项，但是在配置文件中是注释掉的状态，这里我们自行修改注释就行</p></div>

```
menu:
  home: / || home
  # about: /about/ || user
  tags: /tags/ || tags
  categories: /categories/ || th
  archives: /archives/ || archive
  # schedule: /schedule/ || calendar
  # sitemap: /sitemap.xml || sitemap
  # commonweal: /404/ || heartbeat
```
<div class="note warning"><p>

注意点：
如果事先没有通过hexo new page "pageName"来创建页面的话，
即使在配置文件中取消注释，页面也没法显示
我们也可以添加自己想要添加的页面，不用局限在配置文件里提供的选择里
||后面是fontAwesome里的文件对应的名称
menu_icons记得选enable: true（默认应该是true）</p></div>

### 主题风格 schemes

<div class="note default no-icon"><p>主题提供了4个，把想要的主题分格前的注释取消，保持其他三个在注释掉的状态即可。</p></div>

<div class="note danger no-icon"><p>

- Muse
![](/Win10-1809-Hexo+github搭建个人博客/20200720051912433.png)</p></div>

<div class="note warning no-icon"><p>

- Mist
![](/Win10-1809-Hexo+github搭建个人博客/20200720051938307.png)</p></div>

<div class="note success no-icon"><p>

- Pisces
![](/Win10-1809-Hexo+github搭建个人博客/20200720052003513.png)</p></div>

<div class="note info no-icon"><p>

- Gemini
![](/Win10-1809-Hexo+github搭建个人博客/20200720052029789.png)</p></div>


### 底部建站时间和图标修改
```
footer:
  # Specify the date when the site was setup.
  # If not defined, current year will be used.
  since: 2018

  # Icon between year and copyright info.
  icon: snowflake-o
  //把用户的图标从小人user改成了雪花snowflake-o

  # If not defined, will be used `author` from Hexo main config.
  copyright:
  //copyright留空，显示成页面author即我的名字
  # -------------------------------------------------------------
  # Hexo link (Powered by Hexo).
  powered: false
  //powered: false把hexo的授权图片取消了

  theme:
    # Theme & scheme info link (Theme - NexT.scheme).
    enable: false
    # Version info of NexT after scheme info (vX.X.X).
    # version: false
   //theme: enable:false 把主题的内容也取消了
```
 ### 个人社交信息 social
 ```
 social:
  GitHub: https://github.com/akilarlxh || github
  E-Mail: mailto:akialrlxh@gmail.com || envelope
  #Google: https://plus.google.com/yourname || google
  #Twitter: https://twitter.com/yourname || twitter
  #FB Page: https://www.facebook.com/yourname || facebook

  /*  ||后面对应的名称是fontAwesome里图标的名称，
     如果我们选择的账号没有对应的图标（如豆瓣、知乎），
     我们可以在fontAwesome库里去选择自己喜欢的图标
     建议不要找太新的fontAwesome图标，主题关联的
     库版本没有那么新，很可能显示不了或者显示一个地球*/
 ```
### 网站动画效果 motion
<div class="note default no-icon"><p>如果是为了网站响应速度我们可以把网站的动画关掉</p></div>

 ```
 motion:
  enable: false
 ```
 <div class="note default no-icon"><p>

 ~~但是写微博就是为了装B啊！如果不够酷炫谁要写博客啊，会睡着的好伐啦！~~
 但我觉得页面比较素，所以开了动画，
 主题自带四种效果，可以选自己喜欢的。
 我选择的是canvas-nest</p></div>

 ```
motion:
  enable: true
  async: true

# Canvas-nest
canvas_nest: true

# three_waves
three_waves: false

# canvas_lines
canvas_lines: false

# canvas_sphere
canvas_sphere: false
 ```
### 博客评论功能
 <div class="note default no-icon"><p>

 next支持很多评论插件，但是大半都被万里长城拦在墙外，剩下的不是国内大厂的阴谋就是资本家的收费陷阱。
  我现在在用的`valine`和一个插件有些兼容bug，所以以后再说。
 这里我先推荐使用gitalk，这是一个基于Github Issue 和 Preact 开发的评论插件，和github绑定，免费，登录github即可评论，而且评论支持markdown格式。而且会将每篇文章的评论放置到一个github仓库的issues里，方便管理。这里推荐直接放置到username.github.io仓库的issues。
详情可见：[gitalk demo](https://gitalk.github.io/)</p></div>

#### Register Application
<div class="note default no-icon"><p>

在GitHub上注册新应用，[Register a new OAuth application](https://github.com/settings/applications/new)
![application](https://s2.ax1x.com/2019/04/09/AoBCAU.png)</p></div>

```
参数说明：
Application name： # 应用名称，随意
Homepage URL： # 你的网站URL，如https://akilarlxh.github.io
Application description # 描述，随意
Authorization callback URL：# 网站URL，https://akilarlxh.github.io
```
<div class="note success"><p>

点击注册后，页面跳转如下，其中`Client ID`和`Client Secret`在后面的配置中需要用到，到时复制粘贴即可
![clientid](https://s2.ax1x.com/2019/04/09/AoBp7T.png)
以后可以在github->头像->setting->Developer settings->OAuth Apps->your applications name
中找到Client ID</p></div>

<div class="note warning"><p>

一条重要信息 (next在20190410以后的更新中，5.3.7.2至5.3.7.8的内容基本都已经被添加进了next的源码中，安装的是这之后的版本的读者请直接跳到5.3.7.7：在主题配置文件~/Hexo/themes/next/_config.yml中修改即可）</p></div>


---
#### gitalk.swig
<div class="note primary"><p>

新建`~/Hexo/themes/next/layout/_third-party/comments/gitalk.swig`文件，并添加内容：</p></div>

```
{% if page.comments && theme.gitalk.enable %}
  <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
  <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
   <script type="text/javascript">
   //这里一会儿要加一句
        var gitalk = new Gitalk({
          clientID: '{{ theme.gitalk.ClientID }}',
          clientSecret: '{{ theme.gitalk.ClientSecret }}',
          repo: '{{ theme.gitalk.repo }}',
          owner: '{{ theme.gitalk.githubID }}',
          admin: ['{{ theme.gitalk.adminUser }}'],
          id: location.pathname,//这个一会儿要改
          distractionFreeMode: '{{ theme.gitalk.distractionFreeMode }}'
        })
        gitalk.render('gitalk-container')           
       </script>
{% endif %}
```
#### comments.swig

<div class="note primary"><p>

修改`~/Hexo/themes/next/layout/_partials/comments.swig`，添加内容如下，与前面的elseif同一级别上：</p></div>

```
{% elseif theme.gitalk.enable %}
 <div id="gitalk-container"></div>
```
 #### index.swig
 <div class="note primary"><p>

 修改`~/Hexo/themes/next/layout/_third-party/comments/index.swig`，在最后一行添加内容：</p></div>

 ```
 {% include 'gitalk.swig' %}

 ```
 #### gitalk.styl

 <div class="note primary"><p>

 新建`~/Hexo/source/css/_common/components/third-party/gitalk.styl`文件，添加内容：</p></div>

 ```
 .gt-header a, .gt-comments a, .gt-popup a
  border-bottom: none;
.gt-container .gt-popup .gt-action.is--active:before
  top: 0.7em;
 ```
 #### third-party.styl

 <div class="note primary"><p>

 修改`~/Hexo/source/css/_common/components/third-party/third-party.styl`，在最后一行上添加内容，引入样式：</p></div>

 ```
 @import "gitalk";
 ```
 #### _config.yml

 <div class="note primary"><p>

 在主题配置文件`~/Hexo/themes/next/_config.yml`中添加如下内容：</p></div>

 <div class="note info"><p>如果是next6.0以上版本，这里就是你唯一需要修改的了，其他步骤你会发现已经整合好了</p></div>

 ```
 gitalk:
  enable: true
  githubID: github帐号  # 例：akilarlxh   
  repo: 存放issues的仓库名称   # 例：akilarlxh.github.io
  ClientID: Client ID //之前注册的application内找到复制粘贴
  ClientSecret: Client Secret //同上
  adminUser: 管理员github帐号 #指定可初始化评论的账户,如akilarlxh
  distractionFreeMode: true
 ```
#### 可能~~呸，怎么看都是肯定~~会遇到的bug


<div class="note success"><p>next6.0以上版本已经修复该bug</p></div>

<div class="note danger"><p>

评论时报错`Error:Validation Failed`</p></div>

<div class="note default"><p>

这个问题就比较复杂了，部分文章的评论区会报Error:Validation Failed,具体原因是由于 Github 限制 labal长度不能超过 50引起的，该问题解决方案来自Gitalk项目仓库 Issues115，通过`MD5加密ID`来缩短labal长度。具体操作如下：
创建或者从GitHub{% btn https://github.com/blueimp/JavaScript-MD5/blob/master/js/md5.min.js, 下载md5.min.js , download fa-lg fa-fw %}
放置到`~Hexo/themes/next/source/js/src/`目录。</p></div>



```js md5.min.js https://github.com/blueimp/JavaScript-MD5/blob/master/js/md5.min.js 下载
! function(n) {
    "use strict";
    function t(n, t) {
        var r = (65535 & n) + (65535 & t);
        return (n >> 16) + (t >> 16) + (r >> 16) << 16 | 65535 & r
    }
    function r(n, t) {
        return n << t | n >>> 32 - t
    }
    function e(n, e, o, u, c, f) {
        return t(r(t(t(e, n), t(u, f)), c), o)
    }
    function o(n, t, r, o, u, c, f) {
        return e(t & r | ~t & o, n, t, u, c, f)
    }
    function u(n, t, r, o, u, c, f) {
        return e(t & o | r & ~o, n, t, u, c, f)
    }
    function c(n, t, r, o, u, c, f) {
        return e(t ^ r ^ o, n, t, u, c, f)
    }
    function f(n, t, r, o, u, c, f) {
        return e(r ^ (t | ~o), n, t, u, c, f)
    }
    function i(n, r) {
        n[r >> 5] |= 128 << r % 32, n[14 + (r + 64 >>> 9 << 4)] = r;
        var e, i, a, d, h, l = 1732584193,
            g = -271733879,
            v = -1732584194,
            m = 271733878;
        for (e = 0; e < n.length; e += 16) i = l, a = g, d = v, h = m, g = f(g = f(g = f(g = f(g = c(g = c(g = c(g = c(g = u(g = u(g = u(g = u(g = o(g = o(g = o(g = o(g, v = o(v, m = o(m, l = o(l, g, v, m, n[e], 7, -680876936), g, v, n[e + 1], 12, -389564586), l, g, n[e + 2], 17, 606105819), m, l, n[e + 3], 22, -1044525330), v = o(v, m = o(m, l = o(l, g, v, m, n[e + 4], 7, -176418897), g, v, n[e + 5], 12, 1200080426), l, g, n[e + 6], 17, -1473231341), m, l, n[e + 7], 22, -45705983), v = o(v, m = o(m, l = o(l, g, v, m, n[e + 8], 7, 1770035416), g, v, n[e + 9], 12, -1958414417), l, g, n[e + 10], 17, -42063), m, l, n[e + 11], 22, -1990404162), v = o(v, m = o(m, l = o(l, g, v, m, n[e + 12], 7, 1804603682), g, v, n[e + 13], 12, -40341101), l, g, n[e + 14], 17, -1502002290), m, l, n[e + 15], 22, 1236535329), v = u(v, m = u(m, l = u(l, g, v, m, n[e + 1], 5, -165796510), g, v, n[e + 6], 9, -1069501632), l, g, n[e + 11], 14, 643717713), m, l, n[e], 20, -373897302), v = u(v, m = u(m, l = u(l, g, v, m, n[e + 5], 5, -701558691), g, v, n[e + 10], 9, 38016083), l, g, n[e + 15], 14, -660478335), m, l, n[e + 4], 20, -405537848), v = u(v, m = u(m, l = u(l, g, v, m, n[e + 9], 5, 568446438), g, v, n[e + 14], 9, -1019803690), l, g, n[e + 3], 14, -187363961), m, l, n[e + 8], 20, 1163531501), v = u(v, m = u(m, l = u(l, g, v, m, n[e + 13], 5, -1444681467), g, v, n[e + 2], 9, -51403784), l, g, n[e + 7], 14, 1735328473), m, l, n[e + 12], 20, -1926607734), v = c(v, m = c(m, l = c(l, g, v, m, n[e + 5], 4, -378558), g, v, n[e + 8], 11, -2022574463), l, g, n[e + 11], 16, 1839030562), m, l, n[e + 14], 23, -35309556), v = c(v, m = c(m, l = c(l, g, v, m, n[e + 1], 4, -1530992060), g, v, n[e + 4], 11, 1272893353), l, g, n[e + 7], 16, -155497632), m, l, n[e + 10], 23, -1094730640), v = c(v, m = c(m, l = c(l, g, v, m, n[e + 13], 4, 681279174), g, v, n[e], 11, -358537222), l, g, n[e + 3], 16, -722521979), m, l, n[e + 6], 23, 76029189), v = c(v, m = c(m, l = c(l, g, v, m, n[e + 9], 4, -640364487), g, v, n[e + 12], 11, -421815835), l, g, n[e + 15], 16, 530742520), m, l, n[e + 2], 23, -995338651), v = f(v, m = f(m, l = f(l, g, v, m, n[e], 6, -198630844), g, v, n[e + 7], 10, 1126891415), l, g, n[e + 14], 15, -1416354905), m, l, n[e + 5], 21, -57434055), v = f(v, m = f(m, l = f(l, g, v, m, n[e + 12], 6, 1700485571), g, v, n[e + 3], 10, -1894986606), l, g, n[e + 10], 15, -1051523), m, l, n[e + 1], 21, -2054922799), v = f(v, m = f(m, l = f(l, g, v, m, n[e + 8], 6, 1873313359), g, v, n[e + 15], 10, -30611744), l, g, n[e + 6], 15, -1560198380), m, l, n[e + 13], 21, 1309151649), v = f(v, m = f(m, l = f(l, g, v, m, n[e + 4], 6, -145523070), g, v, n[e + 11], 10, -1120210379), l, g, n[e + 2], 15, 718787259), m, l, n[e + 9], 21, -343485551), l = t(l, i), g = t(g, a), v = t(v, d), m = t(m, h);
        return [l, g, v, m]
    }

    function a(n) {
        var t, r = "",
            e = 32 * n.length;
        for (t = 0; t < e; t += 8) r += String.fromCharCode(n[t >> 5] >>> t % 32 & 255);
        return r
    }

    function d(n) {
        var t, r = [];
        for (r[(n.length >> 2) - 1] = void 0, t = 0; t < r.length; t += 1) r[t] = 0;
        var e = 8 * n.length;
        for (t = 0; t < e; t += 8) r[t >> 5] |= (255 & n.charCodeAt(t / 8)) << t % 32;
        return r
    }

    function h(n) {
        return a(i(d(n), 8 * n.length))
    }

    function l(n, t) {
        var r, e, o = d(n),
            u = [],
            c = [];
        for (u[15] = c[15] = void 0, o.length > 16 && (o = i(o, 8 * n.length)), r = 0; r < 16; r += 1) u[r] = 909522486 ^ o[r], c[r] = 1549556828 ^ o[r];
        return e = i(u.concat(d(t)), 512 + 8 * t.length), a(i(c.concat(e), 640))
    }

    function g(n) {
        var t, r, e = "";
        for (r = 0; r < n.length; r += 1) t = n.charCodeAt(r), e += "0123456789abcdef".charAt(t >>> 4 & 15) + "0123456789abcdef".charAt(15 & t);
        return e
    }
    function v(n) {
        return unescape(encodeURIComponent(n))
    }
    function m(n) {
        return h(v(n))
    }
    function p(n) {
        return g(m(n))
    }
    function s(n, t) {
        return l(v(n), v(t))
    }
    function C(n, t) {
        return g(s(n, t))
    }
    function A(n, t, r) {
        return t ? r ? s(t, n) : C(t, n) : r ? m(n) : p(n)
    }
    "function" == typeof define && define.amd ? define(function() {
        return A
    }) : "object" == typeof module && module.exports ? module.exports = A : n.md5 = A
}(this);
//# sourceMappingURL=md5.min.js.map
```
同时还要修改gitalk.swig文件
```js
{% if page.comments && theme.gitalk.enable %}
  <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
  <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
  <script type="text/javascript">
 <script src="/js/src/md5.min.js"></script> //这行是增加的

    var gitalk = new Gitalk({
      clientID: '{{ theme.gitalk.ClientID }}',
      clientSecret: '{{ theme.gitalk.ClientSecret }}',
      repo: '{{ theme.gitalk.repo }}',
      owner: '{{ theme.gitalk.githubID }}',
      admin: ['{{ theme.gitalk.adminUser }}'],
//     id: location.pathname, //这行是删去的
       id: md5(location.pathname), //替换成这行
      distractionFreeMode: '{{ theme.gitalk.distractionFreeMode }}'
    })
    gitalk.render('gitalk-container')
  </script>
{% endif %}
```
<div class="note default no-icon"><p> 其他问题看这节抬头的参考来源。</p></div>

### 全局搜索功能 local search

<div class="note info"><p>

Local Search 由 flashlab 贡献,
在[next使用文档](http://theme-next.iissnan.com/third-party-services.html#local-search)里有完备的安装指导。</p></div>

#### 安装 hexo-generator-searchdb，在站点的根目录下执行以下命令：
```
npm install hexo-generator-search --save
npm install hexo-generator-searchdb --save
```
#### 编辑 站点配置文件~/Hexo/_config.yml，新增以下内容到任意位置：

```
search:
  path: search.xml
  field: post
  format: html
  limit: 10000
  //search要顶格，“:”后要有空格，格式很重要。
```

#### 编辑 主题配置文件~/Hexo/themes/next/_config.yml，启用本地搜索功能：

```
# Local search
local_search:
  enable: true
```

# 版本控制

 ## 修改博客及部署操作

<div class="note warning"><p>

20200720修订：郑重声明，如果按照以下内容进行部署双分支，虽然可以在一个仓库内同时管理博客源码和博客生成的网页文件，但是基于博客仓库必须是开放的性质，所以你的博客源码将是完全开源的，任何人都能通过git clone拷贝你的博客源码，唯一的区别就是在没有部署SSH Key的情况下他们不可能提交到你的库内。如果觉得不能接受，可以另外新建一个保密仓库作为源码存放库。

操作方式大同小异。在hexo文件夹打开git bash，使用以下代码进行提交即可。（对博客源码没有保密需求的从下面的**创建source分支**看起即可）

  ```
//初始化git
git init
//添加文件到本地仓库
git add .
//添加文件描述信息
git commit -m "自定义内容即可"
// 远程仓库地址 //链接远程仓库，创建主分支
git remote add origin git@github.com:username/YourRepositoryName.git
//要是提示origin已经存在，那么执行
git remote rm origin
//然后再试试
git remote add origin git@github.com:username/YourRepositoryName.git
// 把远程仓库的新增的内容覆盖到本地仓库
git pull origin YourBranchName
//把本地仓库的文件推送到远程仓库的主分支，YourBranchName记得替换成分支名，一般是source
git push -u origin YourBranchName -f
//-f 是强制提交，主要是因为前后版本不一致造成的，
//然后执行以下任意一条生成网站并部署到 GitHub 上。(Hexo部署网站是根据_config.yml内的配置，所以不受影响）
hexo generate -d
hexo g -d
```
 </p></div>


 ### 创建source分支

 <div class="note primary"><p>

 首先，我们先在username.github.io仓库里做这些事情。
 在仓库中新建一个分支，命名为source
 ![new branch](https://s2.ax1x.com/2019/04/10/ATZKcn.png)
 </p></div>

 ### 然后把source设置为默认分支。

 <div class="note default"><p>

 ![default branch](https://s2.ax1x.com/2019/04/10/ATZu1s.png)
 </p></div>

 ### 第一次提交git


  <div class="note default"><p>开始准备你的第一次提交git
 修改博客内容后依次执行以下命令来提交网站相关的文件：</p></div>

 ```
 git init

 ```
  <div class="note warning"><p>

  这句在这里主要是为了在文件夹中git init让git标记此文件夹为版本库
  如果不写这句，不出意外会报错`"fatal: not a git repository (or any of the parent directories): .git"`
  和`hexo init`一样，只要第一次时运行一次就好</p></div>

```js
//添加文件到本地仓库
git add .
//添加文件描述信息
git commit -m "自定义内容即可"
// 远程仓库地址 //链接远程仓库，创建主分支
git remote add origin git@github.com:username/username.github.io.git
//要是提示origin已经存在，那么执行
git remote rm origin
//然后再试试
git remote add origin git@github.com:username/username.github.io.git
// 把远程仓库的新增的内容覆盖到本地仓库
git pull origin source
//把本地仓库的文件推送到远程仓库
git push -u origin source -f
//-f 是强制提交，主要是因为前后版本不一致造成的，
//然后执行以下任意一条生成网站并部署到 GitHub 上。
hexo generate -d
hexo g -d
```

<div class="note success"><p>

这样一来，在 GitHub 上的 username.github.io 仓库就有两个分支，
一个 `source` 分支用来存放网站的原始文件，
一个 `master` 分支用来存放生成的静态网页。</p></div>

### 可能遇到的bug

<div class="note warning"><p>

1. 通过git clone 命令下载的themes或者module文件中可能有`.git文件夹`，会有影响，所以删去，想留着以后方便升级主题也有办法，不过实在太烦，还不如删了痛快，留着教程以后重新配置主题可能还快些。比如我就是在next这个主题文件夹里有个.git文件夹。</p></div>

<div class="note danger"><p>

2. 报错:`Please make sure you have the correct access rights and the repository exists`
这个貌似是因为我们新建了分支的关系，反正它的意思就是找不到你的服务器了，如果上面操作都没问题的话建议你删除在`user/username/`下的`.ssh文件夹`，
然后重新回到`4.3.部署git和github`再配置一下你的`ssh key`。</p></div>


<div class="note warning"><p>

3. 分支依然是master
不出意外的话这里你会和我遇到一样的问题，你的分支依然是master，
所以要转到source，其实无伤大雅，反正下面提交命令还是提交到source</p></div>

```
git checkout -b source
```

<div class="note warning"><p>

4. 提示**refusing to merge unrelated histories**
意思就是，这两个合并的仓库提交历史不一致，所以拒绝合并。
那么添加上** --allow-unrelated-histories** 选项
按理说新建的分支其实不会遇到这个问题，除非之前失败现在重试
</p></div>


 ```
 git pull origin source --allow-unrelated-histories
 ```

## 博客管理流程

<div class="note info"><p>在本地对博客进行修改（添加新博文、修改样式等等）后，通过下面的流程进行管理：</p></div>

<div class="note default"><p>i.依次执行指令</p></div>

 ```
 git add .
 git commit -m "..."
 git push origin source
 ```


 <div class="note default no-icon"><p>将改动推送到 GitHub（此时当前分支应为 source）；</p></div>

 <div class="note default"><p>ii.然后才执行</p></div>


```
hexo generate -d
//或者
hexo g -d
```
<div class="note success"><p>将本地文件发布网站到 master 分支上。</p></div>


## 本地资料丢失或多PC同步

<div class="note info"><p>当重装电脑之后，或者想在其他电脑上修改博客，可以使用下列步骤：</p></div>

<div class="note default"><p>

i.使用`git clone git@github.com:Akilarlxh/Akilarlxh.github.io.git`拷贝仓库（默认分支为 source）；</p></div>

<div class="note default"><p>

ii.在本地新拷贝的username.github.io文件夹下通过终端依次执行下列指令：</p></div>

```
npm install -g hexo-cli
npm install
npm install hexo-deployer-git
```

<div class="note info"><p>这里的【username.github.io】文件夹其实就是我们一直在说的【Hexo】文件夹。
下一篇写一下ubuntu下的hexo配置，用这个方法部署文件就会很快。</p></div>

## 指令脚本

<div class="note success"><p>

每次都要反复敲那么几行指令一定会无聊，那么干脆把指令存在脚本里，每次需要用到的时候双击一下就可以高枕无忧了。
在~/Hexo文件夹下新建三个txt文件，分别命名为git-pull、git-push、hexo-publish,打开后依次在里面输入相应的命令。
- git-pull（用来从远程仓库拉取最新更改，适用于多PC或多系统端之间的版本对接）
```
git pull origin source
```
- git-push（用于提交每次的修改到远程仓库）
```
git add .
git commit -m "deploy from hexo-admin"
git push origin source
```
- hexo-publish（清空本地缓存后重新部署博客页面）
```
hexo clean
hexo generate
hexo depoly
```
之后将.txt后缀更改为.sh后缀，就是一个可执行脚本了。

</p></div>

## 指令脚本升级版

<div class="note primary"><p>
（20200821修订）
因为最近尝试用Termux在手机上进行博客编辑，学了点脚本的皮毛。写了个相对好用的脚本。

```shell
8#!/bin/sh
echo "==========================================="
echo "          欢迎来到Akilarの糖果屋！"
echo "==========================================="
HexoPath=$(cd "$(dirname "$0")"; pwd)
cd ${HexoPath}
printf "\033[32m Blog 根目录："${HexoPath}"\033[0m"
echo " "
echo "[0] 退出菜单"
echo "[1] 开启本地预览"
echo "[2] 从Github拉取最新版本"
echo "[3] 提交本地修改到GitHub"
echo "[4] 重新编译后开启本地预览"
echo "[5] 部署页面到博客网站"
echo "[6] 安装Hexo"
echo "[7] 安装ssh密钥"
echo "[8] 验证ssh密钥"
echo " "
printf "请选择需要的功能，默认选择[1]"
echo " "
printf "选择："
read answer
if [ "$answer" = "1" ] || [ "$answer" == "" ]; then
printf "\033[32mINFO \033[0m 正在启动本地预览，可以按Ctrl+C退出\n"
hexo s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "2" ]; then
printf "\033[32mINFO \033[0m 正在从Github拉取最新版本...\n"
git pull origin source
printf "\033[32mINFO \033[0m 拉取完毕，您的博客已是最新版本！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "3" ]; then
printf "\033[32mINFO \033[0m 正在提交最新修改到GitHub...\n"
git add .
git commit -m "Update posts' content"
git push origin source
printf "\033[32mINFO \033[0m 提交完毕，您的修改已上传至Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "4" ]; then
printf "\033[32mINFO \033[0m 正在清理本地缓存...\n"
Hexo clean
printf "\033[32mINFO \033[0m 正在重新编译静态页面...\n"
hexo g
printf "\033[32mINFO \033[0m 正在开启本地预览，可以按Ctrl+C退出\n"
Hexo s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "5" ]; then
printf "\033[32mINFO \033[0m 正在清理本地缓存...\n"
hexo clean
printf "\033[32mINFO \033[0m 正在重新编译静态页面...\n"
hexo g
printf "\033[32mINFO \033[0m 正在准备将最新修改部署至Hexo...\n"
hexo deploy
printf "\033[32mINFO \033[0m 部署完成，您的网站已经是最新版本！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "6" ]; then
printf "\033[32mINFO \033[0m 正在将npm源替换为阿里云镜像 ...\n"
git remote set-url origin https://github.com/Akilarlxh/Akilarlxh.github.io.git # 因为原版本可能是从gitee的镜像clone过来的，重设一下远程仓库，记得替换用户名为自己的
npm config set registry http://registry.npm.taobao.org # 替换NPM源为阿里镜像
printf "\033[32mINFO \033[0m Hexo恢复中...\n"
npm install -g hexo-cli
npm install
npm install hexo-deployer-git
printf "\033[32mINFO \033[0m 恢复完成，您可以开始您的Hexo之旅了！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "7" ]; then
printf "\033[32mINFO \033[0m 正在重新设置github global config...\n"
git config --global user.name "akilarlxh" # 记得替换用户名为自己的
git config --global user.email "akilarlxh@gmail.com" # 记得替换邮箱为自己的
ssh-keygen -t rsa -C akilarlxh@gmail.com # 记得替换邮箱为自己的
printf "\033[32mINFO \033[0m 即将打开sshkey，复制后可按 Ctrl+D 返回...\n"
less ~/.ssh/id_rsa.pub
printf "\033[32mINFO \033[0m 配置完成，请将sshkey添加到Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "8" ]; then
printf "\033[32mINFO \033[0m 正在验证SSHkey是否配置成功 ...\n"
ssh -T git@github.com
printf "\033[32mINFO \033[0m 验证完毕，您的SSHkey已成功绑定至Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "0" ]; then
printf "\033[32mINFO \033[0m 欢迎下次光临！\n"
sleep 1s
exit 0
else
printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
sleep 1s
exec ${HexoPath}/menu.sh
fi
fi
fi
fi
fi
fi
fi
fi
fi
```
复制后记得按照注释信息修改个人账户和邮箱。
界面效果如下：
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Win10-1809-Hexo%2Bgithub%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/20200821100749360.png)
</p></div>
