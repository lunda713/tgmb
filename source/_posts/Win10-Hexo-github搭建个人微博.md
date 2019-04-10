title: Win10 Hexo+github搭建个人博客
author: Akilarlxh
tags:
  - win10
  - Hexo
  - github
  - gitalk
  - 教程贴
  - local search
categories:
  - Akilarの棉花糖
date: 2019-04-09 19:41:00
---
# 一、写在最前

最开始接触博客的契机是我第一次重装ubuntu的时候。看的是[楠皮的博客](https://blog.vanxnf.top)，之后又重装了7次ubuntu，每次都去看楠皮的博客，一个人撑起了他的博客访问量。自此，我终于意识到我也该写个博客了，一开始用到的是csdn，虽然csdn自带的网页markdown非常方便，还有快捷键支持，但是实在是架不住那边烦人的站点广告，之后也试过简书，虽然好看了许多，但是还是没有我当初浏览楠皮博客时那种丝般顺滑的感觉。

最后，在无数个下定决心的双休日，我终于在前天，也即是20190407，记牢这个历史性的时刻，搭建成功了我的第一个个人博客，虽然还很简略，没什么文章，但是不急，把我那200多篇个人日记慢慢搬过来就好了。

# 二、准备工作

首先要安装必要的软件
##  [Node.js](https://nodejs.org/en/)
```
我下载的是目前最新的11.13.0 版本。
Node.js是基于Chrome的V8 JavaScript引擎构建的
运行在服务端的JavaScript开发平台,知道这些就够了。
反正作为一个开发环境，安装以后再也不用去打扰它。
默默运行就是了。
```
##  [git](https://git-scm.com/)
```
我下载的是2.21.0版本，可以选择安装版，也可以选择绿色版，
不过绿色版需要加上Git_HOME，%Git_HOME%\bin之类的，我就偷懒了，
安装版一路默认安装即可。作为最强大的版本控制软件，
以后我还要专门写几篇活用教程的。
```
## [Atom](https://www.atom.io/)
```
Atom自带markdown渲染，shift+ctrl+M即可。而且安装简单。
界面美观，怎么吹都不过分啊。要是没有特殊需求的话这个就足够了。
之后会提到一个Hexo-admin的插件，可以直接在浏览器上管理，
这个是后话了。
```
# 三、安装Hexo
- [Hexo官网](https://hexo.io/zh-cn/)
在这里可以找到全套的使用文档，而且hexo的作者是个台湾人，对中文的支持很不错。

## 01 建立Hexo文件夹
在你的非系统盘建立一个文件夹[Hexo]，这个习惯在[win10重装日记](https://akilarlxh.github.io/2019/04/08/%E6%9C%BA%E6%A2%B0%E9%9D%A9%E5%91%BD%E6%B7%B1%E6%B5%B7%E5%B9%BD%E7%81%B5z2-win10-1809-%E9%87%8D%E8%A3%85%E6%97%A5%E8%AE%B0/)里提到过了，因为说起来个人博客和工程文件是分在一类的。

然后在**[Hexo]**文件夹内右键->Git Bash Here
因为npm是国外的库，所以呢，没有翻墙的话会很慢，
事实上我就算翻墙照样慢，没办法，没有钱啊，买不起高速服务器。
亲身体会是不翻墙的话两个小时下不下一个插件，慢到怀疑人生。
## 02 更改镜像源
```
npm config set registry http://registry.npm.taobao.org
//这里使用的是阿里的镜像。

```
之后的安装就会迅速很多了。
## 03 安装Hexo
```
npm install hexo-cli -g
```
因为已经改了镜像源，所以安装很快。不用谢我。
## 04 部署Hexo
依然是在「Hexo」文件夹中，在git bash中输入
```
hexo init
```
## 05 安装插件
一股脑全放出来了，不过记得一条一条来。
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
## 06 常用命令
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
## 07 测试效果
在Hexo右键打开git bash，输入
```
hexo server
```
![hexo server](https://s2.ax1x.com/2019/04/09/AomUuq.png)
然后在浏览器中打开**localhost:4000** ,就能看到
![Helloword](https://upload-images.jianshu.io/upload_images/9240001-1c8d78112030ec11.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/820/format/webp)

如果你安装了hexo-admin插件，
就可以通过访问**localhost:4000/admin**来管理你的文章了。
并且在可视化界面中操作文章内容
恭喜你，博客的本地部署到这里算是告一段落了。
## 08 补充内容
这部分关系到后面的主题配置，作为前瞻来写。
### 1. 创建“分类”页面
```
hexo new page categories
```
打开~/Hexo/sources/categories/index.md
在它的头部加上type属性。
```
---
title: 文章分类
date: 2017-05-27 13:47:40
type: "categories"   #这部分是新添加的
---
```
给文章添加分类，例：
```
layout: posts
title: 写给小白的express学习笔记1： express-static文件静态管理
date: 2018-06-07 00:38:36
categories: 学习笔记
tags: [node.js, express]
```
### 2. 创建“标签”页面
```
hexo new page tags
```
打开~/Hexo/sources/tags/index.md
在它的头部加上type属性。
```
title: tags
date: 2018-08-06 22:48:29
type: "tags" #新添加的内容
```
给文章添加标签
```
layout: posts
title: 写给小白的express学习笔记1： express-static文件静态管理
date: 2018-06-07 00:38:36
categories: 学习笔记
tags: [node.js, express]//逗号是英文逗号
```
第二种写法是用-短划线列出来
```
layout: posts
title: 写给小白的express学习笔记1： express-static文件静态管理
date: 2018-06-07 00:38:36
categories: 学习笔记
tags: 
- node.js//注意短线后有空格
- express
```

# 四、部署到GitHub

## 01注册github账号
首先，要有一个github账号
- [github](https://github.com/)
## 02 新建username.github.io仓库
然后在单击头像->Your repositories
在自己的 GitHub 账号下创建一个新的仓库，命名为 username.github.io（username是你的账号名)。
```
在这里，要知道，GitHub Pages 有两种类型：User/Organization Pages 和 Project Pages，而我所使用的是 User Pages。
简单来说，User Pages 与 Project Pages 的区别是：
1. User Pages 是用来展示用户的，而 Project Pages 是用来展示项目的。
2. 用于存放 User Pages 的仓库必须使用 username.github.io 的命名规则，而 Project Pages 则没有特殊的要求。
3. User Pages 将使用仓库的 master 分支，而 Project Pages 将使用 gh-pages 分支。
4. User Pages 通过 `http(s)://username.github.io` 进行访问，而 Projects Pages 通过 `http(s)://username.github.io/projectname` 进行访问。
```
- 相关资料 [GitHub Pages Basics / User, Organization, and Project Pages](https://help.github.com/articles/user-organization-and-project-pages/)

## 03 配置Git 与 GitHub
打开git bash,设置用户名称和邮件地址
```
git config --global user.name "username"
git config --global user.email "username@example.com"
```
为了能够在本地使用 git 管理 github 上的项目，需要进行一些配置，这里介绍 SSH 的方法。
检查电脑是否已经有 SSH keys。第一次安装肯定是没有的嘛。
```
ssh-keygen -t rsa -C youremail@example.com
//-C后面加你在github的用户名邮箱，这样公钥才会被github认可
less ~/.ssh/id_rsa.pub
查看公钥内容稍后加入Github账户的sshkey中
```
![sshkey](https://s2.ax1x.com/2019/04/09/AoM9Re.png)
打开[github网页](https://github.com/)
单击头像->settings,在设置页面找到SSH and GPG keys
单击New SSH key
![gitkey](https://s2.ax1x.com/2019/04/09/AoMCxH.png)

保存后，在git bash测试sshkey是否添加成功，输入
```
ssh -T git@github.com
# Attempts to ssh to GitHub
```
正常输出是：
```
The authenticity of host 'github.com (207.97.227.239)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)?
//此处请输入yes
Hi username! You've successfully authenticated, but GitHub does not
provide shell access.
```
## 04 配置hexo的本地配置文件
打开~/Hexo/_config.yml：
修改底部的deploy
```
# 站点部署到github要配置Deployment 
## Docs: http://zespia.tw/hexo/docs/deploy.html
deploy:
  type: git
  repository: git@github.com:username/username.github.io.git
  branch: master
```
这里deploy前面不要有空格，而所有“:”后面都要有空格。格式很重要。
## 05 把本地hexo提交到git仓库
全部配置完毕，在hexo文件夹下打开git bash,执行
```
hexo clean
hexo generate
hexo deploy
```
不出意外，就可以在浏览器上输入
**https://username.github.io**
访问你的博客了。
## 06 可能出现的bug
报错
```
ERROR Deployer not found: git
```
解决办法
1.git用户名和邮箱配置错误，
```
git config --global user.name%"username"
git config --global user.email%"username@example.com"
```
这里的%，在正确的格式中是一个空格，如果你之前没有打空格，那么邮箱和用户名根本就没有记录进去，请把整个第三部分全部重做一遍。
2.git deploy的插件没有安装正确，执行 
```
npm install hexo-deployer-git –save 
```
之后再使用
```
hexo deploy
```
重新提交即可

# 五、主题配置
我使用的nexT，理由是它界面简洁但是功能强大。
首先贴出它的使用文档
- [NexT使用文档](http://theme-next.iissnan.com/)
理论上你可以在这里找到所有使用教程。
- **参考文章**
- 01 [绝配：hexo+next主题及我走过的坑](https://www.jianshu.com/p/21c94eb7bcd1)
- 02 [Hexo NexT主题中集成gitalk评论系统](https://asdfv1929.github.io/2018/01/20/gitalk/)
- 03 [Hexo NexT使用Gitalk未找到相关的Issues进行评论Error:Validation Failed](https://liujunzhou.top/2018/8/10/gitalk-error/)
- 04 [给Hexo Next添加本地搜索功能](https://www.jianshu.com/p/608e4d2a511d)
## 01安装NexT

我是用的git clone的方法，文档中还有其他方法
```
$ git clone https://github.com/theme-next/hexo-theme-next

```
下载成功后建议把[hexo-theme-next]文件夹改名为[next]，并且把[next]文件夹拖动到~/Hexo/themes/下
## 02 设置主题为NexT
打开~/Hexo/_config.yml
找到theme行设置主题
```
theme: next 
//默认是landscape
```
## 03 配置NexT主题
接下来我们就可以来按需配置主题内容了，
所有内容都在themes/next文件夹下的_config.yml文件里修改。

打开~/Hexo/themes/next/_config.yml

官方文档里写的是有些配置需要将一部分代码添加到配置文件中，但其实不用，我们逐行看配置文件就会发现，有很多功能都已经放在配置文件里了，只是注释掉了，我们只需要取消注释，把需要的相关信息补全即可使用

### 001菜单栏 menu

原生菜单栏有主页、关于、分类、标签等数个选项，但是在配置文件中是注释掉的状态，这里我们自行修改注释就行
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

//注意点：
如果事先没有通过hexo new page <pageName>来创建页面的话，
即使在配置文件中取消注释，页面也没法显示
我们也可以添加自己想要添加的页面，不用局限在配置文件里提供的选择里
  
||后面是fontAwesome里的文件对应的名称

menu_icons记得选enable: true（默认应该是true）
```

### 002主题风格 schemes
```
主题提供了4个，把想要的主题分格前的注释取消，保持其他三个在注释掉的状态即可。
```
- Muse
![muse](https://upload-images.jianshu.io/upload_images/9240001-5e7193faf3720112.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000/format/webp)
- Mist
![mist](https://upload-images.jianshu.io/upload_images/9240001-dbd774ea0be0fe87.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000/format/webp)
- Pisces
![pisces](https://upload-images.jianshu.io/upload_images/9240001-327385996d44bb02.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000/format/webp)
- Gemini
![gemini](https://upload-images.jianshu.io/upload_images/9240001-0e58f7644c380210.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000/format/webp)

### 003底部建站时间和图标修改
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
 ### 004 个人社交信息 social
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
### 005 网站动画效果 motion
 如果是为了网站响应速度我们可以把网站的动画关掉
 ```
 motion:
  enable: false
 ```
 ~~但是写微博就是为了装B啊！如果不够酷炫谁要写博客啊，会睡着的好伐啦！~~
 但我觉得页面比较素，所以开了动画，
 主题自带四种效果，可以选自己喜欢的。
 我选择的是canvas-nest
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
### 006 博客评论功能
 next支持很多评论插件，但是大半都被万里长城拦在墙外，剩下的不是国内大厂的阴谋就是资本家的收费陷阱。
 这里我推荐使用gitalk，这是一个基于Github Issue 和 Preact 开发的评论插件，和github绑定，免费，登录github即可评论，而且评论支持markdown格式。

详情可见：[gitalk demo](https://gitalk.github.io/)

#### i. Register Application
在GitHub上注册新应用，
[Register a new OAuth application](https://github.com/settings/applications/new)
![application](https://s2.ax1x.com/2019/04/09/AoBCAU.png)
```
参数说明：
Application name： # 应用名称，随意
Homepage URL： # 你的网站URL，如https://akilarlxh.github.io
Application description # 描述，随意
Authorization callback URL：# 网站URL，https://akilarlxh.github.io
```
点击注册后，页面跳转如下，其中Client ID和Client Secret在后面的配置中需要用到，到时复制粘贴即可
![clientid](https://s2.ax1x.com/2019/04/09/AoBp7T.png)
以后可以在github->头像->setting->Developer settings->OAuth Apps->your applications name
中找到Client ID
#### ii.gitalk.swig
新建~/Hexo/themes/next/layout/_third-party/comments/gitalk.swig文件，并添加内容：
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
#### iii.comments.swig
修改~/Hexo/themes/next/layout/_partials/comments.swig，添加内容如下，与前面的elseif同一级别上：
```
{% elseif theme.gitalk.enable %}
 <div id="gitalk-container"></div>
 ```
 #### iv.index.swig
 修改~/Hexo/themes/next/layout/_third-party/comments/index.swig，在最后一行添加内容：
 ```
 {% include 'gitalk.swig' %}

 ```
 #### v.gitalk.styl
 
 新建~/Hexo/source/css/_common/components/third-party/gitalk.styl文件，添加内容：
 ```
 .gt-header a, .gt-comments a, .gt-popup a
  border-bottom: none;
.gt-container .gt-popup .gt-action.is--active:before
  top: 0.7em;
 ```
 #### vi.third-party.styl
 修改~/Hexo/source/css/_common/components/third-party/third-party.styl，在最后一行上添加内容，引入样式：
 ```
 @import "gitalk";
 ```
 vii._config.yml
 在主题配置文件~/Hexo/themes/next/_config.yml中添加如下内容：
 ```
 gitalk:
  enable: true
  githubID: github帐号  # 例：akilarlxh   
  repo: 仓库名称   # 例：akilarlxh.github.io
  ClientID: Client ID //之前注册的application内找到复制粘贴
  ClientSecret: Client Secret //同上
  adminUser: github帐号 #指定可初始化评论账户,如akilarlxh
  distractionFreeMode: true
```
#### viii.可能~~呸，怎么看都是肯定~~会遇到的bug，
评论时报错
```
Error:Validation Failed
/*这个问题就比较复杂了，部分文章的评论区会报Error: 
Validation Failed,具体原因是由于 Github 限制 labal 
长度不能超过 50引起的，该问题解决方案来自
Gitalk项目仓库 Issues115，通过MD5加密ID来缩短labal长度。*/

```
具体操作如下：
创建或者从GitHub下载md5.min.js文件，
放置到~Hexo/themes/next/source/js/src/目录。
[点此下载](https://github.com/blueimp/JavaScript-MD5/blob/master/js/md5.min.js)
```
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
```
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
其他问题看这节抬头的参考来源。

### 007 全局搜索功能 local search

Local Search 由 flashlab 贡献,在[next使用文档](http://theme-next.iissnan.com/third-party-services.html#local-search)里有完备的安装指导。
#### i.安装 hexo-generator-searchdb，在站点的根目录下执行以下命令：
```
npm install hexo-generator-search --save
npm install hexo-generator-searchdb --save
```
#### ii.编辑 站点配置文件~/Hexo/_config.yml，新增以下内容到任意位置：
```
search:
  path: search.xml
  field: post
  format: html
  limit: 10000
```
search要顶格，“:”后要有空格，格式很重要。
#### iii.编辑 主题配置文件~/Hexo/themes/next/_config.yml，启用本地搜索功能：
```
# Local search
local_search:
  enable: true
```
# 六、版本控制
 ## 01 修改博客及部署操作
 
 i.首先，我们先在username.github.io仓库里做这些事情。
 在仓库中新建一个分支，命名为source
 ![new branch](https://s2.ax1x.com/2019/04/10/ATZKcn.png)
 ii.然后把source设置为默认分支。
 ![default branch](https://s2.ax1x.com/2019/04/10/ATZu1s.png)
 iii.然后开始准备你的第一次提交git
 修改博客内容后依次执行以下命令来提交网站相关的文件：
 ```
 
 git init 
 //这句在这里主要是为了在文件夹中git init让git标记此文件夹为版本库
 //如果不写这句，不出意外会报错
 //"fatal: not a git repository (or any of the parent directories): .git"
 //和hexo init一样，只要第一次时运行一次就好
 git checkout -b source
 //不出意外的话这里你会和我遇到一样的问题，你的分支依然是master，
 //所以要转到source，其实无伤大雅，反正下面提交命令还是提交到source
 git add .
 //添加文件到本地仓库
 git commit -m "自定义内容即可"
 //添加文件描述信息
 git remote add origin git@github.com:username/username.github.io.git
 // 远程仓库地址 //链接远程仓库，创建主分支
 git pull origin master 
 // 把本地仓库的变化连接到远程仓库主分支
 git push -u origin source -f
//把本地仓库的文件推送到远程仓库
//-f 是强制提交，主要是因为前后版本不一致造成的，
```
然后执行以下任意一条生成网站并部署到 GitHub 上。
```  
hexo generate -d
hexo g -d
```
这样一来，在 GitHub 上的 username.github.io 仓库就有两个分支，
一个 source 分支用来存放网站的原始文件，
一个 master 分支用来存放生成的静态网页。

可能遇到的bug 

- 通过git clone 命令下载的themes或者module文件中可能有.git文件，会有影响，所以删去。比如我就是在next这个主题文件夹里有个.git文件。

- 报错
```
Please make sure you have the correct access rights and the repository exists
```
这个貌似是因为我们新建了分支的关系，反正它的意思就是找不到你的服务器了，如果上面操作都没问题的话建议你删除在user/username/下的.ssh文件夹，然后重新回到[四->03、部署git和github]再配置一下你的ssh key。

## 02.博客管理流程
 在本地对博客进行修改（添加新博文、修改样式等等）后，通过下面的流程进行管理：
 i.依次执行指令
 ```
 git add .
 git commit -m "..."
 git push origin source
 ```
 将改动推送到 GitHub（此时当前分支应为 source）；
ii.然后才执行
``` 
hexo generate -d 
//或者
hexo g -d 
```
将本地文件发布网站到 master 分支上。
## 03.本地资料丢失或多PC同步
当重装电脑之后，或者想在其他电脑上修改博客，可以使用下列步骤：
i.使用 
```
git clone git@github.com:username/username.github.io.git
```
拷贝仓库（默认分支为 source）；
ii.在本地新拷贝的username.github.io文件夹下通过终端依次执行下列指令：
```
npm install -g hexo-cli
npm install
npm install hexo-deployer-git
```
这里的【username.github.io】文件夹其实就是我们一直在说的【Hexo】文件夹。


- 下一篇写一下ubuntu下的hexo配置，用这个方法部署文件就会很快。