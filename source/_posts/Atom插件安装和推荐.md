---
title: Atom插件安装和推荐
categories: Akilarの糖葫芦
tags: Atom
abbrlink: 498e6e74
date: 2019-05-13 13:37:46
---

# 安装Atom

在{% btn 'https://atom.io/',🔗Atom官网,,blue %} 下载对应版本，因为是个小水管，所以经常会遇到加载失败的问题，有点耐心就可以。
{% hideToggle 下载加速的几种手段 %}
因为atom的release被存放在amazon上，而国内很难直接连上amazon域名，所以下载很慢甚至干脆失败。以下提供几种切实有效的加速下载方案。
1. 科学上网（不推荐，现在大多需要收费）,可以查看这篇教程：{% btn 'https://akilar.top/post/29cf4234.html',🔗Win重装日记,,green %}
2. 使用代理下载服务，可以查看这篇教程：{% btn 'https://akilar.top/post/7357e481.html',🔗从github下载release速度过慢的解决方案,,green %}
访问atom作者的github，找到{% btn 'https://github.com/atom/atom/releases/',🔗Atom的release,,red %}，选择需要的版本，右键，复制链接
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200729100407036.png)
然后使用{% btn 'https://d.serctl.com/?dl_start',🔗Free Download Manager,,blue %}的代下载服务。这一方法也适用于其他的从github上下载release的情况。
3. 使用NDM插件:{% btn 'https://akilar.top/post/e332c532.html',🔗基于NDM和TamperMonkey脚本实现高速下载,,green %}
{% endhideToggle %}
可以预览一下，我的配置效果是这样的。
![](https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20190513014951914.png)

# 安装Atom插件
{% note warning %}
在国内希望通过Atom自带的package安装插件几乎是天方夜谭，所以我这里推荐的是使用**node.js**配合**git**来使用命令行安装。
{% endnote %}

## 安装node.js和git
{% note default no-icon %}
同样的，需要安装node.js和git，安装方法可以对应系统版本参考我那两篇Hexo博客搭建教程。

- {% btn 'https://akilar.top/post/e5502ef6.html',🔗Ubuntu-Hexo+github搭建个人博客,,green %}
- {% btn 'https://akilar.top/post/6ef63e2d.html',🔗Win10-Hexo+github搭建个人博客,,green %}

内容都是放在最前面的了，找起来很容易。
{% endnote %}

## 安装插件
{% note default no-icon %}
因为是通过命令行安装，所以不管是windows系统linux系统，安装步骤都是一样的。这里我拿一个汉化包插件举例。

打开`atom`，在左上角找到`File->Settings->Install`

在搜索框里搜索我们要的插件
**atom-simplified-chinese-menu**
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20190513015804849.png)
不要按右边那个醒目的Install按钮，无限加载看一下午没什么意义。

点击进入介绍界面，找到他的git仓库网址
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20190513020036320.png)
然后就到github了，把这个clone到atom的插件文件夹里
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20190513020210545.png)
在**C:\Users\用户名\.atom\packages**文件夹打开终端，输入
```
git clone https://github.com/chinakids/atom-simplified-chinese-menu
//20200729修订 以下为码云仓库，国内源。
git clone https://gitee.com/akilarlxh/atom-simplified-chinese-menu.git

```
等待git clone 完成，通过cd命令进入这个文件夹,然后使用npm命令安装

```
cd .\atom-simplified-chinese-menu\
npm install
//也可以用yarn安装，直接输入yarn指令即可
```

![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20190513023001785.png)
npm install执行完毕后，重启一下atom就可以在Files->Settings->Packages里找到安装的插件了，启用以后就可以了。有些插件会有自定义配置，这个反正在他的介绍或者github主页里肯定会介绍的。我就不画蛇添足了。

Ubuntu安装方式类似，都是要先找到atom的packages文件夹在哪里。其他都差不多的。
{% endnote %}

