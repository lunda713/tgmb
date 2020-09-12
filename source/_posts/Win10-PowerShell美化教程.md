---
title: Win10:PowerShell美化教程
author: Akilarlxh
description: 对Win10的powershell进行美化，使用ConEmu替换powershell，加装oh-my-posh实现主题风格。
tags:
  - 🍨Win10
categories:
  - 🍨Akilarの棉花糖
abbrlink: 8a76eb87
date: 2019-04-12 09:52:00
---
# 写在最前
{% hideToggle 无聊的碎碎念不用在意 %}
我一直秉持着一个美化舒适的开发环境能够极大的激发编程的兴趣这件事。

体验过了Ubuntu以后为什么会对它如此着迷呢？我曾经这样问过自己，但是迟迟没想到答案。于是我又复读了两遍我以前写的Win10和Ubuntu重装日记，发现了一件事情。


那就是Ubuntu下的oh-my-zsh实在是太好用了，界面美观还能提示git的文件夹状态。简直甩Win10下的git bash十条街啊。所以怎么说呢。有了这个想法，就一定会希望Win10下也可以用。虽然我知道Win10专业版是有Linux虚拟机的，可以创建子系统，但是我现在是家庭版，又舍不得那个钱去买个升级码。重装是不可能重装的。

那么，到底能不能改一下Win10下的powershell风格呢？答案当然是可以的。~~不然我写这个干嘛。~~

使用JanDeDobbeleer大神发布的git项目——[oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)，这是一个用 ConEmu替换默认shell来实现主题风格化shell的插件。具体名词不要太深究，好看就完事了。
{% endhideToggle %}


# 安装必要软件
先放一下oh-my-posh的官方网站，其实就是个git仓库。
- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)

{% hideToggle ConEmu安装包已经释出，Chocolatey现已成为非必要内容了 %}
## 安装[Chocolatey](https://chocolatey.org/)
（20200728修订，chocolatey非必须，原本是为了给ConEmu提供安装路径和修复依赖，但是现在ConEmu作者已经释出了安装包，可以直接安装。至于依赖的.C环境和python环境，需要的时候再装即可。）

官方发布了两种安装方法，一种是通过cmd，一种是通过powershell，这里我是从powershell安装。

安装方法：先在管理员模式下启动powershell。**win+X后再按A**
```bash
# 以下为官方提示，大意为按照Chocolatey需要获得相应权限，因此执行相应代码。
With PowerShell, there is an additional step. You must ensure Get-ExecutionPolicy is not Restricted. We suggest using Bypass to bypass the policy to get things installed or AllSigned for quite a bit more security.
# 对于PowerShell，还有一个额外的步骤。您必须确保访问执行政策不受限制。我们建议使用旁路绕过策略来安装或全部同意，以获得更多的安全性。*

Run Get-ExecutionPolicy. If it returns Restricted, then run Set-ExecutionPolicy AllSigned or Set-ExecutionPolicy Bypass -Scope Process.
Now run the following command

Get-ExecutionPolicy运行。如果返回受限，则运行Set-ExecutionPolicy AllSigned或Set-ExecutionPolicy旁路作用域进程。
```

