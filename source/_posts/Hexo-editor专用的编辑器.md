---
title: Hexo-editor专用的编辑器
categories: Akilarの糖葫芦
tags:
  - hexo
  - markdown
abbrlink: 1da4f99e
date: 2019-04-23 19:00:41
---
<div class="note info"><p>今天要说的就是一款叫做hexo-editor的hexo博客专用markdown编辑器，如果单说功能上，它其实不比其他老牌强者，但是架不住对于Hexo的高度适配，甚至我可以直接在本地预览网页效果，当然，js那些动态是不可能的，但是确实已经是最大化的满足了我的需求，配合图床网页的绑定，本地直接截图粘贴，保存时它帮你上传图片，终于可以告别那讨人厌的上传过程了。</p></div>



# 安装
和大部分个人开源软件一样，可以在github上找到，令我惊喜的是这还是团队开发，不得不说很喜欢这样体贴的官方，直接帮你把所有的系统安装包都适配好了，虽说下载源代码也能通过npm安装，但是咱们小白肯定是喜欢用安装包双击666的嘛。

<div class="note primary"><p>官方指导手册[hexo-editor](https://github.com/zhuzhuyule/HexoEditor)</p></div>

这里我直接找到了负责发布的那位，所以挑选你自己适配的系统下载就好了，`linux`用`deb`，`win10`用`exe`这种东西不用我教了吧。
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Hexo-editor%E4%B8%93%E7%94%A8%E7%9A%84%E7%BC%96%E8%BE%91%E5%99%A8/20190426031118809.png)
# 配置


这里我们需要配置一下一些很有必要的内容。打开软件后，先找到设置的按钮，我承认，纯白的画面太美，以至于可能需要愣一会儿才知道要在右下角来打开设置。

这里我们需要设置的有三个地方。图片设置尤为重要。会具体讲。
## 设置hexo配置文件
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Hexo-editor%E4%B8%93%E7%94%A8%E7%9A%84%E7%BC%96%E8%BE%91%E5%99%A8/20190426031210178.png)
这部分设置很简单，勾选hexo模式，设置hexo配置文件为站点配置文件，就是你根目录下那个，这样子hexo-editor可以通过读取你的配置文件直接完成打开本地服务器预览和提交到github上部署网页。是不是非常方便？



## 设置主题渲染配置

其实这部分没啥好说的，都勾选上也没关系，不过要注意一点，渲染主题的时候，如果你不是next，那么自己更换，点旁边**+**号选择你的主题文件夹即可，会自动识别的。

![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Hexo-editor%E4%B8%93%E7%94%A8%E7%9A%84%E7%BC%96%E8%BE%91%E5%99%A8/20190426031226439.png)

高亮主题最好是和你自己在主题配置里设置的高亮风格保持一致。这里我是**night**，默认是**normal**。自定义css，一般来说是在**~Hexo/themes/next/source/css/custom/custom.styl**，一些自定义样式会在这里显示，当然完整效果是不可能了，hexo的一些自带样式还是可以的，聊胜于无吧。

## 图床适配配置

先来看一下这里需要的东西，
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Hexo-editor%E4%B8%93%E7%94%A8%E7%9A%84%E7%BC%96%E8%BE%91%E5%99%A8/20190426031241609.png)


### 默认资源库
这就是你本地图片保存的地方，可以随意。我不推荐你保存在自己的博客目录里，最好是别的目录，否则你git的时候存一堆本地图片到github上是要闹哪样。

### 云图类型
有三种，
1. 第一种MS.SM图床，这是一个个人运营的图床，方便之处在于无需注册而且免费，但是没保障，毕竟我都猜不出这位靠什么盈利，没有盈利那拿什么维护，~~这个社会就是这么现实的。~~然而这个图床一直撑到了现在还有做大趋势。

2. 第二种七牛云图床，也是注册，不过实名认证是真的慢，每个月有流量限制，个人用户的话，一个小网站不会用完免费额度的，可以放心，一步步按部就班你就能得到Access key和secre tkey，可能不是这两个名字，但是肯定有两行秘钥给你。但是我不推荐这个，~~不为什么，我觉得七牛这个名字不好听而已。~~因为七牛云的外链经常加载不出来。原因我还没查过，只觉得很不好受。

