"use strict";var clock=new Vue({el:"#clock",data:{time:"",date:"",daylight:""}}),week=["SUN","MON","TUE","WED","THU","FRI","SAT"],timerID=setInterval(updateTime,1e3);function updateTime(){var e=new Date;clock.time=zeroPadding(e.getHours(),2)+":"+zeroPadding(e.getMinutes(),2)+":"+zeroPadding(e.getSeconds(),2),clock.date=zeroPadding(e.getFullYear(),4)+"-"+zeroPadding(e.getMonth()+1,2)+"-"+zeroPadding(e.getDate(),2)+" "+week[e.getDay()];var t=12<e.getHours()?" PM":" AM";clock.daylight=t}function zeroPadding(e,t){for(var a="",d=0;d<t;d++)a+="0";return(a+e).slice(-t)}updateTime();