<!DOCTYPE html>
<!-- saved from url=(0049)http://getbootstrap.com/2.3.2/examples/fluid.html -->
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <title>宜人不用，用人不疑</title>
  <meta name="description" content="">
  <meta name="audivor" content="">
  <!-- Le styles -->

  <link href="/static/plugs/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="/static/plugs/icheck/square/green.css" rel="stylesheet">
  <link href="/static/css/common.css" rel="stylesheet">

  
  <link href="/static/plugs/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
  <style type="text/css">
    body {
      padding-top: 60px;
      padding-bottom: 40px;
    }
    .sidebar-nav {
      padding: 9px 0;
    }

    @media (max-widdiv: 980px) {
      /* Enable use of floated navbar text */
      .navbar-text.pull-right {
        float: none;
        padding-left: 5px;
        padding-right: 5px;
      }
    }
  </style>
  <style>

    .sortbar {
      border: 1px solid #e8e8e8;
      _font-size: 0;
      height: 39px;
      background: #f7f7f7;
      margin-top:3%;
    }

    .price {
      color: #ff2900;
      font: 700 13px Verdana, Arial;
    }



    .people{
      border: solid 2px red;
      padding-left: -13px;
      padding-right: -13px;
    }



    .attrKey-mut{
      padding: 15px;
      text-align: center;
      border-right: dotted 1px #D5D5D5;
      color: #B0A59F;
    }
    .attrKey-sig{
      text-align: center;
      border-right: dotted 1px #D5D5D5;
      color: #B0A59F;
    }


    .line{
      width:100%;
      height:1px;
      margin:0px auto;
      padding:0px;
      background-color:#D5D5D5;
      overflow:hidden;
    }
    .attr{
      border: solid 1px #D5D5D5;
    }
    .serch{
      margin: 20px;
    }
    .serch input{
      border-color:#ff4200;
    }
    .serch button{
      background-color:#ff4200;
    }
    .tuijian{
      background-color: #d9534f;
    }
    .nav-pills li{
      cursor: pointer;
    }
    .caption-l{
  padding-left: 8px;
  padding-right: 8px;
  margin-top: -10px;
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

    <div class="container">
      <div class="row">
        <div class="col-sm-9 col-lg-10">
          <div class="row serch">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
              <form action="javascript:serch()">
                <div class="input-group">
                  <input type="text" id="serchText" class="form-control" placeholder="试着搜索游泳教练或者网球教练">
                  <div class="input-group-btn">
                    <button type="submit" class="btn ">搜标题</button>
                    <input type="hidden" id="category" value="运动" >
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                      <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#">搜名字</a></li>
                    </ul>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="row attr">
            <div class="col-xs-2 col-sm-2 attrKey-mut">类别</div>
            <div class="col-xs-10 col-lg-10">
              <div class="row">
                <div class="col-sm-3 col-lg-2">
                 <input type="radio" name="item"  value="">不限
               </div>
               <div class="col-sm-3 col-lg-10">
                <div class="row">
               <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="网球">网球
              </div>
              <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="羽毛球">羽毛球
              </div>
              <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="乒乓球">乒乓球
              </div>
              <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="蓝球">蓝球
              </div>
              <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="游泳">游泳
              </div>
              <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="击剑">击剑
              </div>
              <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="拳击">拳击
              </div>
              <div class="col-sm-3 col-lg-2">
                <input type="radio" name="item" value="马术">马术
              </div>             
              </div>    
            </div>
            </div>
          </div><!--类别-->
          <div class="line"></div>
          <div class="col-xs-12 col-sm-2 attrKey-sig">教龄</div>
          <div class="col-xs-2 col-sm-10">
            <div class="row">
              <div class="col-sm-3 col-lg-2">
               <input type="radio" name="experience" value="">不限
             </div>
             <div class="col-sm-3 col-lg-2">
              <input type="radio" name="experience" value="0-1">1年以下
            </div>
            <div class="col-sm-3 col-lg-2">
              <input type="radio" name="experience" value="1-3">1-3年
            </div>
            <div class="col-sm-3 col-lg-2">
              <input type="radio" name="experience" value="3-5">3-5年
            </div>
            <div class="col-sm-3 col-lg-2">
              <input type="radio" name="experience" value="5-10">5年以上
            </div>
          </div>
        </div><!--教龄-->
        <div class="line"></div>
        <div class="col-xs-12 col-sm-2 attrKey-sig">性别</div>
        <div class="col-xs-2 col-sm-10 ">
          <div class="row">
            <div class="col-sm-2 col-lg-2">
             <input type="radio" name="sex" value="">不限
           </div>
           <div class="col-sm-2 col-lg-2">
            <input type="radio" name="sex" value="男">男
          </div>
          <div class="col-sm-2 col-lg-2">
            <input type="radio" name="sex" value="女">女
          </div>
        </div>
      </div><!--性别-->
    </div><!--菜单-->

    <!--daohanglang-->
    <div class="row sortbar">
      <div class="col">
        <ul class="nav nav-pills sorting-btns">
          <li class="active">
            <a trace="sortDefault" onclick="javascript:order(this,'综合排序','-bid')" title="综合排序">综合排序<span class="sorting-bg"></span></a>
          </li>
          <li><a trace="sortRenqiDesc" onclick="javascript:order(this,'人气从高到低','-renqi')" title="人气从高到低" >人气<span class="sorting-bg"></span></a></li>

          <li id="saleli"><a id="salea"  onclick="javascript:order(this,'销量从高到低','-sales')" title="销量从高到低" >销量</a>
          </li>

          <div class="col-lg-1 navbar-text pull-right">
            <span>重庆</span>
          </div>
        </ul>
      </div><!-- /.col -->
    </div>
    <!--人物列表-->
    <div id="sportslist" class="row">

    </div>
    <!--分页-->


  </div><!--col-lg-10内容-->
  <div class="col-sm-3 col-lg-2" style="backeground-color:green">
    <div class="col-sm-12 col-md-12 tuijian">
      推荐
    </div>
    <div class="col-sm-12 col-md-12 thumbnail">
      <a href="#" class="thumbnail">
        <img src="/static/img/avatar/9527.png">
      </a>
        <div class="caption-l">
    <div class="row">
      <div class="col-sm-6 col-lg-4 price"><i>￥</i>178</div>
      <div class="col-sm-6 col-lg-8 dealing">294人预约</div>
      <div class="col-sm-12"><a href="/user/q/id/9527" >重庆市云阳县网球高级代练</a></div>
      <div class="col-sm-12 area">重庆</div>
      <div class="col-sm-9"></div>
    </div>
  </div>


    </div>
  </div><!--推荐-->
</div><!--row -->
</div>



{{template "foot"}} 
<script src="/static/js/jquery-2.0.0.min_0.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/plugs/datetimepicker/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/static/plugs/datetimepicker/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="/static/plugs/paginator/bootstrap-paginator.js" charset="UTF-8"></script>
<script src="/static/plugs/icheck/icheck.js"></script>
<script>
$(document).ready(function(){



  $('input').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green'
  });

  $('input').on('ifChecked', function(event){
    serch();
  });
});


</script>
</body>
</html>