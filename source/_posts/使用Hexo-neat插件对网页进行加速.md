---
title: 使用Hexo-neat插件对网页进行加速
abbrlink: d1f227cc
date: 2020-08-12 15:37:59
categories:
tags:
images:
top:
---
# 写在最前
这里不写前言，直接交代结论，用hexo-neat插件压缩静态页面，来提高响应速度，具体内容可以参考相应教程。
- [Hexo瞎折腾系列(5) - 使用hexo-neat插件压缩页面静态资源](https://blog.csdn.net/lewky_liu/article/details/82432003)
- [hexo next主题深度优化(六)，使用hexo-neat插件压缩页面，大幅度提升页面性能和响应速度](https://ilxx.gitee.io/hexo_liu_yasuo.html)

以下内容基本为对第二条教程贴的搬运，可以直接查看第二条教程了解更多细节内容。
# 安装Hexo-neat插件
```
npm install hexo-neat --save
```
# 配置
在~/Hexo/_config.yml文件添加
```
# hexo-neat
# 博文压缩
neat_enable: true
# 压缩html
neat_html:
  enable: true
  exclude:
# 压缩css  
neat_css:
  enable: true
  exclude:
    - '**/*.min.css'
# 压缩js
neat_js:
  enable: true
  mangle: true
  output:
  compress:
  exclude:
    - '**/*.min.js'
    - '**/jquery.fancybox.pack.js'
    - '**/index.js'
```

# 可能的报错
## 桃心的点击效果消失
如果参考过其他的美化教程，可能你的桃心点击效果消失了
需要在配置项的相应位置添加
```
# 压缩js
neat_js:
  enable: true
  mangle: true
  output:
  compress:
  exclude:
    - '**/*.min.js'
    - '**/jquery.fancybox.pack.js'
    - '**/index.js'  
    - '**/love.js'
```
## gitalk.js文件报错
接着在压缩js的配置项
```
- '**/comments.gitalk.js'
```
总之就是那里报错添哪里。
## 压缩html时不要跳过.md文件
.md文件就是我们写文章时的markdown文件，如果跳过压缩.md文件，而你又刚好在文章中使用到了NexT自带的tab标签，那么当hexo在生成静态页面时就会发生解析错误。这会导致使用到了tab标签的页面生成失败而无法访问。（教程原话）

## 压缩html时不要跳过.swig文件
.swig文件是模板引擎文件，简单的说hexo可以通过这些文件来生成对应的页面。如果跳过这些文件，那么你将会发现，你的所有页面完全没有起到压缩的效果，页面源代码里依然存在着一大堆空白。（教程原话）

# 那么古尔丹，代价是什么？
压缩的过程会极大的延长页面编译和部署的时间，说的通俗点，在你使用`hexo generate`指令的时候，为了压缩静态页面，编译时间被大大延长了。这也是某种意义上的等价交换吧，以我为例，我现在都不怎么敢用`Hexo clean`指令，因为文章已经接近400篇，每次重新部署需要10分钟乃至更久。