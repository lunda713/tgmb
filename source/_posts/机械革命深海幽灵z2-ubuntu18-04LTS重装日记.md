title: 机械革命深海幽灵z2 ubuntu18.04LTS重装日记
categories:
  - ubuntu
tags:
  - ubuntu
  - 系统重装
  - ubuntu美化
author: Akilarlxh
date: 2019-04-08 15:21:00
---
# 一、写在最前

ubuntu又挂了，实在是体质特殊，同样的安装文件安装方式，到我这总能遇到神奇bug，我都觉得我就应该去做软件测试师，怎么干都有bug，虽然大概会被同事打死。总之为了避免再遇到同样的问题，也遵从楠皮的建议把遇到的坑归纳下来。

# 二、安装盘制作教程
这个直接参考另一篇博客。很简单，全程傻瓜式安装：

[ubuntu18.04LTS安装盘制作教程](https://akilarlxh.github.io/2019/04/08/ubuntu18-04LTS%E5%AE%89%E8%A3%85%E7%9B%98%E5%88%B6%E4%BD%9C%E6%95%99%E7%A8%8B/)

 1. 我的机型是**机械革命深海幽灵z2 1060款** ；
 2. 第一步：**准备好wepe**，对，没错就是pe，因为要先准备好ubuntu的分区，我只是拿来做做实验外加体验一下linux操作系统，之前双硬盘双系统，
 3. ~~一个ubuntu明明只要30G上下就够了我却分了256G的ssd硬盘给它，太浪费了~~ 。
 4. **开机按F2**,	在**boot项上把“#option1”设置为USB启动项**，现在设好一会ubuntu的那个U盘就省事了。
 5. 进入PE以后在分区助手里把非win10系统盘里调整分区大小，使得硬盘有一部分**未分配的空闲分区**，大概50g左右即可，除非你是一个盘一个系统，那样只要格式化那个盘就好。到时候ubuntu安装时，ubuntu系统会自动识别这个空闲分区然后填满。
 6. 第二步：拔出PE的U盘，换成ubuntu的U盘，进入后选择第二项Install Ubuntu，一路默认安装即可，语言选择English（US），因为很多**设置如果路径是中文会遇到不少蛇皮bug**，血淋淋的教训。
 7. 重启开机按F2，进入bios，在boot最下面的设置里，把开机时的系统启动项设置为ubuntu。



# 三、grub2美化



 - 在 [gnome-look](https://www.gnome-look.org/browse/cat/109/)选择一款合适自己的主题安装，
 基本上都会配有安装说明，会想到安装Ubuntu  的人的英语底子应该还是能看懂的。
 - 我使用的是 [Grub-theme-vimix](https://www.gnome-look.org/p/1009236/) 这款，
  主要是它的背景图片可以任意替换，原版图片我委实不太喜欢，修改过之后文件名
  不同的话记得在 Vimix 文件夹下的 theme.txt 中对应修改。
## 01. 默认安装
  ctrl+alt+T ，打开terminal，也可以右键快捷菜单打开啦，
  ubuntu基本都是靠命令行来管理，要做好心理准备。
```
cd ~/Downloads/grub-theme-vimix
sudo ./Install
```
## 02. 修改分辨率
装主题后,要编辑grub文件中的分辨率让它生效。
```
sudo gedit /etc/default/grub
```
在 /etc/default/grub 中找到 GRUB_GFXMODE这一行，取消注释， 将后面的分辨率改成自己的：
 ```
GRUB_GFXMODE=1920x1080
```
保存后运行（以后但凡是涉及到grub的内容，修改后都要运行一下这个）
 ```
sudo update-grub
```
重启即可
## 03. 可能遇到的bug
我也不知道为什么，按理说Install脚本没问题，但是安装还是会出错导致不生效，这时候找到
```
sudo nautilus /boot/grub/themes
```
会发现Vimix的主题文件被直接放在了themes文件夹里，**新建一个Vimix文件夹（注意大小写）**，把这些文件拖进去就好。
4. 以后的更改背景图片也是同理，直接在**/boot/grub/themes/Vimix**文件夹里放入你想要更改的图片，然后修改themes.txt中desktop-image: "你想要更改的背景图的路径"，接着运行
 ```
sudo update-grub
```
# 四、登录界面美化
## 01修改gdm3.css
理论上这个登录界面就是个前端界面，因为它就是通过css文件修改的。推荐在修改之前最好备份一个gdm3.css方便以后恢复。
编辑配置这个文件：
 ```
sudo gedit /etc/alternatives/gdm3.css
```
找到这一行
 ```
1814 #lockDialogGroup {
1815 background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
1816 background-repeat: repeat;
1817 }
```
改成
 ```
#lockDialogGroup {
background: #2c001e url(file:///usr/share/backgrounds/mypicture.jpg);         
/*其中usr/share/backgrounds/mypicture.jpg是我的
文件路径，替换成你自己的，记得图片分辨率要和自己的电脑
保持一致*/
background-repeat: no-repeat;
background-size: cover;
background-position: center;
}
```
## 2.可能遇到的bug
也不算bug吧，ubuntu更新时会重置gdm3.css，这时候登录界面又会变成丑丑的纯色界面，重新操作一下上面的流程就好。有兴趣继续探索的可以慢慢研究，css嘛，前端学的好的就能改的。


# 五、安装主题

## 01.前期准备
Ubuntu采用了GNOME，因此要美化主题，首先需要安装 gnome-tweak-tool 。
 ```
sudo apt-get update
sudo apt-get install gnome-tweak-tool
```
接下来，需要安装 **User themes** 才能启用第三方主题，
直接从 Ubuntu 自带商店中搜索User themes安装即可。
## 02.主题推荐
### 1.资源管理器主题
推荐[Vimix-Gtk-Theme ](https://www.gnome-look.org/p/1013698/)
可以找到安装说明，推荐直接去它的[github](https://github.com/vinceliuice/vimix-gtk-themes)网页下载主题文件，解压后直接在文件夹内打开terminal，运行：
 ```
sudo ./Install
```
### 2.应用图标
推荐[Vimix-icon-Theme ](https://github.com/vinceliuice/vimix-icon-theme)，下载解压后直接在文件夹内打开terminal，运行：
 ```
sudo ./Installer.sh
```
### 3.鼠标指针
推荐[Pulse Glass](https://www.gnome-look.org/p/999994/),下载解压后运行
```
sudo nautilus /usr/share/icons
```
把下载的鼠标指针文件放进去即可在tweak里面进行设置

# 六、terminal终端美化
## 01.安装 zsh
终端选用 zsh ，首先执行：
 ```
sudo apt-get install zsh //安装zsh
zsh --version //确认是否安装成功

```

## 02.安装oh-my-zsh
使用wget安装oh my zsh
 ```
 sudo apt-get install git //已经安装了git的忽略这一条
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
## 03.设置oh-my-zsh
```
sudo gedit ~/.zshrc
```
修改主题为agnoster
```
ZSH_THEME="agnoster"
```
在zshrc末尾添加
```
DEFAULT_USER=$USER
```
保存退出，运行
```
source ~/.zshrc 
//以后凡是修改过这个的都要运行一遍这行代码
```
接下来要安装powerline字体，否则这个主题很丑
```
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```
在终端->编辑->首选项里选择启用第三方字体为powerline即可。
但是此时我们的默认shell可能并没有设置为zsh，虽然我知道有一些人
的电脑很上道，直接自己帮你设好默认了。保险起见还是设置一下。
```
sudo chsh -s $(which zsh) 
//设置zsh为默认shell
sudo reboot 
//注销重新登录，为了防止你自己老是不愿意重登
```
重启后检查下
 ```
echo $SHELL 
//确认zsh是否是默认SHELL
```
一般输出会是（反正有zsh字样就对了）
```
/usr/bin/zsh
```
4.插件安装
我对这个没兴趣，我不会在终端编程，有功能完善的ide干嘛自找麻烦。有兴趣的自己去找。


# 七、开发环境配置

## 01.配置java

到官网下载[jdk8](https://www.oracle.com/technetwork/cn/java/javase/downloads/index.html)
我下载的是jdk-8u201-linux-x64.tar.gz，后来人看到的肯定不是这个版本了，关系不大，改下版本号就行。
打开terminal，执行：
```
sudo mkdir /usr/lib/jvm
sudo tar -zxvf jdk-8u201-linux-x64.tar.gz -C /usr/lib/jvm
```
由于我使用 zsh ，因此编辑的是 ~/.zshrc 文件，来加入环境变量。执行
```
sudo gedit ~/.zshrc
```
 在文件末尾添加：
 ```
#set oracle jdk environment
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_201
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```
 然后执行：
```
source ~/.zshrc
```

为系统设置默认 JDK，打开terminal
 ```
 //这里我虽然全部都贴出来了，但是在terminal里运行的时候
 //还是要老老实实一行一行运行，别想着全部复制过去一次跑完。
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_201/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_201/bin/javac 300
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.8.0_201/bin/jar 300
sudo update-alternatives --install /usr/bin/javah javah /usr/lib/jvm/jdk1.8.0_201/bin/javah 300
sudo update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/jdk1.8.0_201/bin/javap 300
sudo update-alternatives --config java
```
若是初次安装 JDK，会有下面的提示:
```
There is only one alternative in link group java (providing /usr/bin/java): /usr/lib/jvm/jdk1.8.0_201/bin/java
Nothing to configure.
```
否则，选择合适的 JDK即可。
查看Java版本
```
java -version
```
## 02.安装Anaconda
[Anaconda历代版本](https://repo.continuum.io/archive/)
因为有一下python版本的对应，这里给个对照图表好了
![Alt](https://img-blog.csdnimg.cn/20181227144158333.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3l1ZWppc3VvMTk0OA==,size_16,color_FFFFFF,t_70#pic_center)
这里我下载的是**Anaconda3-5.2.0-Linux-x86_64.sh**
执行以下命令安装：
```
bash Anaconda3-5.2.0-Linux-x86_64.sh
```
因为 Anaconda 的环境变量只会添加到 ~/.bashrc 下，而使用 zsh 的需要在 ~/.zshrc 下添加，执行
```
sudo gedit ~/.zshrc
```
在文件末尾加入
```
#added by Anaconda3 installer
export PATH="/home/akilar/anaconda3/bin:$PATH"//akilar是我的用户名，改成你自己的
  ```
保存后执行
```
source ~/.zshrc
```
## 03.浏览器
火狐我是不习惯，香肯定还是chrome香。
下载chrome的deb安装包[chrome for linux](http://www.ubuntuchrome.com/)
使用**sudo dpkg -i 包名.deb**安装即可。

接下来要下载一个叫SwitchyOmega的插件。这关系到下面的v2ray安装。
不过有点矛盾，我就是因为要翻墙才下插件，但是要翻墙了才能在谷歌应用社区下插件。
所以呢，就要靠万能的github了，谢天谢地它还没被墙。
访问[SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega/releases)
拉到最下下载这个文件 ：SwitchyOmega_Chromium.crx
下载完成后安装到chrome内。
- 可能遇到的bug：
新版本的chrome似乎不支持直接使用crx脚本安装。这里先把SwitchyOmega_Chromium.crx改名为
SwitchyOmega_Chromium.zip，解压后保存为SwitchyOmega_Chromium文件夹。
在chrome里头像旁边三个点->setting->more tools->extensions->development->load unpack，
(头像旁边三个点->设置->更多工具->扩展->打开开发者模式->加载已解压的扩展程序)
选择SwitchyOmega_Chromium文件夹即可。



## 04.科学上网
### i. electron-ssr
ssr的用户可以安装electron-ssr
这是一个Ubuntu下也能够使用的ssr客户端，下载
[electron-ssr](https://github.com/erguotou520/electron-ssr/releases)中的release，
我的是**electron-ssr-0.2.6.deb**
下载后在该位置打开terminal，
```
sudo dpkg -i electron-ssr-0.2.6.deb
```
虽然deb可以像在windows下执行exe一样双击安装，但是吉皮说过，程序员就要用命令行，
图形化界面一点也不优雅。
开个玩笑，事实上命令行内方便使用
```
sudo apt-get update
sudo apt-get install -f
```
这两行命令来修复依赖关系。以后会经常用到它们的。

### ii. v2ray
v2ray的用户请使用v2ray，~~感觉这是一句废话~~

有现成的安装脚本，但在那之前必须先准备好配置文件。希望你们已经看过win10系统下v2rayN客户端的教程。
[机械革命深海幽灵z2 win10 1809 重装日记](https://akilarlxh.github.io/2019/04/08/%E6%9C%BA%E6%A2%B0%E9%9D%A9%E5%91%BD%E6%B7%B1%E6%B5%B7%E5%B9%BD%E7%81%B5z2-win10-1809-%E9%87%8D%E8%A3%85%E6%97%A5%E8%AE%B0/)
先在win10的v2rayN客户端选中所有的结点，然后右键->导出所选服务器为客户端配置，导出的文件保存为config.json

切回ubuntu，先在git上下载指定的客户端源代码，没有图形化界面真是抱歉呢。
客户端的源代码网址:[v2ray-core](https://github.com/v2ray/v2ray-core)
非64位系统到这里找找指定的版本。
```
sudo wget https://github.com/v2ray/v2ray-core/releases/download/v4.18.0/v2ray-linux-64.zip
//这是Linux64位系统的客户端，不是的话请自行到官网查找。
sudo wget https://install.direct/go.sh
//这是一键安装脚本
sudo bash go.sh --local ./v2ray-linux-64.zip
//安装v2ray
sudo cp config.json /etc/v2ray/config.json
//ubuntu内客户端和服务端共用同一个配置文件，所以需要复制配置文件，
//但是最新版本这一步不需要了，因为脚本已经帮您复制好了
sudo chmod 777 /etc/v2ray/config.json
//给予配置文件读写权限
sudo gedit /etc/v2ray/config.json
//打开你的配置文件
```
接下来就要用到一开始在win10那边生成的文件了
ubuntu是直接可以读写win10那边的文件的真是太好了，不用重启一次。
把那边的config.json文件内容全部拷贝过来，覆盖到/etc/v2ray/config.json内
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
在chrome的SwitchyOmega插件上，选项里新建情景模式，我命名为proxy
具体配置是这样的：
![proxy](https://s2.ax1x.com/2019/04/08/A5QZ6A.png)
其中10808是我的服务器端口，见上文配置文件config.json内的注释。
127.0.0.1则是本地的IP地址。
打开terminal
```
service v2ray start    //启动v2ray
service v2ray status   //查看v2ray状态
service v2ray stop     //停止v2ray，不过一次配置以后一直是开机启动的。
service v2ray restart // 重启v2ray，修改配置文件后重启一下v2ray
```
记得在浏览器里把情景模式设置为auto switch，这样浏览器会自动选择是直接连接还是代理。

## 04.jetbrain全家桶安装（IDE）
这个就不得不说jetbrain大法好了，直接到官网下载[jetbrain toolbox](http://www.jetbrains.com/toolbox/app/),
然后就能像在creative cloud上安装adobe全家桶一样方便的在Ubuntu上安装jetbrain全家桶了
常用的有

- python：pycharm professional
- java：idea Ultimate
- C/C++:clion
- android：android studio

需要免费使用的可以去申请一下学生账号资格。

[jetbrain 学生产品](https://www.jetbrains.com/shop/eform/students)



## 05.安装Atom
Atom作为一个代码查看器实在是碾压sublime，而且插件也同样丰富，就是小水管安装有点难受，翻墙代理都拯救不了的速度。
从 [ 官网 ]( https://atom.io/ ) 下载  deb安装包
```
sudo dpkg -i atom-amd64.deb
```
# 八、常用软件
## 01.通讯软件和下载软件

不管是微信，qq,tim还是随便什么，反正先安装[deepin-wine](https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu)。
在download文件夹内打开terminal
```
git clone https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git
//这是中国的镜像网站，快速一点
```
下载好以后进入该文件夹
运行
```
sudo ./install.sh
```
如果出错，运行
```
sudo apt-get update
sudo apt-get install -f
```
修复依赖关系后重新安装一遍。
```
sudo ./install.sh
```
以下是几个常用软件，下载deb文件后用**sudo dpkg -i 包名.deb**安装即可
[qq](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.im/)
[tim](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.office/)
[wechat](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.wechat/)
[百度网盘](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.baidu.pan/)
[迅雷极速版](http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.thunderspeed/)



## 02.输入法
搜狗输入法有bug，偶尔会出现中文乱码，但还是习惯这个，没办法的事情。
[sogou input for linux](https://pinyin.sogou.com/linux/)
使用**sudo dpkg -i 包名.deb**安装。

打开设置，语言选项，按manager installed language选项，肯定会出错，没关系，打开terminal
```javascript
sudo apt-get update
sudo apt-get install -f
```
可能需要多试几次。不报错了，再安装一遍搜狗输入法。

然后在语言管理界面把键盘输入法系统改为fcitx。

重启以后把搜狗输入法添加进去即可。

推荐搜狗输入法皮肤
[科技透明极简](https://pinyin.sogou.com/skins/detail/view/info/510242?rf=search&tf=p)


可能遇到中文乱码bug，简单粗暴一点
```javascript
cd ~/.config
rm -rf SogouPY* sogou*
```
然后重启即可。
# 九、gnome插件
推荐的gnome插件，楠皮就写得很完善了，就当帮他引流了。
[GNOME-SHELL拓展](https://blog.vanxnf.top/2018/10/04/GNOME-SHELL-%E6%8B%93%E5%B1%95/)
## 01.插件拓展支持
先安装一下插件拓展支持，虽然火狐也可以装插件，不过这个时候你一定可以使用chrome了。
```
sudo apt-get install chrome-gnome-shell
//这个是ubuntu系统上的shell拓展支持。
```
## 02.浏览器插件拓展支持
除此之外，你还需要安装浏览器插件拓展支持。
在google应用商店下载
- [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)


## 03.推荐的插件
然后是推荐的插件(看不懂的话，右键google网页翻译)，
不得不说我当初就是因为这些丰富的插件才陷入ubuntu不能自拔的。
- [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
```
Clipboard Manager extension for Gnome-Shell - Adds a clipboard indicator to the top panel, and caches clipboard history.
```

- [Coverflow Alt-Tab](https://extensions.gnome.org/extension/97/coverflow-alt-tab/)
```
Replacement of Alt-Tab, iterates through windows in a cover-flow manner.
```

- [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
```
A dock for the Gnome Shell. This extension moves the dash out of the overview transforming it in a dock for an easier launching of applications and a faster switching between windows and desktops. Side and bottom placement options are available.
```

- [Gnome Shell Audio Output Switcher](https://extensions.gnome.org/extension/1028/gnome-shell-audio-output-switcher/)
```
Gnome-Shell Extension: Easily switch between your audio outputs from the system menu.
```
- [Lock Keys](https://extensions.gnome.org/extension/36/lock-keys/)
```
Numlock & Capslock status on the panel.
```
- [Multi Monitors Add-On](https://extensions.gnome.org/extension/921/multi-monitors-add-on/)
```
Add multiple monitors overview and panel for gnome-shell.
```
- [Pixel Saver](https://extensions.gnome.org/extension/723/pixel-saver/)
```
Pixel Saver is designed to save pixel by fusing activity bar and title bar in a natural way.
```
- [Screenshot Tool](https://extensions.gnome.org/extension/1112/screenshot-tool/)
```
Conveniently create, copy, store and upload screenshots.
```
- [TopIcons Plus](https://extensions.gnome.org/extension/1031/topicons/)
```
This extension moves legacy tray icons (bottom left of Gnome Shell) to the top panel. It is a fork from the original extension from ag with settings for icon opacity, saturation, padding, size and tray position, along with a few minor fixes and integration with the Skype integration extension.
```
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
```
Load shell themes from user directory.
```
- [Suspend Button](https://extensions.gnome.org/extension/826/suspend-button/)
```
Allows to modify the suspend/shutdown button in the status menu.
```







# 十、遇到的bug（不定时更新）
## 01.开机卡在登录界面进不去桌面。
但可以打开命令行界面。也可以进入recovery界面。
不跟他废话，你敢故障我就敢重装你。当然，这里小打小闹重装一下桌面就好。

长按开机键强制重启，在grub启动页选择**Ubuntu高级选项**，从recovery模式启动。也可以按Alt+Ctrl+F1进入命令行界面操作。我是推荐命令行的，虽然我本人是图形界面重度患者。

卸载Xwindows软件
```
 sudo apt-get autoremove ubuntu-desktop
 ```
重新安装所有依赖软件
```
sudo apt-get install ubuntu-desktop
sudo apt-get install python-ntdb
sudo apt-get install libntdb1:amd64
sudo apt-get install libupstart1:amd64
```
重启
```
sudo reboot
```
- 最新的发现是貌似是在寝室使用的时候把主屏幕设置为外接显示器导致的，
- 具体原理还在探索，以上方法治标不治本的。
- 只能是养成好习惯，每次离开寝室的时候把主屏幕设置为内置显示器吧。

## 02.触摸板失灵，无法使用。
Z2的触控板是满足I2C_HID接口要求。而linux 现在已经支持I2C_HID.。
只是18.04的早期内核有BUG，所以无法用。
但该BUG在4.18.15版本以后的内核版本中已经修复.
所以,**只要升级内核到4.18.15以上版本就能支持.**

[ubuntu 内核历史版本](https://kernel.ubuntu.com/~kernel-ppa/mainline/)
下载最新版本的内核文件即可。
比如我就是这四个文件
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