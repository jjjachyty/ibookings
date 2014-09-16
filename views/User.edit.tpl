<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

  <title>宜人/您的人生成长导师/资料编辑...</title>

  <!-- Bootstrap core CSS -->
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/plugs/sco/css/scojs.css" rel="stylesheet">
    <link href="/static/plugs/sco/css/sco.message.css" rel="stylesheet">

  <!-- Just for debugging purposes. Don't actually copy this line! -->
  <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <script src="/static/js/jquery-1.8.3.min.js"></script>
      <script src="/static/plugs/switch/js/bootstrap-switch.min.js"></script>
      <script src="/static/js/common.js"></script>
      <script src="/static/plugs/sco/js/sco.message.js"></script>
      <script src="/static/js/common.js"></script>
      <style type="text/css">
        .tablist{
          margin-top: 70px;
          text-align: center;
        }
        .nav-tabs li{
          width: 25%;
          margin-left: -8px;
        }
        .nav-tabs img{
          margin: -6px;
        }
        .nav-tabs li a{
          /*background-color: #56abe4;*/
        }
        .nav-tabs li.active a{
         background-color: rgb(223,240,217);
       }
       .nav-tabs li.active a:hover{
         background-color: rgb(223,240,217);
       }
      
       .edit-context{
        margin-left: -0.7%;
        margin-right: -0.7%;
      }
      .panel-heading{
        margin-top: -2px;
      }
      .cursor-pointer{
        cursor: pointer;
      }
      body{
        background-color: #85AE52;
      }
    </style>
  </head>

  <body>
   {{template "navbar" .}}
   <div class="container">
     <div class="row">
       <div class="tablist">
        <ul class="nav nav-tabs" role="tablist" id="myTab">
          <li><a href="#avator" role="tab" data-toggle="tab"><img src="/static/img/tags/avator.png"></a></li>
          <li><a href="#baseinfo" role="tab" data-toggle="tab"><img src="/static/img/tags/userinfo.png"></a></li>
          <li><a href="#skill" role="tab" data-toggle="tab"><img src="/static/img/tags/item.png"></a></li>
          <li><a href="#introduction" role="tab" data-toggle="tab"><img src="/static/img/tags/introduction.png"></a></li>
        </ul>

        <div class="tab-content">
          <div class="tab-pane" id="avator">{{template "avatar" .}}</div>
          <div class="tab-pane" id="baseinfo">{{template "baseinfo" .}}</div>
          <div class="tab-pane" id="skill">{{template "skills" .}}</div>
          <div class="tab-pane" id="introduction">{{template "introduction" .}}</div>
        </div>
      </div>
    </div>
  </div>
  {{template "foot"}} 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--  // <script src="/static/js/jquery-2.0.0.min_0.js"></script> -->

    <script src="/static/plugs/bootstrap/js/bootstrap.min.js"></script>
    <!--     //     <script src="/static/plugs/jcrop/js/jquery-1.3.2-min.js"></script>-->
    <script src="/static/plugs/ajaxfileuploader/ajaxfileupload.js"></script>
    <script src="/static/plugs/jcrop/js/jquery.Jcrop.js"></script>
    <script src="/static/js/avatar.js"></script> 

  </body>
  </html>
