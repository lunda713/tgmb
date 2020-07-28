---
title: git clone过慢解决方案
categories: Akilarの糖葫芦
tags: git
abbrlink: 24a51aa5
date: 2020-07-28 17:12:56
images:
top:
---

# 写在最前

git算得上是最舒适的版本控制软件了，但是因为各种各样的原因，git clone的时候往往只有几K每秒的速度，这对于急切的需要下载项目的我们来说无疑是无法接受的。其实通过一个很简单的方式就可以实现快速加载，虽然会有一些中间步骤，但是与等待几K每秒的龟爬下载比起来，这些中间步骤毫无疑问是可以接受的。

# 注册码云
[码云](https://gitee.com/)也是一个基于git的代码托管平台，而且由于是国内的服务器，所以下载速度还算令人满意（这里我真的很想说差强人意的，但是又怕被批我舞文弄墨）

# 导入仓库
注册完毕后，在首页右上角的找到**从Github/GitLab导入仓库**选项。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/git-clone%E8%BF%87%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200728052051207.png)
然后在github那边找到我们要导入的仓库地址。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/git-clone%E8%BF%87%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200728052317216.png)
把它粘贴到码云的**Git仓库URL**栏中。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/git-clone%E8%BF%87%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200728052501594.png)
如果没兴趣在码云也配置一遍SSH keys的话，记得拉到下面**点选公开**。然后导入即可。

# 直接从github导入
用github授权以后可以直接从github导入已有仓库。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/git-clone%E8%BF%87%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200728052745339.png)

# 从码云获得git clone url
进入码云的仓库，获取url，再用它来clone就快多了。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/git-clone%E8%BF%87%E6%85%A2%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88/20200728053033220.png)

# 注意事项
如果只是为了git别人的开源库，那么只看上文即可。如果是涉及到博客或者gitpages，也就是要git clone的是username.github.io这个仓库的时候，就要记得更换git remote origin，不然会提交到码云的仓库，那样对github那边是不会有任何修改的。

(其他涉及提交到github的仓库也是同样的操作）

在git clone下来的username.github.io里打开终端。输入
```
git remote get-url origin
//输出的是https://gitee.com/username/username.github.io
//重新修改为github的远程仓库地址
 git remote set-url origin https://github.com/Akilarlxh/Akilarlxh.github.io.git
 //如此一来就和从github上clone下来的一样了
```