3. 第三个腾讯云，香还是化腾爸爸香。首先要注册一个腾讯云账号。（事实上腾讯云有收费陷阱，开始免费，六个月以后免费额度收回，你要是已经传了很多东西上去的话就被套牢了，所以膈应到的还不如去用上面两种，不过还是要说一下，腾讯云快是真的快）怎么说呢，我觉得免费的才是最贵的,会有各种讨人厌的地方来膈应你。还不如收费。何况就算收费，按照流量额度来算的话，我一个小网站其实也没有多少钱需要的。

 - 首先找到官网注册:
<div class="note primary"><p>[腾讯云官网](https://cloud.tencent.com/)</p></div>
会有一系列验证，微信扫一扫之类的操作，好在腾讯系列产品对我的生活渗透的很厉害，感觉就和注册一下游戏的内测资格一样自然。

 - 然后打开云产品->对象存储->存储桶列表->创建存储桶。名字地区随意，但是这里的权限要设置成公有读私有写，都公有不安全，都私有别人读不了你的图啊。所以这个权限设置很好理解。

 - 然后找到你的密钥管理，按照指示生成你的密钥。SecretId对应AccessKey，SecretKey对应SecretKey，填入之后下面那些会自动生成的话就是成功了，自定义域名不用去管它。

---
# 使用

已经配置完毕了，接下来就可以正常使用了。

先贴一些官方的快捷键，相信从csdn来的朋友一定很熟悉。当初追求的可不就是这样又能拖动代码，又能一键把截图生成markdown语法的编辑器吗。而且Hexoeditor还那么简洁干净。

## 快捷键
这部分其实在官方文档里就有了。

| 键 |	方法	| 说明  |
| :---: | :---: | :----: |
| Tab |	tabAdd |	添加缩进 |
|	Shift - Tab	|	tabSubtract	|	减少压痕|	
|	Ctrl - B	|	toggleBlod	|	切换blod |	
|	Ctrl - I	|	toggleItalic	|	切换斜体|	
|	Ctrl - D|		toggleDelete|		删除当前行|	
|	Ctrl - `	|	toggleComment|		切换评论|	
|	Ctrl - L|		toggleUnOrderedList	|	切换无序列表|	
|	Ctrl- Alt-L	|	toggleOrderedList	|	切换有序列表|	
|	Ctrl - ]|		toggleHeader	|	降级标题|		
|	Ctrl - [|		toggleUnHeader|		升级标题|	
|	Ctrl - =	|	toggleBlockquote|		添加blockquote|	
|	Ctrl - -|		toggleUnBlockquote|		减少blockquote|	
|	Ctrl - U	|	drawLink|		添加超链接|	
|	Ctrl- Alt-U	|	drawImageLink|		添加图片|	
|	Ctrl - T	|	drawTable（row col）|		添加表（行列）|	
|	Ctrl - V	|	pasteOriginContent|		粘贴原始内容|	
|	Shift- Ctrl-V|		pasteContent	|	自动粘贴内容|	
|	Alt - F	formatTables|			格式表|	
|	Ctrl - N	|		|		新的md文件|	
|	Ctrl - H	|	|		新的hexo文件|	
|	Ctrl - O	|	|		打开md文档|	
|	Ctrl - S	|	|		保存md文件|	
|	Shift- Ctrl-S	|	|		另存为|	
|	Alt- Ctrl-S	| |			打开设置|	
|	Ctrl - W	|	|		切换写入模式|	
|	Ctrl - P|		|		切换预览模式|	
|	Ctrl - R	|	|		切换读取模式|	

---

 ## 使用习惯
 
 要先保存再打开，现在还有一些不影响使用的bug存在，但是bug毕竟是bug，还是要有好的习惯才不会有更多的麻烦。
 
### 预览
 1. 先右键->上传腾讯云
 2. 右键->hexo->结束占用进程
 3. 右键->hexo->启动服务器

  <div class="note warning"><p>我不建议你在这里一边修改一边预览本地服务器上的网页，因为存在未知bug。偶尔遇到了虽说重启就好，但是很难受。反正Hexo-editor的预览已经很好了，如非必要还是不要一边修改一边预览本地网页了。</p></div>

---

 ### 提交
 1. 先右键->上传腾讯云
 <div class="note info"><p>这里说一下，你可以右键图片，上传腾讯云，这样子本地路径会被替换成一个远程链接，也就是上传到腾讯云上的图片链接。你也可以右键已经上传的图片，选择取消上传，这样腾讯云上的文件就会被删除，图片也被替换回本地链接。是不是很有意思。</p></div>
 2. 右键->hexo清除缓存文件
 3. 右键->hexo->一键部署



