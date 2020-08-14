---
title: Tomcat配置教程
categories: Akilarの糖葫芦
tags: Tomcat
abbrlink: 28c6392e
date: 2019-04-29 09:54:53
---
# 写在最前

为什么写这个，因为我觉得每次都要去找很麻烦，学校有位老师的实验都是11年的遗产了，一定要用到tomcat，在Idea普及的今天，配个小插件就能搞定的事情非要配个tomcat，不管怎么解释，我都觉得这个玩意弄脏了我的电脑。就很烦你知道吗？好了，发完牢骚，该做的还是要做的。

# Tomcat下载

[Apache Tomcat](http://tomcat.apache.org/)
在页面左侧的download选择合适版本下载。
这里我下载的是绿色版的**Tomcat9 64-bit Windows zip (pgp, sha512)**，理由是方便删干净，就是这么无情。

直接解压缩，名字文件夹随你起，但是千万不要放在名字有空格或中文的路径，注意，是从磁盘到文件夹的整个路径，记得改个好记的，比如我就是**D:\Projects\Tomcat9**。

# 环境变量配置
在此之前必须已经配置好了java的环境变量。**JAVA_HOME**和**CLASSPATH**。
## CATALINA_BASE
变量值是你的tomcat路径
```
D:\Projects\Tomcat9
```

## CATALINA_HOME
变量值也是你的tomcat路径
```
D:\Projects\Tomcat9
```

## CLASSPATH
这个即是配置java时用到的CLASSPATH,在后面添加上
```
%CATALINA_HOME%\common\lib\servlet-api.jar;
```
注意加的时候在原变量值后加英文状态下的“；”,如果前面的内容末尾没有用“;”分隔记得也加上。

## Path
在path中加入
```
%CATALINA_HOME%\bin;
```
注意加的时候在原变量值后加英文状态下的“；”

# 使用

找到~/tomcat9/bin,然后按住shift，再单击右键，在此处打开powershell，输入startup，如果在powershell里弹出一堆环境变量，而且还有另一个窗口弹出的话就是成功了（乱码也没关系，这是字符集不一样造成的）。打开浏览器输入**localhost:8080**即可。