# 插件推荐
{% note info %}
为了方便我直接贴github的网址了，免了打开atom搜索的部分，不用谢。
(20200729修订：刚好学会了把github仓库存到码云上再来clone的方法来加速，添加了从我的码云仓库直接获取的git clone指令，需要了解最新版本的依然可以访问原地址仓库。）
{% endnote %}

{% note primary %}
{% btn 'https://github.com/JoelBesada/activate-power-mode',🔗activate-power-mode,,red %}
```
git clone https://gitee.com/akilarlxh/activate-power-mode.git
```
这是一个是代码动起来的插件，具体什么意思呢，代码删除时有一种早期红白机游戏机的特效，具体可以看插件介绍，我最初想要安装插件的动机就是这个特效。
{% endnote %}

{% note primary %}
{% btn 'https://github.com/Glavin001/atom-beautify',🔗atom-beautify,,red %}
```
git clone https://gitee.com/akilarlxh/atom-beautify.git
```
用来整理代码的，不过对python之类对空格对齐都有要求的代码还请谨慎使用。整理代码的快捷键是Ctrl+Alt+B。
{% endnote %}

{% note primary %}
{% btn 'https://github.com/lee-dohm/file-type-icons',🔗file-type-icons,,red %}
```
git clone https://gitee.com/akilarlxh/file-type-icons.git
```
会替换不同类型的文件图标，效果还不错。md风格美美哒。
{% endnote %}

{% note primary %}
{% btn 'https://github.com/atom-minimap/minimap',🔗minimap,,red %}
```
git clone https://gitee.com/akilarlxh/minimap.git
```
类似于sublime的小地图，就是代码总览啦，蛮好看的，多个小窗口阅读的时候有点碍事的话可以在package里停用。
{% endnote %}

# 可能遇到的bug
{% note warning %}
我在安装atom-beautify遇到了报错，原因是未能找到相应依赖，那么我们直接用`npm install -f`指令强制它从远程拉取资源来修复依赖。
{% endnote %}

# 懒人福利
{% tabs 多设备同步,-1 %}
<!-- tab 📝脚本安装 -->

{% note info %}
<center><h2>安装脚本</h2></center>
虽然Atom有一款名叫sync-settings的插件可以实现插件多设备同步，但是sync-settings的同步依赖于github的gist服务，而这一服务很不幸的被墙了。
于是转而用脚本一键安装来实现重装方案。
使用方式为在【C:\Users\用户名\.atom】路径下，新建一个atomplugin.sh的文件，把以下代码复制进去。
```bash
#!/bin/sh
echo "==========================================="
echo "          欢迎使用Atom插件安装脚本！"
echo "==========================================="
AtomPath=$(cd "$(dirname "$0")"; pwd)
cd ${AtomPath}
printf "\033[32m Atom根目录："${AtomPath}"\033[0m"
# 这里的Atom根目录就是C:\Users\用户名\.atom
echo " "
echo "[0] 退出菜单"
echo "[1] 安装Atom汉化包：atom-simplified-chinese-menu"
echo "[2] 安装动态打字插件：activate-power-mode"
echo "[3] 安装代码自动排版插件：atom-beautify"
echo "[4] 安装图标美化插件：file-type-icons"
echo "[5] 安装代码小地图：minimap"
echo "[6] 安装取色器：color-picker"
echo "[7] 安装颜色显示插件：atom-pigments"
echo "[8] 安装代码高亮插件：atom-quick-highlight"
echo "[9] 安装合并冲突处理插件：merge-conflicts"
echo "[10] 安装代码校验插件：linter"
echo "[11] 安装代码补全插件：autocomplete-bibtex"
echo "[12] 安装多端同步插件：Sync-settings"
echo " "
printf "请选择需要的功能，默认选择[0]"
echo " "
printf "选择："
read answer
# 选择1
if [ "$answer" = "1" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取atom-simplified-chinese-menu\n"
git clone https://gitee.com/akilarlxh/activate-power-mode.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装atom-simplified-chinese-menu\n"
cd ${AtomPath}/packages/activate-power-mode
npm install
printf "\033[32mINFO \033[0m atom-simplified-chinese-menu安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择2
else
if [ "$answer" = "2" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取activate-power-mode\n"
git clone https://gitee.com/akilarlxh/activate-power-mode.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装activate-power-mode\n"
cd ${AtomPath}/packages/activate-power-mode
npm install
printf "\033[32mINFO \033[0m activate-power-mode安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择3
else
if [ "$answer" = "3" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取atom-beautify\n"
git clone https://gitee.com/akilarlxh/atom-beautify.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装atom-beautify\n"
cd ${AtomPath}/packages\atom-beautify
npm install -f
# atom-beautify有点特殊，需要使用-f指令强制拉取远程依赖来安装。
printf "\033[32mINFO \033[0m atom-beautify安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择4
else
if [ "$answer" = "4" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取file-type-icons\n"
git clone https://gitee.com/akilarlxh/file-type-icons.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装file-type-icons\n"
cd ${AtomPath}/packages/file-type-icons
npm install
printf "\033[32mINFO \033[0m file-type-icons安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择5
else
if [ "$answer" = "5" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取minimap\n"
git clone https://gitee.com/akilarlxh/minimap.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装minimap\n"
cd ${AtomPath}/packages/minimap
npm install
printf "\033[32mINFO \033[0m minimap安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择6
else
if [ "$answer" = "6" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取color-picker\n"
git clone https://gitee.com/akilarlxh/color-picker.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装color-picker\n"
cd ${AtomPath}/packages/color-picker
npm install
printf "\033[32mINFO \033[0m color-picker安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择7
else
if [ "$answer" = "7" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取atom-pigments\n"
git clone https://gitee.com/akilarlxh/atom-pigments.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装atom-pigments\n"
cd ${AtomPath}/packages/atom-pigments
npm install
printf "\033[32mINFO \033[0m atom-pigments安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择8
else
if [ "$answer" = "8" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取atom-quick-highlight\n"
git clone https://gitee.com/akilarlxh/atom-quick-highlight.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装atom-quick-highlight\n"
cd ${AtomPath}/packages/atom-quick-highlight
npm install
printf "\033[32mINFO \033[0m atom-quick-highlight安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择9
else
if [ "$answer" = "9" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取merge-conflicts\n"
git clone https://gitee.com/akilarlxh/merge-conflicts.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装merge-conflicts\n"
cd ${AtomPath}/packages/merge-conflicts
npm install
printf "\033[32mINFO \033[0m merge-conflicts安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择10
else
if [ "$answer" = "10" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取linter\n"
git clone https://gitee.com/akilarlxh/linter.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装linter\n"
cd ${AtomPath}/packages/linter
npm install
printf "\033[32mINFO \033[0m linter安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择11
else
if [ "$answer" = "11" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取autocomplete-bibtex\n"
git clone https://github.com/apcshields/autocomplete-bibtex.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装autocomplete-bibtex\n"
cd ${AtomPath}/packages/autocomplete-bibtex
npm install
printf "\033[32mINFO \033[0m autocomplete-bibtex安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择12
else
if [ "$answer" = "12" ]; then
cd ${AtomPath}/packages
printf "\033[32mINFO \033[0m 正在从远程仓库拉取sync-settings\n"
git clone https://gitee.com/akilarlxh/sync-settings.git
printf "\033[32mINFO \033[0m 拉取完毕，即将为您安装sync-settings\n"
cd ${AtomPath}/packages/sync-settings
npm install
printf "\033[32mINFO \033[0m sync-settings安装完毕，请重启Atom应用更改\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 选择0，默认选择
else
if [ "$answer" = "0" ] || [ "$answer" = "" ]; then
printf "\033[32mINFO \033[0m 欢迎下次光临！\n"
sleep 1s
exit 0
else
printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
sleep 1s
exec ${AtomPath}/atomplugin.sh
# 注意有几个选项就要有几个fi。
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
```
{% endnote %}
{% note success %}
稍微研究一下，会发现每个选择项的代码是及其相似的，仅仅修改了插件的仓库源相关内容，有兴趣的小伙伴可以自定义编写常用插件到脚本内。
{% endnote %}
<!-- endtab -->
<!-- tab 🚀sync-settings -->

{% note danger no-icon %}
<center><h2>Sync-settings</h2></center>
这个方法需要翻墙，游客止步。
Sync-settings插件的同步原理是通过插件生成配置文件，上传到gist，gist是github提供的一个代码片段存储手段，所以某种角度上也可以看做是生成了一个配置脚本。以下是具体的使用方式。
首先按照老规矩先安装插件。
{% btn 'https://github.com/atom-community/sync-settings',🔗Sync-settings,,red %}
```bash
git clone https://gitee.com/akilarlxh/sync-settings.git
cd C:\Users\User\.atom\packages\sync-settings #记得改为自己的路径
npm install
```
安装完成后，打开Atom，找到插件的配置页，需要配置两个内容，分别是Personal Access Token和Gist Id。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908105519786.png)
1. 打开自己的 github 创建一个 [personal access token](https://github.com/settings/tokens)
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908105149957.png)
记住要勾选 gist 权限，见下图），
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908105305017.png)![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908105305017.png)
然后复制生成的 token 序列粘贴到插件的Personal Access Token项内。Token只有生成的那次可见，如果忘记 了就只能重新生成了。
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908105403503.png)
2. 点击头像旁边的箭头，找到[Your gists](https://gist.github.com/),创建一个gist
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908110109708.png)
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908110409169.png)
gist id可以在网页URL上找到
![](http://akilar-1259097125.cos.ap-shanghai.myqcloud.com/Atom%E6%8F%92%E4%BB%B6%E5%AE%89%E8%A3%85%E5%92%8C%E6%8E%A8%E8%8D%90/20200908110850286.png)
配置完成后就能在atom的工具栏里通过扩展->Syncchronize Settings进行操作，会上传你的插件以及快键键乃至布局配置到gist。
如果要换设备的话，只需要按照sync-settings并且重新配置token和gist id即可。
gist id与token没有关联关系，所以每次使用重新生成token也可以。
{% endnote %}
<!-- endtab -->
{% endtabs %}
