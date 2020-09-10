---
title: 给博客添加一个会说话能换装的live2d看板娘
images:
abbrlink: 5b8f515f
date: 2020-08-12 14:10:43
categories: Akilarの糖葫芦
tags:
  - hexo
  - 看板娘
  - live2d
cover: https://cdn.jsdelivr.net/gh/pangao1990/pangao1990.github.io/pic/Hexo%E5%8D%9A%E5%AE%A2NexT%E4%B8%BB%E9%A2%98%E7%BE%8E%E5%8C%96%E4%B9%8B%E6%96%B0%E5%A2%9E%E7%9C%8B%E6%9D%BF%E5%A8%98-1.gif
---
# 写在最前
最早的时候看别人的博客很多都有一个可爱的看板娘，然后就找了教程给自己也整了一个。因为找到的教程都是稂莠不齐的，原作者自己说的也略显含糊（其实是我自己看不懂）。总之秉承着一如既往的小白风格。把网上的教程做个整合。

# Hexo自带看板娘（不会说话，不能换装）
首先是博客自带的看板娘，这孩子不会说话也不能换装，只会跟着你的鼠标晃动脑袋，不过有几款超可爱。
先放一下出处
- [作者的github](https://github.com/xiazeyu/live2d-widget-models)
- [模型预览](https://huaji8.top/post/live2d-plugin-2.0/)

## 安装
在Hexo根目录下打开终端，输入以下指令安装必要插件。
```
npm install --save hexo-helper-live2d
```
## 配置
打开hexo站点配置文件（~Hexo/_config.yml)
搜索live2d,按照如下注释内容指示进行操作。
如果没有搜到live2d的配置项，就直接把以下内容复制到最底部。
```
# Live2D
## https://github.com/EYHN/hexo-helper-live2d
live2d:
  enable: true
  # enable: false
  scriptFrom: local # 默认
  pluginRootPath: live2dw/ # 插件在站点上的根目录(相对路径)
  pluginJsPath: lib/ # 脚本文件相对与插件根目录路径
  pluginModelPath: assets/ # 模型文件相对与插件根目录路径
  # scriptFrom: jsdelivr # jsdelivr CDN
  # scriptFrom: unpkg # unpkg CDN
  # scriptFrom: https://cdn.jsdelivr.net/npm/live2d-widget@3.x/lib/L2Dwidget.min.js # 你的自定义 url
  tagMode: false # 标签模式, 是否仅替换 live2d tag标签而非插入到所有页面中
  debug: false # 调试, 是否在控制台输出日志
  model:
    use: live2d-widget-model-wanko # npm-module package name
    # use: wanko # 博客根目录/live2d_models/ 下的目录名
    # use: ./wives/wanko # 相对于博客根目录的路径
    # use: https://cdn.jsdelivr.net/npm/live2d-widget-model-wanko@1.0.5/assets/wanko.model.json # 你的自定义 url
  display:
    position: right
    width: 150
    height: 300
  mobile:
    show: true # 手机中是否展示
```
完成后保存修改，在Hexo根目录下运行指令
```
hexo clean
hexo g
hexo s
```
之所以必须要使用hexo clean是因为我们需要清空缓存重新生成静态页面，不然看板娘没被加入生成的静态页面里，是不会出现的。

## 更换看板娘
同样是在Hexo根目录下，打开终端，选择想要的看板娘进行安装，例如我这里用到的是 **live2d-widget-model-koharu**，一个Q版小正太。
（其他的模型也可以在[模型预览](https://huaji8.top/post/live2d-plugin-2.0/)里查看以供选择。
输入指令
```
npm install --save live2d-widget-model-koharu
```
然后在配置文件里找到model项修改为期望的模型。
```
  model:
    use: live2d-widget-model-koharu
    # 默认为live2d-widget-model-wanko
```
之后按部就班的运行
```
hexo clean
hexo g
hexo s
```
就能在localhost:4000上查看效果了。
## 卸载看板娘
卸载插件和卸载模型的指令都是通过npm进行操作的。
```
npm uninstall hexo-helper-live2d
npm uninstall live2d-widget-model-modelname
```
卸载后为了保证配置项不出错，记得把**~Hexo/_config.yml**里的配置项给注释或者删除掉。

# 大神魔改看板娘（会说话，能换装）
![](https://cdn.jsdelivr.net/gh/pangao1990/pangao1990.github.io/pic/Hexo%E5%8D%9A%E5%AE%A2NexT%E4%B8%BB%E9%A2%98%E7%BE%8E%E5%8C%96%E4%B9%8B%E6%96%B0%E5%A2%9E%E7%9C%8B%E6%9D%BF%E5%A8%98-1.gif)
照例先放
- [作者的github](https://github.com/stevenjoezhang/live2d-widget)
- [预览效果](https://mi.js.org/live2d-widget/demo/demo.html)
- [参考教程](https://blog.csdn.net/qq_39610915/article/details/90679768?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.channel_param&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.channel_param)

## 安装
{% tabs 看板娘配置,-1 %}
<!-- tab 💫next主题 -->
在next主题的source目录下（~Hexo/themes/next/source/)打开终端,输入
```bash
git clone https://github.com/stevenjoezhang/live2d-widget.git live2d-widget
```
这行指令的意思就是clone这个项目到source路径下并重命名为live2d-widget。~~emm，貌似本来就叫live2d-widget。反正算是一个踩坑点。~~如果是用下载项目压缩包，解压后放到这里的，也记得把文件夹**更名为live2d-widget**。

1. 第一步
找到路径~Hexo\themes\next\source\live2d-widget\autoload.js，打开**autoload.js**，
找到
```js
const live2d_path = "https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/";
```
修改为
```js
const live2d_path = "/live2d-widget/";
```
~~引用一下教程原话：autoload.js中的注释的绝对地址指的是，将资源打包放到hexo/theme/next/source中后，**以hexo/theme/next/source为根目录（/）的绝对路径~~

2. 第二步

在/themes/next/layout/_layout.swing中,

在< head >标签中添加如下内容以增加jQuery和font-awesome依赖。
```html
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css"/>
```
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E7%BB%99%E5%8D%9A%E5%AE%A2%E6%B7%BB%E5%8A%A0%E4%B8%80%E4%B8%AA%E4%BC%9A%E8%AF%B4%E8%AF%9D%E8%83%BD%E6%8D%A2%E8%A3%85%E7%9A%84live2d%E7%9C%8B%E6%9D%BF%E5%A8%98/20200812030316962.png)

在< body >标签中新增如下内容，
```html
<script src="/live2d-widget/autoload.js"></script>
```
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E7%BB%99%E5%8D%9A%E5%AE%A2%E6%B7%BB%E5%8A%A0%E4%B8%80%E4%B8%AA%E4%BC%9A%E8%AF%B4%E8%AF%9D%E8%83%BD%E6%8D%A2%E8%A3%85%E7%9A%84live2d%E7%9C%8B%E6%9D%BF%E5%A8%98/20200812025853981.png)
3. 第三步

在**主题配置文件~/Hexo/themes/next/_config.yml**底部添加如下内容
```yml
live2d:
  enable: true
```
保存所有文件的修改，然后照例执行
```bash
hexo clean
hexo g
hexo s
```
就能在localhost:4000看到预览了。

4. 自定义修改
有一定前端基础的小伙伴可以通过修改~Hexo\themes\next\source\live2d-widget路径下的
- waifu-tips.js 包含了按钮和对话框的逻辑
- waifu-tips.json 中定义了触发条件（selector，CSS 选择器）和触发时显示的文字（text）；
- waifu.css 是看板娘的样式表。
对看板娘的位置布局等做自定义修改。
<!-- endtab -->
<!-- tab 🦋butterfly主题 -->
在butterfly主题的source目录下（~Hexo/themes/butterfly/source/)打开终端,输入
```bash
git clone https://github.com/stevenjoezhang/live2d-widget.git live2d-widget
```
这行指令的意思就是clone这个项目到source路径下并重命名为live2d-widget。~~emm，貌似本来就叫live2d-widget。反正算是一个踩坑点。~~如果是用下载项目压缩包，解压后放到这里的，也记得把文件夹**更名为live2d-widget**。

1. 第一步
找到路径~Hexo\themes\butterfly\source\live2d-widget\autoload.js，打开**autoload.js**，
找到
```js
const live2d_path = "https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/";
```
修改为
```js
const live2d_path = "/live2d-widget/";
```
~~引用一下教程原话：autoload.js中的注释的绝对地址指的是，将资源打包放到hexo/theme/butterfly/source中后，**以hexo/theme/butterfly/source为根目录（/）的绝对路径~~

2. 第二步

在butterfly的主题配置文件_config.butterfly.yml中,
找到inject，添加如下内容以增加jQuery和font-awesome依赖。
然后引入live2d-widget的autoload.js。

```diff
# Inject
# Insert the code to head (before '</head>' tag) and the bottom (before '</body>' tag)
# 插入代码到头部 </head> 之前 和 底部 </body> 之前
inject:
  head:
    # - <link rel="stylesheet" href="/xxx.css">
  + - <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
  + - <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css"/>
  bottom:
    # - <script src="xxxx"></script>
  + - <script src="/live2d-widget/autoload.js"></script>
```
3. 第三步

在**butterfly主题配置文件_config.butterfly.yml**的底部添加如下内容
```yml
live2d:
  enable: true
```
保存所有文件的修改，然后照例执行
```bash
hexo clean
hexo g
hexo s
```
就能在localhost:4000看到预览了。

4. 自定义修改
有一定前端基础的小伙伴可以通过修改~Hexo\themes\butterfly\source\live2d-widget路径下的
- waifu-tips.js 包含了按钮和对话框的逻辑
- waifu-tips.json 中定义了触发条件（selector，CSS 选择器）和触发时显示的文字（text）；
- waifu.css 是看板娘的样式表。
对看板娘的位置布局等做自定义修改。
<!-- endtab -->
{% endtabs %}
# 注意点
站点配置文件（Hexo自带看板娘）和主题配置文件（张书樵大神魔改看板娘）的live2d理论上可以共存，但是不建议这么做，只保留一个就好。也不用卸载哪个，只要把配置文件中的`enable: true`改为`enable: false`即可。

这个看板娘的API貌似随时会到期，作者发布了API的迁移公告以及部署教程:[Live2D 看板娘 API 迁移公告](https://www.fghrsh.net/post/170.html)
自建API需要用到自己的服务器，PHP服务器部署有一键安装脚本，自搜。
