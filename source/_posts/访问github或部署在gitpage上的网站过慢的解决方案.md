---
title: 访问github或部署在gitpage上的网站过慢的解决方案
categories: 🍨Akilarの棉花糖
tags: git
abbrlink: 61b3e163
date: 2020-07-29 15:53:50
---
# 写在最前

github时不时抽风，老是访问不了，诚然，用科学上网能解决一切这类问题，但是，能不翻墙还是不要翻墙的好。这里采用的是通过修改本地hosts，配置域名和IP映射关系，这样一来，当我们访问github时，这些域名可以直接从本地hosts文件中获取ip，而不需要再去DNS服务器上询问一圈。从而提高访问速度。

# 修改hosts

以windows系统为例，
hosts的路径是**C:\Windows\System32\drivers\etc**，
打开后将以下内容复制到文件最下方。
```bash
52.74.223.119 github.com
185.199.110.153 assets-cdn.github.com
151.101.228.133 avatars0.githubusercontent.com
151.101.228.133 avatars1.githubusercontent.com
185.199.109.153 documentcloud.github.com
185.199.108.154 help.github.com
13.229.189.0 nodeload.github.com
151.101.228.133 raw.github.com
140.82.114.18 status.github.com
140.82.114.18 training.github.com
185.199.110.153 github.io
```
保存后，win+X，按A，以管理员权限启动powershell，输入
```bash
ipconfig /flushdns
```

刷新DNS缓存。之后就能变快了......
{% note info %}才怪嘞，因为上述域名的IP是不停在变的，这一串映射仅仅适用于今天而已，到了明天，ip一变动，又登不上了，我总不可能天天来更新吧？{% endnote %}

# 使用爬虫脚本实时获取最新ip
{% note primary %}
转载自[weiyinfu的博客园](https://www.cnblogs.com/weiyinfu/p/6376420.html)。以下脚本为weiyinfu所原创，笔者仅做转载
{% endnote %}
需要查询ip地址的域名有这么多。手动添加肯定是不乐意的了。
```bash
github.com
assets-cdn.github.com
avatars0.githubusercontent.com
avatars1.githubusercontent.com
documentcloud.github.com
gist.github.com # gist现在被墙的很彻底，加进hosts也没用了
help.github.com
nodeload.github.com
raw.github.com
status.github.com
training.github.com
github.io
```

因为github相关的诸多域名的ip是在变动的，为了能够实时获取最新的ip，我们可以使用爬虫来从[站长之家](http://ip.chinaz.com/)或其余ip查询网站上爬取最新ip。

这里要用到python，**安装推荐使用Anaconda**，Anaconda安装方式推荐参看[Win10重装日记](https://akilarlxh.github.io/post/29cf4234.html)的3.2章节。根据Anaconda版本与python版本的对照选择自己需要的Anaconda安装包，然后直接安装即可，路径建议修改为非系统盘，同时**务必勾选将python路径加入到环境变量**的选项。

新建一个python脚本——githosts.py（最简单的方法，新建一个txt文本文件，把下面的代码粘贴进去以后，修改后缀为.py）

```bash
s = """
github.com
assets-cdn.github.com
avatars0.githubusercontent.com
avatars1.githubusercontent.com
documentcloud.github.com
gist.github.com
help.github.com
nodeload.github.com
raw.github.com
status.github.com
training.github.com
github.io
"""
import requests
from bs4 import BeautifulSoup

ans = []
for i in s.split():
    url = "http://ip.tool.chinaz.com/" + i.strip()
    resp = requests.get(url)
    soup = BeautifulSoup(resp.text,"html.parser")
    x = soup.find(class_="IcpMain02")
    x = x.find_all("span", class_="Whwtdhalf")
    x = "%s %s" % (x[5].string.strip(), i.strip())
    print(x)
    ans.append(x)

hosts = r"C:\Windows\System32\drivers\etc\hosts"
with open(hosts, "r") as f:
    content = [i for i in f.readlines() if i.startswith("#")]
    content.extend(ans)
with open(hosts, "w") as f:
    f.write("\n".join(content))
```
然后**把githosts.py放到C:\Windows\System32目录下**（不放其实也可以，只是这样一来每次都要自己cd路径。）
win+X，按A，**以管理员权限启动**powershell，输入
```
python githosts.py
```
然后脚本就会自动爬取最新的IP与域名到你的hosts文件中了。

# 可能遇到的bug
老老实实按照上面说的来，看仔细加粗的地方，就不会有下面的bug。
## python的环境变量没添加
那就是安装的时候没勾选，找到Anaconda的安装目录，在根目录里有python.exe文件，至于怎么添加还请自行百度。（其实卸载了Anaconda以后重新安装，这次记得勾选添加到环境变量也可以。顺带一提，卸载很慢哦，还不如老老实实自己添加一下）
## 缺少requests包
一般anaconda是自带一些基础包库的，没有这个包说明你是从python官网下载的python安装包。不过就算缺少，也可以通过`pip install 包名 `来安装。遇到安装速度慢的情况，就去自行百度**“pip install 换清华源”**

## 报错“NoneType' object has no attribute 'find_all”
最有可能是站长之家的域名网址变动，例如从ip.chinaz.com变为ip.tool.chinaz.com,将源代码中19行的域名改为现行网址即可。

如果是页面元素结构变化则需要通过F12查看原网页元素id或者class来确定元素位置重新改写源代码23行需要find_all的元素（也即是我们需要的ip查询结果）
