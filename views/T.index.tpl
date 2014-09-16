<!DOCTYPE html>
<!-- saved from url=(0049)http://getbootstrap.com/2.3.2/examples/fluid.html -->
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <title>宜人一直在你身边</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Le styles -->
  <link href="/static/plugs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/static/plugs/unslider/css/style.css" rel="stylesheet">
  <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
      .banner { position: relative; overflow: auto; }
    .banner li { list-style: none; }
        .banner ul li { float: left; }
        .tops{
              background-color: #f5f5f5;
              border: 1px solid #e3e3e3;
              /*padding: 10px;*/
              /*padding-top: 20px;*/
        }

    </style>


  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="../assets/js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="http://getbootstrap.com/2.3.2/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://getbootstrap.com/2.3.2/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="http://getbootstrap.com/2.3.2/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="http://getbootstrap.com/2.3.2/assets/ico/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="http://getbootstrap.com/2.3.2/assets/ico/favicon.png"></head>

<body>
 {{template "navbar" .}} 


     <!--  <div class="col-lg-2">
        <div class="tops">
           <div class="row">
                <div class="col-lg-12"><h4>运动</h4></div>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567">
                <img src="/static/img/avatar/nadaer.png" alt="toilet paper" width="53" height="53px" class="img-circle"><span>纳达尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/feidele.png" alt="toilet paper" width="43" height="43px" class="img-circle"><span>费德勒</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/lina.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>李娜</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/salabowa.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>莎拉波娃</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/haobuer.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>浩布尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/luoyonghao.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>罗永浩</span><span style="font-size: 10px;">  英语</span></a>
               </div>
           </div>
        </div>
          <div class="tops">
           <div class="row">
                <div class="col-lg-12"><h4>学教</h4></div>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567">
                <img src="/static/img/avatar/nadaer.png" alt="toilet paper" width="53" height="53px" class="img-circle"><span>纳达尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/feidele.png" alt="toilet paper" width="43" height="43px" class="img-circle"><span>费德勒</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/lina.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>李娜</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/salabowa.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>莎拉波娃</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/haobuer.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>浩布尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/luoyonghao.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>罗永浩</span><span style="font-size: 10px;">  英语</span></a>
               </div>
           </div>
        </div>
                  <div class="tops">
           <div class="row">
                <div class="col-lg-12"><h4>学教</h4></div>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567">
                <img src="/static/img/avatar/nadaer.png" alt="toilet paper" width="53" height="53px" class="img-circle"><span>纳达尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/feidele.png" alt="toilet paper" width="43" height="43px" class="img-circle"><span>费德勒</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/lina.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>李娜</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/salabowa.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>莎拉波娃</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/haobuer.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>浩布尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/luoyonghao.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>罗永浩</span><span style="font-size: 10px;">  英语</span></a>
               </div>
           </div>
        </div>
                  <div class="tops">
           <div class="row">
                <div class="col-lg-12"><h4>学教</h4></div>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567">
                <img src="/static/img/avatar/nadaer.png" alt="toilet paper" width="53" height="53px" class="img-circle"><span>纳达尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/feidele.png" alt="toilet paper" width="43" height="43px" class="img-circle"><span>费德勒</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                <a href="/it/article/id/1234567"><img src="/static/img/avatar/lina.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>李娜</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/salabowa.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>莎拉波娃</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/haobuer.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>浩布尔</span><span style="font-size: 10px;">  网球</span></a>
               </div>
               <br>
               <div class="col-lg-12">
                 <a href="/it/article/id/1234567"><img src="/static/img/avatar/luoyonghao.png" alt="toilet paper" width="33" height="33px" class="img-circle"><span>罗永浩</span><span style="font-size: 10px;">  英语</span></a>
               </div>
           </div>
        </div>
        </div> -->

      <!--/span-->

          {{template "banner"}} 
  <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <h3>宜人不用？用人不疑</h3>
          <br>
            <p>
              Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            </p>
          </div>
          <!--/span-->
          <div class="col-lg-4">
            <h3>Heading</h3>
            <p>
              Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            </p>
          </div>
          <!--/span-->
          <div class="col-lg-4">
            <h3>Heading</h3>
            <p>
              Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            </p>
          </div>
          <!--/span--> </div>
        <!--/row-->
        <div class="row">
          <div class="col-lg-4">
            <h3>Heading</h3>
            <p>
              Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            </p>
          </div>
          <!--/span-->
          <div class="col-lg-4">
           <h3>Heading</h3>
            <p>
              Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            </p>
          </div>
          <!--/span-->
          <div class="col-lg-4">
            <h3>Heading</h3>
            <p>
              Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
            </p>
          </div>
          <!--/span--> </div>
        <!--/row--> </div>
      <!--/span--> 
    <!--/row-->

    <hr>

{{template "foot"}} 


  <!--/.fluid-container-->

  <!-- Le javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="/static/js/jquery-2.0.0.min_0.js"></script>
  <script src="/static/plugs/bootstrap/js/bootstrap.min.js"></script>
  <script src="/static/plugs/unslider/js/unslider.min.js"></script>
  <script type="text/javascript">
$(function() {
  $('.banner').unslider({
  speed: 500,               //  The speed to animate each slide (in milliseconds)
  delay: 3000,              //  The delay between slide animations (in milliseconds)
  complete: function() {},  //  A function that gets called after every slide animation
  keys: true,               //  Enable keyboard (left, right) arrow shortcuts
  dots: true,               //  Display dot navigation
  fluid: false              //  Support responsive design. May break non-responsive designs
});

    $('.banner').unslider();
});


  </script>
</body>
</html>