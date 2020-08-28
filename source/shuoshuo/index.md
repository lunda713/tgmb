---
title: 动态
date: 2020-08-28 16:20:31
type:
comments: false
top_img: https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/banner/pagebanner5.jpg
---
<head>
  <script src="https://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
  <!-- <script type="text/javascript">
  $(document).ready(function () {
      if(location.href.indexOf("#reloaded")==-1){
          location.href=location.href+"#reloaded";
          location.reload();
      }
  })
  </script> -->
</head>
  <body>
      {% raw %}
      <script>
        var img = "https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/%E5%8F%8B%E9%93%BE%E5%A4%B4%E5%83%8F/author.png";
        var appID = "HgKoEBNqlisn3UceL0eYnctL-MdYXbMMI";
        var appKEY = "NTRASNBeLT2prREh6XVbDMyt";
        var per = "12"; //每页显示说说的数量
        var username = "Akilar"; //Leancloud中设置的用户名
        var placeholder1="只有店长才能评论哦"; //在编辑说说的输入框中的占位符
        var placeholder2="只有店长才能评论哦！";  //在编辑密码的输入框中的占位符
        var lazy = 1; //是否开启懒加载动画
        var bgimg = "https://akilar-1259097125.cos.ap-shanghai.myqcloud.com/burrerfly-cover/valinebg2.gif";
      </script>
      {% endraw %}
      <div id="artitalk_main"></div>
      <script type="text/javascript" src="https://unpkg.com/artitalk"></script>
  </body>
  <!-- 自定义样式 -->
   <style>
     .cbp_tmtimeline>li:nth-child(odd) .cbp_tmlabel {
       background: linear-gradient(-45deg, #f1ac9d, #f06966, #dee2d1, #6abe83) 0% 0% / 400% 400%;
       animation: 15s ease 0s infinite normal none running gradientBG;
       color: white;
     }
     .cbp_tmtimeline>li .cbp_tmlabel {
       background: linear-gradient(-45deg, #f1ac9d, #f06966, #dee2d1, #6abe83) 0% 0% / 400% 400%;
       animation: 15s ease 0s infinite normal none running gradientBG;
       color: white;
     }
     .cbp_tmtimeline>li:nth-child(odd) .cbp_tmlabel:after {
       border-right-color:  #f1ac9d
     }
     .cbp_tmtimeline>li .cbp_tmlabel:after {
       border-right-color:  #dee2d1
     }
     .button {
       background: linear-gradient(-45deg, #f1ac9d, #f06966, #dee2d1, #6abe83) 0% 0% / 400% 400%;
       animation: 15s ease 0s infinite normal none running gradientBG;
       color: white;
     }
     @keyframes gradientBG {
         0% {
             background-position: 0% 50%;
         }
         50% {
             background-position: 100% 50%;
         }
         100% {
             background-position: 0% 50%;
         }
     }
   </style>
   <!-- 自定义样式.end -->
