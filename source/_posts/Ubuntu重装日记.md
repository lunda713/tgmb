---
title: Ubuntu重装日记
categories:
  - 🍫Akilarの巧克力
tags:
  - Ubuntu
  - 系统重装
author: Akilarlxh
description: Ubuntu18.04LTS安装教程，电脑型号为机械革命深海幽灵z2-1060款。
abbrlink: 2f7e1a55
date: 2019-04-08 15:21:00
---

# 写在最前

<div class="note info"><p>Ubuntu又挂了，实在是体质特殊，同样的安装文件安装方式，到我这总能遇到神奇bug，我都觉得我就应该去做软件测试师，怎么干都有bug，虽然大概会被同事打死。总之为了避免再遇到同样的问题，也遵从楠皮的建议把遇到的坑归纳下来。</p></div>

# 安装盘制作教程

<div class="note default"><p>这个直接参考另一篇博客。很简单，全程傻瓜式安装：</p></div>

<div class="note primary"><p>

[Ubuntu安装盘制作教程](https://akilarlxh.github.io/post/328a67be.html)
</p></div>


<div class="note default"><p>

 1. 我的机型是`机械革命深海幽灵z2 1060款` ；
 2. 第一步： `准备好wepe` ，对，没错就是pe，因为要先准备好`Ubuntu的分区`，我只是拿来做做实验外加体验一下linux操作系统，之前双硬盘双系统，
 3. ~~一个Ubuntu明明只要30G上下就够了我却分了256G的ssd硬盘给它，太浪费了~~ 。
 4. `开机按F2`,	在`boot`项上把`#option1`设置为`USB启动项`，现在设好一会Ubuntu的那个U盘就省事了。
 5. 进入PE以后在分区助手里把`非Win10系统盘`里调整分区大小，使得硬盘有一部分`未分配的空闲分区`，大概`50g`左右即可，除非你是一个盘一个系统，那样只要格式化那个盘就好。到时候Ubuntu安装时，Ubuntu系统会`自动识别这个空闲分区然后填满`。
 6. 第二步：拔出PE的U盘，换成Ubuntu的U盘，进入后选择第二项`Install Ubuntu`，一路默认安装即可，语言选择`English（US）`，因为很多**设置如果路径是中文会遇到不少蛇皮bug**，血淋淋的教训。
 7. `重启开机按F2`，进入`bios`，在`boot`最下面的设置里，把开机时的系统启动项设置为`Ubuntu`。</p></div>




# grub2美化

<div class="note primary"><p>

在 [gnome-look](https://www.gnome-look.org/browse/cat/109/)选择一款合适自己的主题安装

</p></div>

<div class="note default"><p>

基本上都会配有安装说明，会想到安装Ubuntu  的人的英语底子应该还是能看懂的。

</p></div>

<div class="note success"><p>

我使用的是 [Grub-theme-vimix](https://www.gnome-look.org/p/1009236/) 这款，
  主要是它的背景图片可以任意替换，原版图片我委实不太喜欢，修改过之后文件名
  不同的话记得在 `Vimix` 文件夹下的 `theme.txt` 中对应修改。

</p></div>




## 默认安装
<div class="note default"><p>

`ctrl+alt+T` ，打开`terminal`，也可以右键快捷菜单打开

</p></div>

<div class="note warning"><p>

Ubuntu基本都是靠命令行来管理，要做好心理准备。

</p></div>

```
cd ~/Downloads/grub-theme-vimix
sudo ./Install
```

## 修改分辨率

<div class="note default"><p>

装主题后,要编辑`grub`文件中的分辨率让它生效。

</p></div>

```
sudo gedit /etc/default/grub
```

<div class="note default"><p>

在 `/etc/default/grub` 中找到 `GRUB_GFXMODE`这一行，取消注释， 将后面的分辨率改成自己的：

</p></div>

```
GRUB_GFXMODE=1920x1080
```

<div class="note default"><p>保存后运行</p></div>

 ```
sudo update-grub
```
<div class="note warning"><p>以后但凡是涉及到grub的内容，修改后都要运行一下这个</p></div>

<div class="note default"><p>重启即可</p></div>




## 可能遇到的bug

<div class="note warning"><p>我也不知道为什么，按理说Install脚本没问题，但是安装还是会出错导致不生效，这时候找到</p></div>

```
sudo nautilus /boot/grub/themes
```
<div class="note default"><p>会发现Vimix的主题文件被直接放在了themes文件夹里</p></div>

<div class="note success"><p>

**新建一个Vimix文件夹（注意大小写）**，把这些文件拖进去就好。

</p></div>


## 更改背景
<div class="note info"><p>

以后的更改背景图片也是同理，直接在`/boot/grub/themes/Vimix`文件夹里放入你想要更改的图片，然后修改`themes.txt`中`desktop-image: "/your picture url"`，接着运行

</p></div>

 ```
sudo update-grub
```
# 登录界面美化
## 修改gdm3.css
<div class="note default"><p>

理论上这个登录界面就是个前端界面，因为它就是通过css文件修改的。
  推荐在修改之前最好备份一个`gdm3.css`方便以后恢复。
  编辑配置这个文件：

  </p></div>

 ```
sudo cp /etc/alternatives/gdm3.css /etc/alternatives/gdm3.css.bak
sudo gedit /etc/alternatives/gdm3.css
```
<div class="note default"><p>找到这一行</p></div>

```
#lockDialogGroup {
background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
background-repeat: repeat;
}
```

<div class="note default"><p>改成</p></div>

```
#lockDialogGroup {
  background: #2c001e url(file:///usr/share/backgrounds/mypicture.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
```
<div class="note info"><p>

其中`usr/share/backgrounds/mypicture.jpg`是我的文件路径，替换成你自己的，记得图片分辨率要和自己的电脑保持一致

</p></div>

## 可能遇到的bug

<div class="note warning"><p>也不算bug吧，Ubuntu更新时会重置gdm3.css，这时候登录界面又会变成丑丑的纯色界面，重新操作一下上面的流程就好。有兴趣继续探索的可以慢慢研究，css嘛，前端学的好的就能改的。</p></div>


# 安装主题

## 前期准备
<div class="note info"><p>

Ubuntu采用了GNOME，因此要美化主题，首先需要安装 `gnome-tweak-tool` 。

</p></div>

 ```
sudo apt-get update
sudo apt-get install gnome-tweak-tool
```
<div class="note default"><p>

接下来，需要安装 `User themes` 才能启用第三方主题，
直接从 Ubuntu 自带商店中搜索User themes安装即可。

</p></div>

## 主题推荐

### 资源管理器主题
<div class="note primary"><p>

推荐[Vimix-Gtk-Theme ](https://www.gnome-look.org/p/1013698/)</p></div>

<div class="note default"><p>

可以找到安装说明，推荐直接去它的[github](https://github.com/vinceliuice/vimix-gtk-themes)网页下载主题文件，
  解压后直接在文件夹内打开terminal，运行：</p></div>

 ```
sudo ./Install
```
### 应用图标
<div class="note primary"><p>

推荐[Vimix-icon-Theme ](https://github.com/vinceliuice/vimix-icon-theme)，</p></div>

<div class="note default"><p>下载解压后直接在文件夹内打开terminal，运行：</p></div>

```
sudo ./Installer.sh
```

### 鼠标指针
<div class="note default"><p>

推荐[Pulse Glass](https://www.gnome-look.org/p/999994/),</p></div>

<div class="note default"><p>下载解压后运行</p></div>

```
sudo nautilus /usr/share/icons
```

<div class="note default"><p>

把下载的鼠标指针文件放进去即可在`tweak（优化）`里面进行设置</p></div>


# terminal终端美化
## 安装 zsh

<div class="note info"><p>

终端选用 `zsh` ，首先执行：</p></div>

 ```
sudo apt-get install zsh //安装zsh
zsh --version //确认是否安装成功

```

## 安装oh-my-zsh
<div class="note default"><p>

使用`wget`安装`oh my zsh`</p></div>

 ```
 sudo apt-get install git //已经安装了git的忽略这一条
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
## 设置oh-my-zsh
```
sudo gedit ~/.zshrc
```

<div class="note default"><p>

修改主题为`agnoster`</p></div>

```
ZSH_THEME="agnoster"
```

<div class="note default"><p>在zshrc末尾添加</p></div>

```
DEFAULT_USER=$USER
```

<div class="note default"><p>保存退出，运行</p></div>

```
source ~/.zshrc
//以后凡是修改过这个的都要运行一遍这行代码
```

<div class="note default"><p>接下来要安装powerline字体，否则这个主题很丑</p></div>

```
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

<div class="note default"><p>在终端->编辑->首选项里选择启用第三方字体为powerline即可。
但是此时我们的默认shell可能并没有设置为zsh，虽然我知道有一些人
的电脑很上道，直接自己帮你设好默认了。保险起见还是设置一下。</p></div>

```
sudo chsh -s $(which zsh)
//设置zsh为默认shell
sudo reboot
//注销重新登录，为了防止你自己老是不愿意重登
```

<div class="note default"><p>重启后检查下</p></div>

 ```
echo $SHELL
//确认zsh是否是默认SHELL
```

<div class="note default"><p>一般输出会是（反正有zsh字样就对了）</p></div>

```
/usr/bin/zsh
```
## 插件安装
<div class="note danger"><p>我对这个没兴趣，我不会在终端编程，有功能完善的ide干嘛自找麻烦。有兴趣的自己去找。</p></div>


# 开发环境配置

## 配置java
<div class="note primary"><p>

到官网下载[jdk8](https://www.oracle.com/technetwork/cn/java/javase/downloads/index.html)</p></div>

<div class="note info"><p>我下载的是jdk-8u211-linux-x64.tar.gz，后来人看到的肯定不是这个版本了，关系不大，改下版本号就行。</p></div>

<div class="note default"><p>打开terminal，执行：</p></div>

```
sudo mkdir /usr/lib/jvm
sudo tar -zxvf jdk-8u211-linux-x64.tar.gz -C /usr/lib/jvm
```

<div class="note default"><p>

由于我使用 `zsh` ，因此编辑的是` ~/.zshrc` 文件，来加入环境变量。执行</p></div>

```
sudo gedit ~/.zshrc
```

 <div class="note default"><p>在文件末尾添加：</p></div>

``` diff
#set oracle jdk environment
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```

 <div class="note default"><p>然后执行：</p></div>

```
source ~/.zshrc
```

<div class="note default"><p>为系统设置默认 JDK，打开terminal</p></div>

<div class="note warning"><p> 这里我虽然全部都贴出来了，但是在terminal里运行的时候,还是要老老实实一行一行运行，别想着全部复制过去一次跑完。</p></div>

 ```
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_211/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_211/bin/javac 300
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.8.0_211/bin/jar 300
sudo update-alternatives --install /usr/bin/javah javah /usr/lib/jvm/jdk1.8.0_211/bin/javah 300
sudo update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/jdk1.8.0_211/bin/javap 300
sudo update-alternatives --config java
```
<div class="note info"><p>若是初次安装 JDK，会有下面的提示:</p></div>

<div class="note success"><p>There is only one alternative in link group java (providing /usr/bin/java): /usr/lib/jvm/jdk1.8.0_211/bin/java
Nothing to configure.</p></div>

<div class="note default"><p>否则，选择合适的 JDK即可。
查看Java版本</p></div>

```
java -version
```
## 安装Anaconda
<div class="note info"><p>

[Anaconda历代版本](https://repo.continuum.io/archive/)</p></div>

<div class="note default"><p>

因为有一个python版本的对应，这里给个对照图表好了

![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/ubuntu18.04LTS-%E6%9C%BA%E6%A2%B0%E9%9D%A9%E5%91%BD%E6%B7%B1%E6%B5%B7%E5%B9%BD%E7%81%B5z2-%E9%87%8D%E8%A3%85%E6%97%A5%E8%AE%B0-'/20190612070757742.png)

</p></div>

<div class="note info"><p>

这里我下载的是`Anaconda3-5.2.0-Linux-x86_64.sh`
</p></div>

<div class="note default">执行以下命令安装：<p>
</p></div>

```
bash Anaconda3-5.2.0-Linux-x86_64.sh
```
<div class="note warning"><p>因为 Anaconda 的环境变量只会添加到 ~/.bashrc 下，而使用 zsh 的需要在 ~/.zshrc 下添加，执行</p></div>

```
sudo gedit ~/.zshrc
```

<div class="note default"><p>在文件末尾加入</p></div>

``` diff
#added by Anaconda3 installer
export PATH="/home/akilar/anaconda3/bin:$PATH"
```

<div class="note warning"><p>akilar是我的用户名，改成你自己的</p></div>

<div class="note default"><p>保存后执行</p></div>

```
source ~/.zshrc
```
## 浏览器
### 安装chrome
<div class="note default"><p>火狐我是不习惯，香肯定还是chrome香。</p></div>

<div class="note primary"><p>

下载chrome的deb安装包[chrome for linux](http://www.ubuntuchrome.com/)</p></div>

<div class="note default"><p>

使用**sudo dpkg -i 包名.deb**安装即可。</p></div>


<div class="note info"><p>接下来要下载一个叫SwitchyOmega的插件。这关系到下面的v2ray安装。
不过有点矛盾，我就是因为要翻墙才下插件，但是要翻墙了才能在谷歌应用社区下插件。
所以呢，就要靠万能的github了，谢天谢地它还没被墙。</p></div>

<div class="note primary"><p>  

访问[SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega/releases)</p></div>

 <div class="note default"><p>

 拉到最下下载这个文件 ：`SwitchyOmega_Chromium.crx`
下载完成后安装到chrome内。

</p></div>



### 可能遇到的bug：
<div class="note warning"><p>

新版本的chrome似乎不支持直接使用crx脚本安装。
  这里先把`SwitchyOmega_Chromium.crx`
  改名为`SwitchyOmega_Chromium.zip`，
  解压后保存为`SwitchyOmega_Chromium`文件夹。
**在chrome里头像旁边三个点->setting->more tools->extensions->development->load unpack，**
(头像旁边三个点->设置->更多工具->扩展->打开开发者模式->加载已解压的扩展程序)
选择`SwitchyOmega_Chromium`文件夹即可。</p></div>




## 科学上网
### electron-ssr（2020-7-8修订，electron-ssr已经停止更新，原作者删了源代码，且SSR服务并不如V2Ray稳定，推荐使用V2Ray）
<div class="note info"><p>

ssr的用户可以安装`electron-ssr`，这是一个Ubuntu下也能够使用的ssr客户端，</p></div>

<div class="note primary"><p>

下载[electron-ssr](https://github.com/erguotou520/electron-ssr/releases)中的release，</p></div>

<div class="note default"><p>

我的是`electron-ssr-0.2.6.deb`
下载后在该位置打开terminal，</p></div>

```
sudo dpkg -i electron-ssr-0.2.6.deb
```

<div class="note default"><p>虽然deb可以像在windows下执行exe一样双击安装，
但是吉皮说过，程序员就要用命令行，图形化界面一点也不优雅。
开个玩笑，事实上命令行内方便使用这两行命令来修复依赖关系。以后会经常用到它们的。</p></div>

```
sudo apt-get update
sudo apt-get install -f
```


### v2ray
<div class="note info"><p>

v2ray的用户请使用v2ray，~~感觉这是一句废话~~</p></div>

<div class="note default"><p>有现成的安装脚本，但在那之前必须先准备好配置文件。希望你们已经看过Win10系统下v2rayN客户端的教程。</p></div>

<div class="note primary"><p>

[Win10重装日记](https://akilarlxh.github.io/post/2f7e1a55.html)</p></div>

<div class="note default"><p>

先在`Win10`的`v2rayN客户端`选中所有的结点，然后`右键`->`导出所选服务器为客户端配置`，导出的文件保存为`config.json`
切回`Ubuntu`，先在`git`上下载指定的客户端源代码，~~没有图形化界面真是抱歉呢。~~</p></div>

<div class="note primary"><p>

客户端的源代码网址:[v2ray-core](https://github.com/v2ray/v2ray-core)
非64位系统到这里找找指定的版本。</p></div>



```
sudo wget https://github.com/v2ray/v2ray-core/releases/download/v4.18.0/v2ray-linux-64.zip
//这是Linux64位系统的客户端，不是的话请自行到官网查找。
sudo wget https://install.direct/go.sh
//这是一键安装脚本
sudo bash go.sh --local ./v2ray-linux-64.zip
//安装v2ray
sudo cp config.json /etc/v2ray/config.json
//Ubuntu内客户端和服务端共用同一个配置文件，所以需要复制配置文件，
//但是最新版本这一步不需要了，因为脚本已经帮您复制好了
sudo chmod 777 /etc/v2ray/config.json
//给予配置文件读写权限
sudo gedit /etc/v2ray/config.json
//打开你的配置文件
```
<div class="note info"><p>接下来就要用到一开始在Win10那边生成的文件了，Ubuntu是直接可以读写Win10那边的文件的真是太好了，不用重启一次。</p></div>

<div class="note default"><p>

把`Win10`那边的`config.json`文件内容全部拷贝过来，覆盖到`/etc/v2ray/config.json`内</p></div>

#### 配置文件config.json
```
//以下是我的配置文件。
{
  "log": {
    "access": "",
    "error": "",
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": 10808,
      //记牢这个端口号，这是服务器端口号，
      //一会在浏览器插件上配置也是用这个。
      "listen": "127.0.0.1",
      "protocol": "socks",
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      },
      "settings": {
        "auth": "noauth",
        "udp": true,
        "ip": null,
        "clients": null
      },
      "streamSettings": null
    }
  ],
  "outbounds": [
    {
      "tag": "proxy",
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "plus.jiyou.fun",
            "port": 8080,
            "users": [
              {
                "id": "********-****-****-****-************",
                //这个极游那边给出的UUID，因为是等效于唯一识别码的，所以就加密一下了
                "alterId": 0,
                "email": "t@t.tt",
                "security": "auto"
              }
            ]
          }
        ],
        "servers": null,
        "response": null
      },
      "streamSettings": {
        "network": "ws",
        "security": "",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": null
        },
        "tcpSettings": null,
        "kcpSettings": null,
        "wsSettings": {
          "connectionReuse": true,
          "path": null,
          "headers": {
            "Host": "box.10155.com"
          }
        },
        "httpSettings": null,
        "quicSettings": null
      },
      "mux": {
        "enabled": true
      }
    },
    {
      "tag": "direct",
      "protocol": "freedom",
      "settings": {
        "vnext": null,
        "servers": null,
        "response": null
      },
      "streamSettings": null,
      "mux": null
    },
    {
      "tag": "block",
      "protocol": "blackhole",
      "settings": {
        "vnext": null,
        "servers": null,
        "response": {
          "type": "http"
        }
      },
      "streamSettings": null,
      "mux": null
    }
  ],
  "dns": null,
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": []
  }
}
```
<div class="note default"><p>

在chrome的SwitchyOmega插件上，选项里新建情景模式，我命名为proxy
具体配置是这样的：
![proxy](https://s2.ax1x.com/2019/04/08/A5QZ6A.png)

</p></div>

<div class="note warning"><p>

其中`10808`是我的服务器端口，见上文配置文件`config.json`内的注释。
`127.0.0.1`则是本地的IP地址。

</p></div>

<div class="note default"><p>打开terminal</p></div>

```
service v2ray start    //启动v2ray
service v2ray status   //查看v2ray状态
service v2ray stop     //停止v2ray，不过一次配置以后一直是开机启动的。
service v2ray restart // 重启v2ray，修改配置文件后重启一下v2ray
```
<div class="note warning"><p>

记得在浏览器里把情景模式设置为`auto switch`，这样浏览器会自动选择是直接连接还是代理。</p></div>

### Clash

<div class="note primary"><p>

Clash是一个Go语言开发的多平台代理客户端

[Clash](https://github.com/Dreamacro/clash/releases)

具体教程请移步https://www.jianshu.com/p/2906066d2e0a

待我以后脑子再热一热，想到反复重装Ubuntu 19.10的时候再回来详细写这个。
</p></div>

## jetbrain全家桶安装（IDE）


<div class="note primary"><p>

这个就不得不说jetbrain大法好了，直接到官网下载[jetbrain toolbox](http://www.jetbrains.com/toolbox/app/)

</p></div>

<div class="note default"><p>然后就能像在creative cloud上安装adobe全家桶一样方便的在Ubuntu上安装jetbrain全家桶了</p></div>

<div class="note default no-icon"><p>

常用的有
Python：	Pycharm Professional
Java：Idea Ultimate
C/C++:Clion
Android：Android Studio

</p></div>


<div class="note primary"><p>

需要免费使用的可以去申请一下学生账号资格[jetbrain 学生产品](https://www.jetbrains.com/shop/eform/students)</p></div>




## 安装Atom
<div class="note default"><p>Atom作为一个代码查看器实在是碾压sublime，而且插件也同样丰富，就是小水管安装有点难受，翻墙代理都拯救不了的速度。</p></div>

<div class="note primary"><p>

从 [ 官网 ]( https://atom.io/ ) 下载  deb安装包</p></div>

```
sudo dpkg -i atom-amd64.deb
```

# 常用软件

## 基于wine的通讯软件和下载软件

<div class="note info"><p>

不管是微信，qq,tim还是随便什么，反正先安装[deepin-wine](https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu)。</p></div>

<div class="note default"><p>在download文件夹内打开terminal</p></div>

```
git clone https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git
//这是中国的镜像网站，快速一点
```

<div class="note default"><p>下载好以后进入该文件夹
运行</p></div>

```
sudo ./install.sh
```

<div class="note warning"><p>如果出错，运行</p></div>

```
sudo apt-get update
sudo apt-get install -f
```

<div class="note default"><p>修复依赖关系后建议重新安装一遍。</p></div>


```
sudo ./install.sh
```

<div class="note info"><p>以下是几个常用软件，下载deb文件后用`sudo dpkg -i 包名.deb`安装即可</p></div>

<div class="note success no-icon"><p>

[qq](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.im/)
[tim](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.office/)
[wechat](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.wechat/)
[百度网盘](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.baidu.pan/)
[迅雷极速版](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.thunderspeed/)

</p></div>




## 输入法
<div class="note warning"><p>搜狗输入法有bug，偶尔会出现中文乱码，但还是习惯这个，没办法的事情。</p></div>

<div class="note primary"><p>

[sogou input for linux](https://pinyin.sogou.com/linux/)</p></div>

<div class="note default"><p>

使用**sudo dpkg -i 包名.deb**安装。

打开设置，语言选项，按`manager installed language`选项，肯定会出错，没关系，打开terminal</p></div>

```javascript
sudo apt-get update
sudo apt-get install -f
```

<div class="note default"><p>

可能需要多试几次。不报错了，再安装一遍搜狗输入法。
然后在语言管理界面把键盘输入法系统改为`fcitx`。
重启以后把搜狗输入法添加进去即可。</p></div>

<div class="note primary"><p>

推荐搜狗输入法皮肤
[科技透明极简](https://pinyin.sogou.com/skins/detail/view/info/510242?rf=search&tf=p)
</p></div>

<div class="note warning"><p>可能遇到中文乱码bug，简单粗暴一点，执行以下命令移除输入法配置文件然后重启即可。</p></div>

```
cd ~/.config
rm -rf SogouPY* sogou*
```

# gnome插件

<div class="note primary"><p>

推荐的gnome插件，楠皮就写得很完善了，就当帮他引流了。[GNOME-SHELL拓展](https://blog.vanxnf.top/2018/10/04/GNOME-SHELL-%E6%8B%93%E5%B1%95/)</p></div>

## 插件拓展支持

<div class="note primary"><p>先安装一下插件拓展支持，虽然火狐也可以装插件，不过这个时候你一定可以使用chrome了。</p></div>

```
sudo apt-get install chrome-gnome-shell
//这个是Ubuntu系统上的shell拓展支持。
```

## 浏览器插件拓展支持

<div class="note default"><p>除此之外，你还需要安装浏览器插件拓展支持。
在google应用商店下载</p></div>

<div class="note primary"><p>

[GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)</p></div>



## 推荐的插件
<div class="note default"><p>然后是推荐的插件(看不懂的话，右键google网页翻译)，
不得不说我当初就是因为这些丰富的插件才陷入Ubuntu不能自拔的。</p></div>

- [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
<div class="note default no-icon"><p>Clipboard Manager extension for Gnome-Shell - Adds a clipboard indicator to the top panel, and caches clipboard history.</p></div>

- [Coverflow Alt-Tab](https://extensions.gnome.org/extension/97/coverflow-alt-tab/)
<div class="note default no-icon"><p>Replacement of Alt-Tab, iterates through windows in a cover-flow manner.</p></div>


- [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
<div class="note default no-icon"><p>A dock for the Gnome Shell. This extension moves the dash out of the overview transforming it in a dock for an easier launching of applications and a faster switching between windows and desktops. Side and bottom placement options are available.</p></div>


- [Gnome Shell Audio Output Switcher](https://extensions.gnome.org/extension/1028/gnome-shell-audio-output-switcher/)
<div class="note default no-icon"><p>Gnome-Shell Extension: Easily switch between your audio outputs from the system menu.</p></div>

- [Lock Keys](https://extensions.gnome.org/extension/36/lock-keys/)
<div class="note default no-icon"><p>Numlock & Capslock status on the panel.</p></div>

- [Multi Monitors Add-On](https://extensions.gnome.org/extension/921/multi-monitors-add-on/)
<div class="note default no-icon"><p>Add multiple monitors overview and panel for gnome-shell.</p></div>

- [Pixel Saver](https://extensions.gnome.org/extension/723/pixel-saver/)
<div class="note default no-icon"><p>Pixel Saver is designed to save pixel by fusing activity bar and title bar in a natural way.</p></div>


- [Screenshot Tool](https://extensions.gnome.org/extension/1112/screenshot-tool/)
<div class="note default no-icon"><p>Conveniently create, copy, store and upload screenshots.</p></div>


- [TopIcons Plus](https://extensions.gnome.org/extension/1031/topicons/)
<div class="note default no-icon"><p>This extension moves legacy tray icons (bottom left of Gnome Shell) to the top panel. It is a fork from the original extension from ag with settings for icon opacity, saturation, padding, size and tray position, along with a few minor fixes and integration with the Skype integration extension.</p></div>

- [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
<div class="note default no-icon"><p>Load shell themes from user directory.</p></div>

- [Suspend Button](https://extensions.gnome.org/extension/826/suspend-button/)
<div class="note default no-icon"><p>Allows to modify the suspend/shutdown button in the status menu.</p></div>



# 遇到的bug（不定时更新）
## 开机卡在登录界面进不去桌面。
<div class="note warning"><p>但可以打开命令行界面。也可以进入recovery界面。
  不跟他废话，你敢故障我就敢重装你。当然，这里小打小闹重装一下桌面就好。
</p></div>

<div class="note default"><p>

长按开机键强制重启，在grub启动页选择`Ubuntu高级选项`，从`recovery模式`启动。也可以按`Alt+Ctrl+F1`进入命令行界面操作。我是推荐命令行的，虽然我本人是图形界面重度患者。

卸载Xwindows软件

</p></div>

```
sudo apt-get autoremove ubuntu-desktop
```

<div class="note default"><p>重新安装所有依赖软件</p></div>

```
sudo apt-get install ubuntu-desktop
sudo apt-get install python-ntdb
sudo apt-get install libntdb1:amd64
sudo apt-get install libupstart1:amd64
```

<div class="note default"><p>重启</p></div>

```
sudo reboot
```

<div class="note danger"><p>20190409：最新的发现是貌似是在寝室使用的时候把主屏幕设置为外接显示器导致的，具体原理还在探索，以上方法治标不治本的。只能是养成好习惯，每次离开寝室的时候把主屏幕设置为内置显示器吧。</p></div>

<div class="note success"><p>

20190410：最新的解决方法，氪金，在某宝上下载一个**HDMI接口显卡欺骗器**。大小和U盘差不多。虽然人家的初衷不是为了解决这个问题的，但是亲测竟然意外的好用。看遇到相同问题的朋友基本都是应为linux虚拟机或者linux系统的问题，推测是现有的linux内核或者开源的xrog显卡存在一些机型不兼容的问题</p></div>


## 触摸板失灵，无法使用。
<div class="note warning"><p>Z2的触控板是满足I2C_HID接口要求。
  而linux 现在已经支持I2C_HID.。
只是18.04的早期内核有BUG，所以无法用。</p></div>

<div class="note success"><p>但该BUG在4.18.15版本以后的内核版本中已经修复.
  所以,只要升级内核到4.18.15以上版本就能支持.</p></div>

<div class="note primary"><p>

[Ubuntu 内核历史版本](https://kernel.ubuntu.com/~kernel-ppa/mainline/)
  下载最新版本的内核文件即可。</p></div>

<div class="note default"><p>比如我就是这四个文件</p></div>

```
  sudo wget  linux-headers-5.1.0-050100rc3_5.1.0-050100rc3.201904010618_all.deb
  sudo wget  linux-headers-5.1.0-050100rc3-generic_5.1.0-050100rc3.201904010618_amd64.deb
  sudo wget  linux-image-unsigned-5.1.0-050100rc3-generic_5.1.0-050100rc3.201904010618_amd64.deb
  sudo wget  linux-modules-5.1.0-050100rc3-generic_5.1.0-050100rc3.201904010618_amd64.deb
  //进入下载文件夹，运行
  sudo dpkg -i *.deb
  //重启后运行
  uname -r
  //查看当前内核版本
 ```
 ## Win10和Ubuntu时间不同步
 <div class="note success"><p>在Ubuntu下输入以下三行命令</p></div>

 ```
 sudo apt-get install ntpdate
 sudo ntpdate time.windows.com
 //在Ubuntu下更新本地时间
 sudo hwclock --localtime --systohc
 //将本地时间更新到硬件上
 ```
