---
title: Win10重装日记
categories:
  - Akilarの棉花糖
tags:
  - Win10
  - 系统重装
author: Akialrlxh
description: Win10重装日记，包含系统激活及常用软件推荐以及美化方案。
abbrlink: 29cf4234
date: 2019-04-08 15:22:00
sticky: 1
---
# 写在最前
{% hideToggle 无聊的碎碎念不看也罢 %}
{% note info no-icon %}我觉得既然连不常用的Ubuntu都写了一个不一定会用到的重装教程，那么经常出问题的Win10是肯定要写一个的了。实话说现在这个就有点毛病，诸如剪切复制粘贴文件的时候进度条窗口不显示，还有就是开机logo丢失，但是要是重装一遍的话，因为 Ubuntu的开机引导是装在Win10系统盘里，啊，盘根错节，我要不还是别把原来的小米air13卖掉了，两台电脑两个系统能省好多事情。不行，grub界面和双系统看上去比较有逼格啊，我当程序员的初衷就是觉得能把电脑搞得花里胡哨很帅啊，尤其是命令行窗口代码翻飞的样子，像极了黑客帝国，罗曼蒂克有木有。不行，我生病了，开始说胡话了。
{% endnote %}
{% endhideToggle %}

# 准备工作
{% note default no-icon %}
没什么好说的，一个可以正常使用的U盘，没必要太好，随便买个usb2.0的都可以，当然3.0的话安装会快一点哦。
我所用到的软件：
链接:https://pan.baidu.com/s/1JAzVP9UNBdkV4a6mK54fcg 提取码: 030e
百度网盘下载加速方案可以参看这篇教程：[基于NDM和TamperMonkey脚本实现高速下载](https://akilar.top/post/e332c532.html)
{% endnote %}


## 制作PE启动盘
{% note default no-icon %}
1. 先安装`WePe`，这是一个纯净的PE系统，不会给你安装任何全家桶服务，虽然很久没有更新了，但是功能完善，依然可用。
[WePE Downlload](http://www.wepe.com.cn/download.html)
2. 下载第一个`微PE工具箱V2.0`，附带的Win10系统在下面也有，一并下载即可，虽然win pe本身没在更新，但是这个系统镜像还是有在更新的。
系统镜像使用的是磁力链接，如果迅雷下载过慢，可以使用百度网盘的离线下载功能，然后使用上述的NDM下载（NDM不支持P2P下载技术）。
*如果是双系统用户，注意确认Ubuntu的引导是否是安装在windows系统盘内的，若是，那么格式了系统盘之后，Ubuntu的引导也就挂了，到时候最快的办法还是重装Ubuntu。*
3. 后面都是直接傻瓜式安装，wepe会`格式化你的U盘`，千万别放什么重要文件在U盘里头。
{% endnote %}


### 设置启动项
{% note default no-icon %}
PE盘制作好把机械革命的系统镜像文件放进去。然后`重启，按F2`，（不同品牌机型进入bios界面的按键也不一样，可以根据**品牌**和**bios**为关键词自行百度）进入`bios`界面，在`BOOT`选项里把`#option1`设置为`USB启动项`，应该是你的U盘的名字，2.0,3.0这些字样的那个。`F4保存`退出重启就进入PE系统了。
{% endnote %}

### 装载iso文件
{% note default no-icon %}
PE里找到镜像iso文件，`右键装载`，进入以后找到**setup.exe**，双击打开界面，
此时不要马上点击开始安装，我们需要先把要装的位置的**系统盘转化为GPT格式**。
按住`shift+F10`，打开命令行，输入
```bash
diskpart
# 进入DISKPART命令模式，输入
list disk
# 根据磁盘大小找到你要的那个系统盘位置，
# 比如我的系统盘位置是0
# 则输入
select disk 0
# 输出：磁盘 0 现在是所选磁盘
#输入
clean
# 成功的清除了磁盘，此操作不可逆
# 最后输入
convert gpt
```
将磁盘转换为gpt格式以后，关闭命令行窗口，点击开始安装，根据指示选择你需要的系统版本和安装磁盘位置即可。
记得**安装完成以后重启之前拔出U盘**，否则又会启动到PE系统的。
{% endnote %}

{% hideToggle 重启以后配置用户名（强迫症必看） %}
{% note default no-icon %}
安装成功以后设置用户名的时候，cortana肯定会劝你使用微软账号登录，然后你一旦用了邮箱，
到时候你的个人用户文件夹就会变成邮箱的前5位字符，要改就涉及到管理员账号，之后配置的大把环境变量也可能出问题。
所以**一定要先建立本地账户登录!!!!!**
之后系统配置完成了，进入熟悉的桌面了，再使用微软账号登录。不过虽然本地账户可以超过五个字符了，但是尽量不要用中文，容易出bug。
{% endnote %}
{% endhideToggle %}

### 安装以后系统激活
{% note default no-icon %}
激活方法（全部版本通用）：
win+X再按A，以管理员模式打开powershell，
输入
```bash
slmgr /ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
# 安装Win10密钥
slmgr /skms zh.us.to
# 设置kms服务器
slmgr /ato
# 激活Win10系统
slmgr /xpr
# 查询激活状态
```
kms激活一般180天，到期后再次激活即可。
[可用的kms激活服务器](http://www.xitongcheng.com/jiaocheng/dnrj_article_44606.html)

如果是其他版本也可以使用KMSPico
{% endnote %}

# 安装开发环境
{% hideToggle 一点个人习惯 %}
{% note info %}
这里先说一下楠皮教我的理念，我之前的意识一直停留在机械硬盘时代，就想着把软件装在非系统盘，
但现在电脑一般都把系统装在固态硬盘，所以我完全没必要去忧心开机速度。
最合理的方式就是把那些可以安装的软件都放在系统盘，而自己写的工程文件和其他文档电影之类的放在非系统盘，
这样一来就算系统崩了，下次大不了格式化了系统盘，重装一下，工程文件都还在，开发环境配好就和原来一样了。
{% endnote %}
{% endhideToggle %}

## 安装配置java
{% note primary %}
[Java8下载](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
我这里选择的是**jdk-8u211-windows-x64.exe,下载完成后双击安装，**
双击安装，路径默认。后面也是全部默认安装。
安装完成后，可在命令行窗口，输入`java -version`查看java安装版本。
{% endnote %}

### 环境变量配置
{% note default no-icon %}
1. 我的电脑→右键→属性→高级系统设置→环境变量（可以右键固定在任务栏，以后会经常用到的）
```bash
JAVA_HOME  
C:\Program Files\Java\jdk1.8.0_211
```

2. 新建一个变量名为`JAVA_HOME`的系统变量，变量值为`C:\Program Files\Java\jdk1.8.0_211`（jdk的安装目录，根据个人所安装的目录修改）
![JAVA_HOME](https://s2.ax1x.com/2019/04/08/A4fnV1.png)

3. 再新建一个变量名为`CLASSPATH`，变量值为`.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;`的系统变量，
注意前面的点号和分号都是有的
```bash
CLASSPATH
.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
```
![CLASSPATH](https://s2.ax1x.com/2019/04/08/A4fuUx.png)

4. 打开`Path`系统变量，点击新建，添加`%JAVA_HOME%\bin”和“%JAVA_HOME%\jre\bin`两个系统变量。Path使得系统可以在任何路径下识别java命令
```bash
%JAVA_HOME%\bin
%JAVA_HOME%\jre\bin
```

![Path](https://s2.ax1x.com/2019/04/08/A4febR.png)
4.验证：点击保存后，打开powershell,分别输入`java`和`javac`
```bash
java -version
java
javac
```
都正常运行即代表java已经正确安装
![java](https://s2.ax1x.com/2019/04/08/A5neaD.png)
![javac](https://s2.ax1x.com/2019/04/08/A5nZVO.png)
{% endnote %}

## Anaconda

{% note info %}
Anaconda是一个python库管理软件，可以方便的管理和安装python的各类库。
[Anaconda历史版本](https://repo.continuum.io/archive/)
这里再附上历史版本和python版本的对应。这里虽然可以通过安装`venv`虚拟环境置换，但是我只要`python3.6`干嘛多此一举。

![Anaconda版本与python版本对于关系](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E6%9C%BA%E6%A2%B0%E9%9D%A9%E5%91%BD%E6%B7%B1%E6%B5%B7%E5%B9%BD%E7%81%B5z2-win10-1809-%E9%87%8D%E8%A3%85%E6%97%A5%E8%AE%B0/20190612072907886.png)

我选择的是`Anaconda3-5.2.0-Windows-x86_64.exe`
下载安装，这里我建议是安装在系统盘，但是考虑到以后的库文件会很多，所以我还是装在非系统盘了。
记得点选把环境变量加入到path。
{% endnote %}

## 科学上网
{% tabs 科学上网,-1 %}

<!-- tab ⚡electron-ssr（已失效） -->
{% note default no-icon %}
<center><h2>electron-ssr</h2></center>
（electron-ssr已经停止更新，原作者删除了源代码,目前只能找到备份库，而且功能已经失效）
虽然我大概马上要换成`v2ray`，但是还是要推荐一下这个`electron-ssr`，全系统图形化界面多么人性化。
[electron-ssr](https://github.com/erguotou520/electron-ssr/releases)
在`release`那里下载最新的客户端即可，我的是`electron-ssr-0.2.6.exe`，下载后双击打开，添加自己的ssrr链接即可。
{% endnote %}
<!-- endtab -->

<!-- tab 🚀v2rayN（仅支持v2ray） -->
{% note default no-icon %}
<center><h2>v2rayN</h2></center>
作为一个开源的翻墙项目，`v2ray`的稳定性比`ssr`好了不是一星半点。

- [v2rayN](https://github.com/2dust/v2rayN/releases)

下载`v2rayN-core`即可。解压后打开`v2rayN.exe`
在任务栏找到图标，打开主界面，在“推广”里可以找到很多网站，这些都是运营v2ray服务的，
选择时不要贪图小便宜，价格在15元/月左右的才是正常的，过低的极有可能跑路。
网站内一般自带订阅配置教程，这里不再赘述。
{% endnote %}
<!-- endtab -->

<!-- tab 🐱Clash（最推荐） -->
{% note default no-icon %}
<center><h2>Clash</h2></center>
clash是一个基于Go语言开发的多平台代理客户端，目前在众开发者的努力下已经实现Mac、Windows、Linux、Android上的客户端。目前clash同时支持ssr和v2ray的协议，但是要注意查看你选择的代理服务网站是否提供clash的订阅服务，如果没有，那将是一件很糟心的事情。

- [Clash for windows](https://github.com/Fndroid/clash_for_windows_pkg/releases)
- [Clash for Android](https://github.com/Kr328/ClashForAndroid/releases)
这里仅以clash for windows为例，至于android还请自行领悟。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/win10%E9%87%8D%E8%A3%85%E6%97%A5%E8%AE%B0-/20200708045049111.png)
{% endnote %}
<!-- endtab -->
{% endtabs %}

## 浏览器
{% tabs 浏览器,-1 %}
<!-- tab ♥️Google Chrome -->
{% note default no-icon %}
搞定翻墙以后安装`chrome`，云端设置同步，一切都和原来一样。
（2020-7-8修订，如果使用的是clash 客户端作为科学上网代理，将SwitchyOmega插件设置为系统代理服务即可，Clash客户端本身就会帮你处理好代理问题）
- [chrome下载](https://chrome.en.softonic.com/)
{% endnote %}
<!-- endtab -->
<!-- tab ♣️Microsoft Edge -->
{% note default no-icon %}
Microsoft Edge更新至最新版以后，因为采用了chromium内核，所以在某种程度上就是个山寨的Chrome，配置插件后体验不输于Chrome，
对于不想翻墙的用户是个很好的替代品。
使用方式可以参看这篇教程:[玩转Microsoft Edge](https://akilar.top/post/8c8df126.html)
{% endnote %}
<!-- endtab -->
{% endtabs %}

## IDE安装，jetbrains全家桶
{% note default no-icon %}
jetbrains产品的UI设计和庞大的插件能够给编程带来极为舒适的体验。
[jetbrains toolbox](http://www.jetbrains.com/toolbox/app/)
登录自己的学生账号以后就能免费使用一年。在校期间总共可以验证三次。
{% note primary %}
学生账号认证 [jetbrains学生产品](https://www.jetbrains.com/student/)
{% endnote %}
用自己的大学分配的邮箱，应该是学号加学校网站域名，不知道的搜自己大学官网找学生邮箱。
推荐安装：
java：IDEA Ultimate
python：pycharm professional
c/c++ ：CLion
{% endnote %}

## 数据库软件Mysql
{% note primary %}
1. 在官网下载安装版[Mysql](https://dev.mysql.com/downloads/mysql/)，找到MySQL Community Server
2. 保险起见，再下载[directX修复工具增强版 v3.8](https://www.crsky.com/soft/31471.html#down)把缺少的一些依赖修复。否则在后面的安装可能遇到问题。
3. 然后一路默认安装即可，期间会提示输入密码，改个简单的，不输密码也会有很多事的，还不如输一个。我下载的是5.7的社区版**MySQL Community Server 5.7**，暂时不推荐8.0+版本，因为加密方式不一样，navicat for mysql无法读取数据库。
4. 然后是安装navicat for mysql。首先放一下Navicat破解补丁
链接: https://pan.baidu.com/s/1FgFvAQI2xKAkStINgAyQ9g 提取码: KMps，
下载完成后先双击**navicat_trial_11.1.20.0.1449226634.exe**默认安装，不过也可以自定义路径，记住路径即可。然后双击**PatchNavicat.exe**，选择刚刚安装的Navicat安装路径下找到navicat.exe文件，点击选择即可激活。
{% endnote %}

## 常用软件
{% tabs 常用软件,-1 %}
<!-- tab Atom -->
{% note danger no-icon %}
[Atom](https://atom.io/)是一个极为强大的，开源的文本编辑器，安装插件以后甚至可以当做IDE使用。
详细插件配置可以参考这篇教程：[Atom插件安装和推荐](https://akilar.top/post/498e6e74.html)
{% endnote %}
<!-- endtab -->
<!-- tab 腾讯QQ -->
{% note warning no-icon %}
[腾讯qq](https://im.qq.com/)通讯软件，一边痛骂马化腾，一边真香。没啥好说的。
{% endnote %}
<!-- endtab -->
<!-- tab Tim -->
{% note success no-icon %}
[TIM](https://office.qq.com/):没啥好说的。和QQ二选一即可
{% endnote %}
<!-- endtab -->
<!-- tab 火绒安全软件 -->
{% note info no-icon %}
[火绒安全软件](https://www.huorong.cn/)比其他自称杀毒软件实则比病毒还流氓的软件好多了，
纯净而且功能完善。虽然windows自带的windows defender功能就已经很强大，不过我习惯了有个安全管家的感觉了。
{% endnote %}
<!-- endtab -->
<!-- tab 网易云音乐 -->
{% note primary no-icon %}
[网易云音乐](https://music.163.com/)唯一一个我一玩起来能玩的比游戏还久的软件
{% endnote %}
<!-- endtab -->
<!-- tab 弹弹play -->
{% note danger no-icon %}
[弹弹play](http://www.dandanplay.com/)是一个看新番的软件，p2p下载，基本上b站上有的资源都有，
会员不想买就在这下载着看，能加载弹幕，也能发弹幕，和b站没有太大差别了。不过毕竟是没买票，还请低调。
{% endnote %}
<!-- endtab -->
<!-- tab ThunderX破解版 -->
{% note warning no-icon %}
[ThunderX破解版](https://www.luochenzhimu.com/):迅雷破解版，不是会员胜似会员。便携免安装版，下载速度主要看资源，
不过现在发现下载一些版权电影时会提示版权所有无法下载，迅雷已经被招安了。只能网盘见。
{% endnote %}
<!-- endtab -->
<!-- tab Morphvox pro -->
{% note warning no-icon %}
[Morphvox pro](https://www.52pojie.cn/forum.php?mod=viewthread&tid=826562)
纯粹是个人恶趣味，这个是个很有意思的变声器软件，不过只能在电脑上使用，会用虚拟声卡替换你的话筒，使得所有录进去的声音都被变声，开黑吗，我萝莉音。
{% endnote %}
<!-- endtab -->
<!-- tab Potplayer -->
{% note warning no-icon %}
[potplayer](http://potplayer.daum.net/?lang=zh_CN)
视频播放软件，解码器是我见过最完全的，而且颜值也很高，用起来尤为舒服。
{% endnote %}
<!-- endtab -->
{% endtabs %}

# 美化软件

{% note info %}
我发现在Win10这边，我是把Ubuntu的安装顺序反过来了，Ubuntu那边第一件事是先美化，Win10这边是最后才做。怎么说呢，毕竟Win10是图形化界面，Ubuntu那边修改grub一言不合搞不好引导就挂了，自然是早点解决好。
{% endnote %}



## 主题美化
{% note primary %}
[致美化主题先锋网](https://zhutix.com/)
{% endnote %}
{% note info %}
这是一个非常完善的主题美化网站，各种教程应有尽有，还是视频和图文的，绝对不存在不会用的问题。
软件只需要安装01文件夹里的必装软件即可，02里的右键快捷选项有点用处，透明软件推荐blend，所以03文件夹可以删除了。
{% endnote %}

## 窗口美化
{% note primary %}
[窗口半透明软件blend](https://zhutix.com/tools/touming-blend/)
{% endnote %}
{% note info %}
一款半透明化软件，所有页面都可以半透明，而且支持给每个窗口单独定制透明度，开机启动不占多少资源。反正比上面提到的03文件夹里的玩意儿好用多了。
{% endnote %}

## 主题推荐
{% note primary %}
[Arc X 豪华版](https://zhutix.com/pc/arc-x-s/)
{% endnote %}

## 图标推荐
{% note primary %}
[orian-ipack](https://zhutix.com/ico/orian-ipack/)
{% endnote %}

## 鼠标指针推荐
{% note primary %}
[Apostle](https://zhutix.com/ico/apostle-cs/)
{% endnote %}

{% note warning %}
虽然Win10也有一个叫My Dock的软件可以让任务栏看起来像mac一样，
但是还不成熟，bug贼多（易语言写的，自己感受），就不贴出来了。
其他的像`SAO  Utils`和`rainmeter`之类的，我已经过了那个年纪了。
{% endnote %}

{% note primary %}
[SAO Utils](http://www.gpbeta.com/post/develop/sao-utils/)
{% endnote %}
{% note primary %}
[Rainmeter](https://bbs.rainmeter.cn/forum-210-1.html)
{% endnote %}
{% note default no-icon %}
自己探索去吧。
{% endnote %}


# 遇到的bug归纳（不定时更新）
## 复制粘贴时进度条窗口不显示
{% note default no-icon %}
打开cmd或者powershell
输入命令：
```bash
regsvr32 shell32.dll
```
{% endnote %}


## 玩游戏时显示.dll文件丢失
{% note success %}
下载一个directX修复工具增强版修复
[directX修复工具增强版 v3.8](https://www.crsky.com/soft/31471.html#down)
{% endnote %}

## Win10桌面图标设置，点开显示rundll32.exe无法访问指定设备、路径或文件。

{% note default no-icon %}
win+R打开运行窗口，输入
```bash
rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0
```
即可打开图标设置窗口
{% endnote %}
