"use strict";!function(h){jQuery.fn.flipCountDown=jQuery.fn.flipcountdown=function(s){function e(a){function n(t){if(t instanceof Array&&t.length){for(var s,e,a,n,o,i,d,r,c=0,u=t.length;c<u;c++)if(l[c]||(l[c]=h('<div class="xdsoft_digit"></div>'),p.before(l[c])),l[c].data("value")!=t[c]){if(d=l[c].data("value"),r=t[c],!d||!r||d!=r&&!/^[0-9]+$/.test(d+""+r)&&!/^[:.\s]+$/.test(d+""+r))switch(l[c].removeClass("xdsoft_separator").removeClass("xdsoft_dot"),t[c]){case":":l[c].addClass("xdsoft_separator");break;case".":l[c].addClass("xdsoft_dot");break;case" ":l[c].addClass("xdsoft_space")}isNaN(t[c])||(s=parseInt(l[c].data("value")),e=parseInt(l[c].data("i")),a=parseInt(t[c]),!isNaN(s)&&c==e||(s=a-1<0?9:a-1),n=l[c],f(n,o=s,(i=a)<o&&(9!=o||0!=i)?-1:1,9!=o||0!=i?Math.abs(o-i):1)),l[c].data("value",t[c]),l[c].data("i",c)}if(l.length>t.length){for(;c<l.length;c++)l[c][0].parentNode.removeChild(l[c][0]),delete l[c];l.splice(t.length)}}}function t(){var t="1",s=[];if(d.tick&&(t=d.tick instanceof Function?d.tick.call(a,0):d.tick),void 0!==t){switch(t.constructor){case Date:var e=(t.getHours()+d.tzoneOffset)%(d.am?12:24);d.showHour&&(s.push(parseInt(e/10)),s.push(e%10)),d.showHour&&(d.showMinute||d.showSecond)&&s.push(":"),d.showMinute&&(s.push(parseInt(t.getMinutes()/10)),s.push(t.getMinutes()%10)),d.showMinute&&d.showSecond&&s.push(":"),d.showSecond&&(s.push(parseInt(t.getSeconds()/10)),s.push(t.getSeconds()%10));break;case String:s=t.replace(/[^0-9\:\.\s]/g,"").split("");break;case Number:s=t.toString().split("")}n(s)}}var s=h('<div class="xdsoft_flipcountdown"></div>'),p=h('<div class="xdsoft_clearex"></div>'),d=h.extend({},i),e=0,f=function t(s,e,a,n){n<1||o(s,-(6*e*r[d.size]+1),1,a,function(){t(s,e+a,a,n-1)},n)},o=function t(s,e,a,n,o,i){e<=60*-r[d.size]&&(e=-1),s.css("background-position","0px "+e+"px"),a<=6?setTimeout(function(){t(s,e-n*r[d.size],++a,n,o,i)},parseInt(d.speedFlip/i)):o()},l=[];s.append(p).on("xdinit.xdsoft",function(){clearInterval(e),d.autoUpdate&&(e=setInterval(t,d.period)),t()}),a.data("setOptions",function(t){d=h.extend({},d,t),r[d.size]||(d.size="lg"),s.addClass("xdsoft_size_"+d.size).trigger("xdinit.xdsoft")}),a.append(s)}var i={showHour:!0,showMinute:!0,showSecond:!0,am:!1,tzoneOffset:0,speedFlip:60,period:1e3,tick:function(){return new Date},autoUpdate:!0,size:"md"},r={lg:77,md:52,sm:35,xs:24};return this.each(function(){var t=h(this);t.data("setOptions")||(t.addClass("xdsoft"),e(t)),t.data("setOptions")&&h.isFunction(t.data("setOptions"))&&t.data("setOptions")(s)})}}(jQuery);