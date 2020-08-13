---
title: 引入Aplayer播放音乐(踩坑向)
abbrlink: 3afa069a
date: 2019-04-24 11:06:48
categories: Akilarの糖葫芦
tags: Hexo
---

# 写在最前

看到大佬们的网页可以播放音乐，不得不说我是有点心动的，所以就在这里放一下教程。写这个的时候我也在一边试着安装，算是先驱者。
有两种方式，一种是安装源文件支持，在所有的网页输出上放置播放器，这样你哪个网页都可以看到它。
还有一种是安装插件，这个可以在文章中自定义样式，如此一来，只有当你点开文章的时候才能看到它。
我个人比较倾向于第二种，但这里我都会说，事实上引用的不是同一个js的情况下，貌似也不冲突吧。
（穿越回来的我：事实上体质特殊就是体质特殊，各种无效很无奈。）

# 安装源文件方式（未能成功，但教程按理说没问题）

<div class="note primary"><p>

参考教程：[Hexo NexT主题中添加网页音乐播放器功能](https://asdfv1929.github.io/2018/05/26/next-add-music/)

</p></div>

## 下载

先要在官网下载源码：[MoePlayer/APlayer](https://github.com/MoePlayer/APlayer)
~~总共也就200kb不到，就别捣鼓什么git clone了~~
解压后将dist文件夹复制到~\themes\next\source文件夹下。

## 新建music.js

新建 Hexo\themes\next\source\dist\music.js 文件，添加内容：

```
const ap = new APlayer({
    container: document.getElementById('aplayer'),
    fixed: true,
    autoplay: false,
    audio: [
      {
        name: "China-Y",
        artist: '徐梦圆',
        url: 'http://www.ytmp3.cn/down/59298.mp3down/39868.mp3',
        cover: 'http://oeff2vktt.bkt.clouddn.com/image/84.jpg',
      },
      {
        name: 'China-X',
        artist: '徐梦圆',
        url: 'http://www.ytmp3.cn/down/49003.mp3',
        cover: 'http://oeff2vktt.bkt.clouddn.com/image/8.jpg',
      },
    ]
});
```

以上是基本参数，还有更多参数可以参考这个[Aplayer中文文档](https://aplayer.js.org/#/zh-Hans/)

**audio**对应的便是音频文件，所以音乐播放器需要播放的音乐是需要自己进行相关信息（如歌曲链接、歌词、封面等）的配置。

顺便附上一个[mp3音乐外链网](http://www.ytmp3.cn/)

## 修改_layout.swig
这一步也是决定能否在你的所有页面显示的关键。

打开**\themes\next\layout\_layout.swig**文件，将以下内容加入到< body itemscope ...> 后面就行，即在 < body>< /body> 里面。

```
<link rel="stylesheet" href="/dist/APlayer.min.css">
<div id="aplayer"></div>
<script type="text/javascript" src="/dist/APlayer.min.js"></script>
<script type="text/javascript" src="/dist/music.js"></script>
```

之后使用hexo clean 和 hexo g 重新编译页面，就能看到左下角的音乐播放器了。(然而这个方法我并没有成功)

# 插件安装方式（推荐）

<div class="note primary"><p>

[hexo-tag-aplayer使用文档]([https://github.com/MoePlayer/hexo-tag-aplayer/blob/master/docs/README-zh_cn.md](https://github.com/MoePlayer/hexo-tag-aplayer/blob/master/docs/README-zh_cn.md))

</p></div>

## 安装

在根目录下使用命令行安装

```
npm install --save hexo-tag-aplayer
```

## 使用（本地预览成功，提交后却不见了）

在你的文章中通过以下格式引用：

```
{% aplayer title author url [picture_url, narrow, autoplay, width:xxx, lrc:xxx] %}
```

参数不止这些，具体可以参看使用手册，虽说也不是很详细就是了。

使用示例，例如在网页里放以下代码，会加载出单曲图标。

```
{% aplayer "China-Y" "徐梦圆" "http://www.ytmp3.cn/down/59298.mp3" %}
```



在网页里放以下代码，会加载出歌曲列表。
```
{% aplayerlist %}
{
    "narrow": false,                          
    "autoplay": true,                         by mobile browsers
    "mode": "random",                         
    "showlrc": 3,                             
    "mutex": true,                            player playing
    "theme": "#e6d0b2",	                     
    "preload": "metadata",                    'none' 'metadata' 'auto', default: 'auto'
    "listmaxheight": "513px",                 
    "music": [
        {
             "title": "病名为爱",
            "author": "祖娅纳惜",
            "url": "http://www.ytmp3.cn/down/60477.mp3",
            "pic": "http://img.ytmp3.cn/image/49.jpg",

        },
        {
            "title": "アイロニ",
            "author": "鹿乃",
            "url": "http://www.ytmp3.cn/down/35231.mp3",
            "pic": "http://img.ytmp3.cn/image/6.jpg"
        }
    ]
}
{% endaplayerlist %}
```




## 进阶教程MeingJS（成功，网易云真香）

MetingJS 是基于Meting API 的 APlayer 衍生播放器，引入 MetingJS 后，播放器将支持对于 QQ音乐、网易云音乐、虾米、酷狗、百度等平台的音乐播放。

如果想在本插件中使用 MetingJS，请在 Hexo 配置文件 _config.yml 中设置:

```
aplayer:
  meting: true
```

接着就可以通过以下格式在文章中使用 MetingJS 播放器了：

```
<!-- 简单示例 (id, server, type)  -->
{% meting "2597489971" "netease" "playlist" %}

<!-- 进阶示例 -->
{% meting "2597489971" "netease" "playlist" "autoplay" "mutex:false" "listmaxheight:340px" "preload:none" "theme:#ad7a86"%}

```
这里放了一个我的网易云歌单，但是可能依然没有加载出来。

{% meting "2597489971" "netease" "playlist" "autoplay" "mutex:false"  "listmaxheight:340px" "preload:none" "theme:#ad7a86"%}

<div class="note info"><p>今天的踩坑结论：因为各种各样的我不知道的理由，总之我不配拥有上面网页音乐。它的加载与否太过随性。</p></div>
