"use strict";function ReDirect(){var t=window.location.pathname.split("/")[2].split(".");"html"==t[1]?(window.alert("正在为您跳转到最新页面..."),window.location.href="/posts/"+t[0]+"/"):(window.alert("非常抱歉，文章可能已经被删除了，正在返回首页..."),window.location.href="/")}