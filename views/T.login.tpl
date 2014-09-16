<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

  <title>宜人/一直在你身边/登录...</title>

  <!-- Bootstrap core CSS -->
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/static/css/signin.css" rel="stylesheet">
  <!-- Just for debugging purposes. Don't actually copy this line! -->
  <!--[if lt IE 9]>
  <script src="../../assets/js/ie8-responsive-file-warning.js"></script>
  <![endif]-->

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style type="text/css">

   .signup{
    float:right;
    margin-top: 9px;
   }
   .login{
     background-image: url('/static/img/background/login.jpg');
   }
   .login-1{
     background-image: url('/static/img/background/login-1.png');
     margin-bottom: 50px;
     padding-bottom: 10px;

   }

  </style>
</head>

<body class="login">


<div class="container">
  <div class="row">
    <div class="col-lg-4"></div>
<div class="login-1 pull-right col-lg-4">
    <form id="loginForm" class="form-signin" role="form">
      <div>
        <span class="form-signin-heading">请登录...</span>
        <span id="error-text" style="color: #FF0000;" class="class="form-signin-heading></span>
      </div>
      <div>
        <input type="text" id="username" name="username" class="form-control" placeholder="手机号码"></div>
      <div>
        <input type="password" id="password" name="password" class="form-control" placeholder="密码" required></div>
      <div>
        <input type="text" id="vercode" name="vercode" class="form-control" placeholder="验证码" required>
      </div>
      <div>
      <img src="/img" class="vercode" id="vercodeImg">
      <label>
        <a href="#" onclick="reflush()">看不清楚，换一张</a>
      </label>
        <a class="signup" href="/signup">注册</a>
    </div>
      <!-- <label class="checkbox">
      <input type="checkbox" value="remember-me">Remember me</label>
    -->
    <button class="btn btn-lg btn-warning btn-block" type="button" id="logbtn"onclick="login()">登录</button>

  </form>
  
</div>
<div class="col-lg-2"></div>
</div>

</div>

 {{template "foot"}} 


    
<!-- /container -->

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/static/js/jquery-2.0.0.min_0.js"></script>
<script src="/static/js/bootstrap3-validation.js"></script>
<script src="/static/js/login.js"></script>
<script>
$(function () {  
            //定义回车事件  
            if (document.addEventListener) {//如果是Firefox  
                document.addEventListener("keypress", fireFoxHandler, true);  
            }  
            else {  
                document.attachEvent("onkeypress", ieHandler);  
            }  
  
            function fireFoxHandler(evt) {  
  
                if (evt.keyCode == 13) {  
  
                    login();  
                }  
            }  
            function ieHandler(evt) {  
  
                if (evt.keyCode == 13) {  
                    login();  
                }  
            }  
        });  
</script>
</body>
</html>