现在运行以下命令:
```bash
Set-ExecutionPolicy AllSigned
# 在接下来的选项中选择A而不是Y
# 接着运行以下命令
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

如此一来就安装好了。这里需要某种“较为稳定的稳定的网络环境”。记得开全局模式。
{% endhideToggle %}

## 安装[ConEmu](https://www.fosshub.com/ConEmu.html)

ConEmu相当于windows终端的增强版,可以直接打开多种类型的控制台窗口，安装完了会用它替换powershell，调试好以后使用感觉一定比原版powershell好。

若事先安装好了chocolatey，那么直接在powershell中用命令安装就好
```bash
choco install ConEmu
```
若没有安装chocolatey,直接访问[ConEmu](https://www.fosshub.com/ConEmu.html)官网下载安装即可。
如果有下载过慢的情况，可以考虑访问这篇教程：[基于NDM和TamperMonkey脚本实现高速下载](https://akilar.top/post/e332c532.html)

## 安装Powerline字体
直接安装oh-my-posh，由于缺少字体支持，会出现乱码，为了优质体验，需要安装Powerline字体。

- [powerline/fonts](https://github.com/powerline/fonts)

安装方法要用到git。**Win+X然后再按A**，启动powershell管理员模式。执行代码：
```bash
# 为了保证下载速度，此处已经替换成了gitee的镜像仓库
git clone https://gitee.com/akilarlxh/fonts.git --depth=1
# install
cd fonts
./install.ps1
```

{% hideToggle 可能遇到的bug %}
这个问题主要是powershell的脚本运行执行权限没有赋予完全。之后可能会经常遇到，我就不多说了，只写这一次。

**如果提示：**
```bash
无法加载文件 ******.ps1，因为在此系统中禁止执行脚本。有关详细信息，请参阅 "get-help about_signing"。
所在位置 行:1 字符: 17
+ E:\Test\test.ps1 <<<<
+ CategoryInfo : NotSpecified: (:) [], PSSecurityException
+ FullyQualifiedErrorId : RuntimeException
```

**那么执行：**
```bash
set-ExecutionPolicy RemoteSigned
```

**在接下来的选项中输入Y来获取执行政策。**
{% endhideToggle %}

# 安装posh-git和oh-my-posh

依旧是Win+A后按A打开powershell管理员模式。
输入
```bash
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
# 安装完成后，需要修改主题配置的脚本文件，执行以下命令
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
notepad $PROFILE
# 在打开的.ps1配置文件中加入以下内容
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster
```

其中Set-Theme Agnoster设置了Agnoster主题,也可以去官网找其他你喜欢的风格
- [oh-my-posh themes](https://github.com/JanDeDobbeleer/oh-my-posh)
拉到最下面有主题预览，所见即所得。
![](https://s2.ax1x.com/2019/04/12/AbuHNq.png)

# 设置ConEmu

先放一下我的配置效果：
![](https://s2.ax1x.com/2019/04/12/AbnezD.png)
设置很简单。打开ConEmu，右键上方栏位，选择setting：

## 把界面默认语言改为中文简体：

![](https://s2.ax1x.com/2019/04/12/AbnXmd.png)
## 设置默认启动shell为powershell

当然你也可以选择别的，例如管理员模式
![](https://s2.ax1x.com/2019/04/12/Abnq6e.png)

## 设置字体为powerline字体

这里我用的是Meslo LG M，你也可以改成别的，有powerline字体标识就好。
![](https://s2.ax1x.com/2019/04/12/AbnLOH.png)

## 设置不显示标签栏

把标签栏显示设置为不要显示，要是想留着也没事。
![](https://s2.ax1x.com/2019/04/12/AbnHSO.png)

## 取消显示状态栏

把状态栏显示的勾选去掉，要是想留着也没事。
![](https://s2.ax1x.com/2019/04/12/AbnTfK.png)

## 设置powershell为默认shell

这里我选择的是管理员模式，你也可以只选powershell。
![](https://s2.ax1x.com/2019/04/12/AbnblD.png)

## 设置ConEmu为默认shell

这一步的目的就是为了用ConEmu替换掉powershell，原生的Powershell是不支持第三方字体的。没关系，按照上面的设置以后，界面效果只会更好。
![](https://s2.ax1x.com/2019/04/12/Abnj0A.png)

# 五、后记

至此，powershell美化就完成了，如果你是用安装版的git，那么你可以直接通过在你的Hexo文件下，按住shift，右键，在此处打开powershell，然后在powershell（其实是ConEmu了）里使用hexo和git命令了。绿色版的git的话，请你老老实实去把GIT_HOME之类的环境变量配好吧。
