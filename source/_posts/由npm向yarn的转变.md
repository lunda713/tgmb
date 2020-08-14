---
title: 由npm向yarn的转变
categories: Akilarの糖葫芦
tags: yarn
abbrlink: e6610502
date: 2019-06-03 20:12:39
---

# 参考文章

[yarn的安装和使用](https://blog.csdn.net/yw00yw/article/details/81354533)

# 安装

先放一下没啥用的安装指导手册
[安装|yarn](https://yarnpkg.com/zh-Hans/docs/install#windows-stable)

在使用前希望你已经安装了node.js，访问官网直接下载最新版全部默认安装即可。

[node.js](https://nodejs.org/en/)

然后打开Terminal或者shell，总之命令行窗口就成。
输入
```
npm install -g yarn
```
完成后输入
```
yarn --version
```
来查看版本，若显示版本则安装成功。

# 为什么要用yarn

因！为！快！

npm实在是太慢了，慢到让人无法接受你晓得嘛！而且yarn在一定程度上是可以和npm混合使用的。

|    作用 | npm      |   yarn   |
| :--: | :--: | :--: |
|  安装	|  npm install(i)|  	yarn|  
|  卸载	|  npm uninstall(un)|  	yarn remove|  
|  全局安装	|  npm install xxx –-global(-g)	|  yarn global add xxx|  
|  安装包|  	npm install xxx –save(-S)|  	yarn add xxx|  
|  开发模式安装包	|  npm install xxx –save-dev(-D)	|  yarn add xxx –dev(-D)|  
|  更新|  	npm update –save|  	yarn upgrade|  
|  全局更新	|  npm update –global|  	yarn global upgrade|  
|  卸载	|  npm uninstall [–save/–save-dev]	|  yarn remove xx|  
|  清除缓存	|  npm cache clean	|  yarn cache clean|  
|  重装	|  rm -rf node_modules && npm install|  	yarn upgrade|  
