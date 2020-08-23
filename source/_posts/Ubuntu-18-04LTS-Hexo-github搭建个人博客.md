---
title: Ubuntu 18.04LTS Hexo+github搭建个人博客
author: Akilarlxh
tags:
  - ubuntu
  - hexo
  - git
categories:
  - Akilarの巧克力
abbrlink: e5502ef6
date: 2019-04-11 17:03:00
---
# 写在最前
<div class="note default no-icon"><p>
其实我一开始最先尝试的就是ubuntu上搭建，但是，非常遗憾的是，ubuntu的各种读写权限把我弄得死去活来。
毕竟一开始看的就是楠皮的博客来尝试的，后来发现没什么大用，不够详细倒是其次，主要是缺乏他其他几篇博客那样的普适性。怎么说呢，我花了三天时间踩坑，终于算是可以正常使用并且和win10完美同步了。
所以之后写的内容里有很多都会附加上我踩坑时的怨念。
</p></div>

---

# 准备工作


## 安装node.js和npm
直接在桌面右键打开终端，输入
```
sudo apt-get update
sudo apt-get install nodejs
sudo apt-get install npm
```

<div class="note default no-icon"><p>安装完成以后可以输入</p></div>

```
nodejs -v
npm -v
```

<div class="note default no-icon"><p>
来查看版本号确认是否安装成功。</p></div>

## 安装git
```
sudo apt-get install git
```

<div class="note default no-icon"><p>如果你是先看了我那篇ubuntu重装日记，那git应该之前就有安装过。</p></div>

## 安装Markdown编辑器

<div class="note default no-icon"><p>以下任选一个即可</p></div>

<div class="note default no-icon"><p>

1.[Atom](https://atom.io/)

Atom是一个我挺喜欢的本地文本编辑器，自带markdown插件，按shift+ctrl+m即可渲染。缺点是实时渲染效果很卡顿，不流畅啊。
下载安装.deb文件后，用dpkg命令安装</p></div>

```
sudo dpkg -i atom-amd64.deb
//若报错，就执行
sudo apt-get install -f

```

<div class="note default no-icon"><p>

2.[Typora](https://www.typora.io/)

Typora是专业的markdown编辑器，支持主题自定义，而且源代码模式和markdown模式随意切换，使用起来也很流畅。官网有各种系统的客户端安装教程</p></div>

```
# or run:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
# install typora
sudo apt-get install typora
```

<div class="note default no-icon"><p>

3.hexo-admin
除了这些软件形式的编辑器。
之后还会提到一个Hexo-admin的插件，
可以直接在浏览器上管理，前提是你要先把hexo安装好，所以这个等会再讲。</p></div>

## 踩坑点
- i、绝大多数依赖错误都可以通过这三行代码解决
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -f
```

- ii、另外要是安装特别慢的话，就别等了，可以把ubuntu的软件库换成国内源
目前我知道对于版本适配的比较好的有清华源
[清华大学 ubuntu | 镜像站 ](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)
他会自动帮你适配你的ubuntu版本。
![AHA69H.png](https://s2.ax1x.com/2019/04/11/AHA69H.png)
修改你的source.list；
为了留个备份好反悔我们先把source.list复制一份
```
sudo cp /etc/apt/source.list /etc/apt/source.list.bak
```
然后修改source.list文件
```
sudo gedit /etc/apt/source.list
```
把清华源里面的内容覆盖进去

```
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
```
之后再执行
```
sudo apt-get update
```
这样你的软件库就是清华源的了，速度能提高很多，其他第三方源也可以去找，替换方法都一样。

---

# 安装Hexo
## 已经在win10上成功搭建Hexo

<div class="note warning"><p>
首先，未看过win10下搭建Hexo的，只想在ubuntu上搭建Hexo的，请移步到下一小节（三、2）</p></div>

这里可以说一下，**如果你已经在win10上复现了我上一篇日志里写的全部内容**，~~当然，我希望你还是不要主动去复现bug。~~**并且git版本控制正常，可以正常使用git来提交源码内容到userame.github.io的source分支上。**

那么,现在我们就能很快乐的直接git clone我们已经上传到username.github.io仓库的source分支上的内容了。
```
sudo git clone git@github.com:username/username.github.io.git
```
这里如果报了权限错误
```
Permission denied (publickey). fatal: Could not read from remote repository.
```
---
- 没关系，下面来说踩坑点：

### 在管理员模式下配置git的sshkey


*在ubuntu下，普通用户和超级用户是被当成两个不同的用户的，而不是简单的权限升级。如果你是在普通用户模式下配置的sshkey，那么每当你在提交Hexo时，一旦涉及到到文件读写权限，你必须使用sudo时，对不起，秘钥显示你没有权限读写git仓库。然而诸多文件读写里面，在普通用户和超级用户之间的切换简直是剪不断理还乱。*

所以，困扰了我许多天的问题就出在这里。**我们首先要在su模式下来配置git**
```
sudo passwd
```
然后会提示你输入新的UNIX密码，密码设置ok以后，我们进入管理员模式。输入：
```
su
```
输入密码后就进入了管理员模式
![AHVaTK.png](https://s2.ax1x.com/2019/04/11/AHVaTK.png)
然后在这里配置git

```
git config --global user.name "username"
git config --global user.email "username@example.com"
ssh-keygen -t rsa -C youremail@example.com
//-C后面加你在github的用户名邮箱，这样公钥才会被github认可
//如果你已经配置过，这里会提示你是否覆盖，输入yes。
less ~/.ssh/id_rsa.pub
查看公钥内容，稍后加入Github账户的sshkey中

```
![AHVjtU.png](https://s2.ax1x.com/2019/04/11/AHVjtU.png)
打开[github网页](https://github.com/)
单击头像->settings,在设置页面找到SSH and GPG keys
单击New SSH key

![AHZAAK.png](https://s2.ax1x.com/2019/04/11/AHZAAK.png)

这部分内容和win10那篇一样了。

---
### 正确配置git后，重新尝试
找一个你觉得合适的位置打开terminal，我是在~/Documents下

```
sudo git clone git@github.com:username/username.github.io.git
```
请务必确保你有把source设置为默认分支，
否则你要是下载了一个master分支上的那些网页下来，
对不起，智商税你自己交。~~（我不会承认我已经交过一遍了）~~

```
cd username.github.io.git
sudo npm config set registry http://registry.npm.taobao.org
//这里为了提速，使用的是阿里的镜像。
sudo npm install -g hexo-cli
sudo npm install
sudo npm install hexo-deployer-git
//还有其他插件可以自己去下。
//会写在接下来的给未在win10搭建过Hexo的小伙伴的环节里。
```
好了，就这些了。对，已经可以了。你在win10流过的血泪在这一刻得到了回报。

再贴一下一些常用命令
hexo博客上的：（master分支）
```
sudo hexo clean
//清空缓存
sudo hexo generate
//重新编译，可以简写为sudo hexo g
sudo hexo server
//打开本地预览，可以简写为sudo hexo s
sudo hexo deploy
//提交到git仓库，可以简写为sudo hexo d
```
git版本控制上的：（source分支）
```
 sudo git add .
 //添加文件到本地仓库
 sudo git commit -m "自定义内容即可"
 //添加文件描述信息
 sudo git remote add origin git@github.com:username/username.github.io.git
 // 链接远程仓库，创建主分支
 sudo git push -u origin source
//把本地仓库的文件推送到远程仓库

```
## 未在win10上搭建过Hexo，只想在ubuntu下使用

### 建立Hexo文件夹
随便那个目录都行，别是回收站就成。我是安装在Documents目录下
```
cd ~/Documents
sudo mkdir Hexo
//创建目录
cd Hexo
//切换目录
```
### 更改镜像源
因为npm是国外的库，所以呢，没有翻墙的话会很慢，
事实上我就算翻墙照样慢，没办法，没有钱啊，买不起高速服务器。
亲身体会是不翻墙的话两个小时下不下一个插件，慢到怀疑人生。
```
sudo npm config set registry http://registry.npm.taobao.org
//这里使用的是阿里的镜像。
```
### 全局安装Hexo
```
sudo npm install -g hexo-cli

```
因为已经改了镜像源，所以安装很快。不用谢我。
### 部署Hexo
在**Hexo**文件夹下打开terminal，执行
```
sudo Hexo init
```
这里如果报错了的话,执行代码：（不报错就请忽略）
```
sudo npm config set user 0
sudo npm config set unsafe-perm true
sudo npm install -g hexo-cli
```

### 安装插件
虽然全部放出来了，但是我还是建议你一条一条执行，一次性全部复制粘贴可能会卡死。
```
sudo npm install hexo-generator-index --save
sudo npm install hexo-generator-archive --save
sudo npm install hexo-generator-category --save
sudo npm install hexo-generator-tag --save
sudo npm install hexo-server --save
sudo npm install hexo-deployer-git --save
//关系到git的deploy支持，必须有。
sudo npm install hexo-deployer-heroku --save
sudo npm install hexo-deployer-rsync --save
sudo npm install hexo-deployer-openshift --save
sudo npm install hexo-renderer-marked --save
sudo npm install hexo-renderer-stylus --save
sudo npm install hexo-generator-feed --save
sudo npm install hexo-generator-sitemap --save
sudo npm install hexo-admin --save
//这就是我之前提到的hexo-admin，装了你不会后悔的。

```
### 常用命令
```
sudo hexo clean
//清空缓存
sudo hexo generate
sudo hexo g //简写
//重新编译
sudo hexo server
sudo hexo s //简写
//打开本地访问
sudo hexo new <layout> "文章title"
//新建文章
sudo hexo deploy
sudo hexo d //简写
//部署到github上，这个待会讲。
```
### 测试效果
在**Hexo**下打开terminal
输入
```
sudo hexo server
//或者
sudo hexo s
```
只是预览网页的话，可以不打sudo，
但是要用hexo-admin的话，因为会涉及到文件操作，所以还是要sudo~~，既然如此，还不如受累多打四个字母~~。
![AHucIx.png](https://s2.ax1x.com/2019/04/11/AHucIx.png)
然后在浏览器中打开localhost:4000 ,就能看到
[![A7DdZq.png](https://s2.ax1x.com/2019/04/11/A7DdZq.png)](https://imgchr.com/i/A7DdZq)
如果你还安装了hexo-admin插件，
就可以通过访问**localhost:4000/admin**来管理你的文章了。
并且还可以在可视化界面中操作文章内容
恭喜你，博客的本地部署到这里算是告一段落了。

---
**注意点：在terminal中，ctrl+c无效，因为热键占用，要换成ctrl+shift+c才行**

---
### 补充内容
这部分关系到后面的主题配置，作为前瞻来写。
#### 创建“分类”页面
```
sudo hexo new page categories
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
#### 创建“标签”页面
```
sudo hexo new page tags
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

# 部署到GitHub

## 注册github账号
首先，要有一个github账号
- [github](https://github.com/)
## 新建username.github.io仓库
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

## 配置Git 与 GitHub
*之前已经说过，在ubuntu下，普通用户和超级用户是被当成两个不同的用户的，而不是简单的权限升级。如果你是在普通用户模式下配置的sshkey，那么每当你在提交Hexo时，一旦涉及到到文件读写权限，你必须使用sudo时，对不起，秘钥显示你没有权限读写git仓库。然而诸多文件读写里面，在普通用户和超级用户之间的切换简直是剪不断理还乱。所以我们要在管理员模式下设置秘钥*

打开terminal,**在管理员模式下设置用户名称和邮件地址**


```
sudo passwd
```
然后会提示你输入新的UNIX密码，密码设置ok以后，我们进入管理员模式。输入：
```
su
```
输入密码后就进入了管理员模式
![AHVaTK.png](https://s2.ax1x.com/2019/04/11/AHVaTK.png)
然后在这里配置git
```
git config --global user.name "username"
git config --global user.email "username@example.com"
```
为了能够在本地使用 git 管理 github 上的项目，需要进行一些配置，这里介绍 SSH 的方法。
检查电脑是否已经有 SSH keys。~~第一次安装肯定是没有的嘛。~~
```
ssh-keygen -t rsa -C youremail@example.com
//-C后面加你在github的用户名邮箱，这样公钥才会被github认可
less ~/.ssh/id_rsa.pub
//查看公钥内容稍后加入Github账户的sshkey中
```
![AHVjtU.png](https://s2.ax1x.com/2019/04/11/AHVjtU.png)
- 打开[github网页](https://github.com/)
- 单击头像->settings,在设置页面找到SSH and GPG keys
- 单击New SSH key

![AHZAAK.png](https://s2.ax1x.com/2019/04/11/AHZAAK.png)

保存后，在terminal中测试sshkey是否添加成功，输入
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
## 配置hexo的本地配置文件
打开 -/Hexo/_config.yml：
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

## 把本地hexo提交到git仓库
全部配置完毕，在hexo文件夹下打开terminal,执行
```
sudo hexo clean
sudo hexo generate
sudo hexo deploy
```
不出意外，就可以在浏览器上输入
**https://username.github.io**
访问你的博客了。
## 可能出现的bug
报错
```
ERROR Deployer not found: git
```
解决办法
1.git用户名和邮箱配置错误，
回到管理员模式重新配置，最坏情况是重做第四节
```
git config --global user.name%"username"
git config --global user.email%"username@example.com"
```
这里的%，在正确的格式中是一个空格，如果你之前没有打空格，那么邮箱和用户名根本就没有记录进去，请把整个第四部分全部重做一遍。
2.git deploy的插件没有安装正确，执行
```
sudo npm install hexo-deployer-git –save
```
之后再使用
```
sudo hexo deploy
```
重新提交即可

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
我使用的nexT，理由是它界面简洁但是功能强大。
首先贴出它的使用文档
- [NexT使用文档](http://theme-next.iissnan.com/)
理论上你可以在这里找到所有使用教程。
- **参考文章**
- 01 [绝配：hexo+next主题及我走过的坑](https://www.jianshu.com/p/21c94eb7bcd1)
- 02 [Hexo NexT主题中集成gitalk评论系统](https://asdfv1929.github.io/2018/01/20/gitalk/)
- 03 [Hexo NexT使用Gitalk未找到相关的Issues进行评论Error:Validation Failed](https://liujunzhou.top/2018/8/10/gitalk-error/)
- 04 [给Hexo Next添加本地搜索功能](https://www.jianshu.com/p/608e4d2a511d)
## 安装NexT

我是用的git clone的方法，文档中还有其他方法
```
sudo git clone https://github.com/theme-next/hexo-theme-next

```
下载成功后建议把[hexo-theme-next]文件夹改名为[next]，并且把[next]文件夹拖动到~/Hexo/themes/下
## 设置主题为NexT
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

### 菜单栏 menu

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

### 主题风格 schemes
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
### 博客评论功能
 next支持很多评论插件，但是大半都被万里长城拦在墙外，剩下的不是国内大厂的阴谋就是资本家的收费陷阱。
 这里我推荐使用gitalk，这是一个基于Github Issue 和 Preact 开发的评论插件，和github绑定，免费，登录github即可评论，而且评论支持markdown格式。

详情可见：[gitalk demo](https://gitalk.github.io/)

#### Register Application
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

---
**一条重要信息 (next在20190410以后的更新中，ii到viii的内容基本都已经被添加进了next的源码中，直接跳到
vii.在主题配置文件~/Hexo/themes/next/_config.yml中修改:即可）**

---

#### gitalk.swig
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
 #### gitalk.styl

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
 #### vii._config.yml
 在主题配置文件~/Hexo/themes/next/_config.yml中添加如下内容：
 （20190410以后的更新中，这部分代码已经被添加进去，搜素到以后取消注释修改即可。）
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
（20190410以后的更新中已经修复该bug）
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

### 全局搜索功能 local search

Local Search 由 flashlab 贡献,在[next使用文档](http://theme-next.iissnan.com/third-party-services.html#local-search)里有完备的安装指导。
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
```
search要顶格，“:”后要有空格，格式很重要。
#### iii.编辑 主题配置文件~/Hexo/themes/next/_config.yml，启用本地搜索功能：
```
# Local search
local_search:
  enable: true
```
# 版本控制
 ## 修改博客及部署操作


 ### 创建source分支
 首先，我们先在username.github.io仓库里做这些事情。
 在仓库中新建一个分支，命名为source
 ![new branch](https://s2.ax1x.com/2019/04/10/ATZKcn.png)
 ### 然后把source设置为默认分支。
 ![default branch](https://s2.ax1x.com/2019/04/10/ATZu1s.png)
 ### 第一次提交git
 开始准备你的第一次提交git
 修改博客内容后
 在[Hexo]下打开terminal，依次执行以下命令来提交网站相关的文件：
 ```
 sudo git init
 //这句在这里主要是为了在文件夹中git init让git标记此文件夹为版本库
 ```
如果不写这句，不出意外会报错
**"fatal: not a git repository (or any of the parent directories): .git"**
和hexo init一样，只要第一次时运行一次就好
```
 sudo git add .
 //添加文件到本地仓库
 sudo git commit -m "自定义内容即可"
 //添加文件描述信息
 sudo git remote add origin git@github.com:username/username.github.io.git
 // 远程仓库地址 //链接远程仓库，创建主分支
 ```
 //要是提示origin已经存在，那么执行
 ```
sudo git remote rm origin
 ```
 然后再试试
 ```
 sudo git pull origin source
 // 把远程仓库的新增的内容覆盖到本地仓库
 sudo git push -u origin source -f
//把本地仓库的文件推送到远程仓库
//-f 是强制提交，主要是因为前后版本不一致造成的，
```
然后执行以下任意一条生成网站并部署到 GitHub 上。
```  
sudo hexo generate -d
sudo hexo g -d
```
这样一来，在 GitHub 上的 username.github.io 仓库就有两个分支，
一个 source 分支用来存放网站的原始文件，
一个 master 分支用来存放生成的静态网页。

### 可能遇到的bug

- 通过git clone 命令下载的themes或者module文件中可能有.git文件，会有影响，所以删去。比如我就是在next这个主题文件夹里有个.git文件。

- 报错
```
Please make sure you have the correct access rights and the repository exists
```
这个貌似是因为我们新建了分支的关系，反正它的意思就是找不到你的服务器了，如果上面操作都没问题的话建议你删除在主目录home/下的.ssh文件夹，然后重新回到[四->02、部署git和github]再配置一下你的ssh key。

- 分支依然是master

不出意外的话这里你会和我遇到一样的问题，你的分支依然是master，
所以要转到source，其实无伤大雅，反正下面提交命令还是提交到source
```
sudo git checkout -b source
```

- 提示**refusing to merge unrelated histories**

意思就是，这两个合并的仓库提交历史不一致，所以拒绝合并。
那么添加上** --allow-unrelated-histories** 选项
按理说新建的分支其实不会遇到这个问题，除非之前失败现在重试
 ```
sudo git pull origin source --allow-unrelated-histories
 ```


## 博客管理流程
 在本地对博客进行修改（添加新博文、修改样式等等）后，通过下面的流程进行管理：
 i.依次执行指令
 ```
 sudo git add .
 sudo git commit -m "..."
 sudo git push origin source
 ```
 将改动推送到 GitHub（此时当前分支应为 source）；
ii.然后才执行
```
sudo hexo generate -d
//或者
sudo hexo g -d
```
将本地文件发布网站到 master 分支上。
## 本地资料丢失或多PC同步
当重装电脑之后，或者想在其他电脑上修改博客，先走一下一二的流程，之后可以使用下列步骤：
其实就是本篇一、二、三的内容
i.使用
```
sudo git clone git@github.com:username/username.github.io.git
```
拷贝仓库（默认分支为 source）；
ii.在本地新拷贝的username.github.io文件夹下通过终端依次执行下列指令：
```
sudo npm install -g hexo-cli
sudo npm install
sudo npm install hexo-deployer-git
```
这里的【username.github.io】文件夹其实就是我们一直在说的【Hexo】文件夹。
