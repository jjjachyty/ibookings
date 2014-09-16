<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>宜人/您的私人学习专家/登录...</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
      .p-center{
        text-align: center;
      }
      body{
        background-image: url("static/img/background/login.jpg");
      }
      .login{
        border: 10px solid rgba(250, 250, 250, 0.4);
background-color: rgba(250, 250, 250, 0.24);
border-radius: 10px;
margin-bottom: 10px;
      }
      .form-signin-heading{
        color: white;
      }
    </style>
  </head>

  <body>

    <div class="container">
       <div class="row">
         <div class="col-sm-8"></div>
       <div class="login col-sm-4">
       <div class="row">
       <div class="col-lg-12">
       <div>
        <span class="form-signin-heading">注册...</span>
        <span id="error-text" style="color: #FF0000;" class="class="form-signin-heading></span>
      </div>
      <form id="signup" class="form-horizontal"  action="#" role="form">
    <div class="form-group">
    <div class="input-group col-lg-12 ">
      <input type="text" name="username" id="username" class="form-control" placeholder="用户名/手机号码">
        <span class="input-group-btn">
        <!-- <button class="btn btn-default" type="button">发送验证码</button> -->
        <button class="btn btn-default" type="button">发送验证码</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="form-group">
    <div class="col-sm-12 has-success ">
      <input class="form-control" type="text" id="vercode" name="vercode" placeholder="输入验证码">
    </div>
  </div>
      <div class="form-group">
        <div class="col-sm-12">
          <input type="password" class="form-control" id="password1" name="password1" check-type="required" minlength="6" placeholder="密码">
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-12">
          <input type="password" class="form-control" id="password2" name="password2" check-type="required" minlength="6" placeholder="确认密码">
        </div>
      </div> 

      <div class="form-group">
              <div class="col-sm-12">
          <button type="button" class="btn btn-primary col-sm-12" onclick="signup()">注册</button>
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <span id="error-text" style="color: #FF0000;"></span>
        </div>
      </div>

    </form>
</div>
</div>
    </div> <!-- /container -->
</div>
</div>
 {{template "foot"}} 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/static/js/jquery-2.0.0.min_0.js"></script>
    <script src="/static/js/login.js"></script>
    <script type="text/javascript">
     function signup(){
        var username = $("#username").val()
        var password1 = $("#password1").val()
        var password2 = $("#password2").val()
        var data = $("#signup").serialize();
        var msg = ""
        var rege = /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
        /*用户名校验*/
        
        // if( username =="") {
        //   $("#username").parent().attr("class","input-group col-lg-12 has-error")
        //   msg="用户名不能为空"
        // }else{
        //   if (rege.test(username)) {
        //     $("#username").parent().attr("class","input-group col-lg-12 has-success")
        //   }else{
        //     $("#username").parent().attr("class","input-group col-lg-12 has-error")
        //   msg="手机号码格式错误"
        //   }
          
        // }
        // /*密码校验*/
        // if (msg =="" ){
        // if( password1 =="") {
        //   $("#password1").parent().attr("class","col-lg-12 has-error")
        //   msg="用户名不能为空"
        // }else{
        //   $("#password1").parent().attr("class","col-lg-12 has-success")
        // }}
      
        // /*密码确认校验*/
        // if (msg =="" ){
        // if( password2 =="") {
        //   $("#password2").parent().attr("class","col-lg-12 has-error")
        //   msg="用户名不能为空"
        // }else{
        //   if (password2 != password1) {
        //     $("#password2").parent().attr("class","col-lg-12 has-error")
        //     msg="两次密码不一致"
        //   }else{
        //   $("#password2").parent().attr("class","col-lg-12 has-success")
        //   }
        // }}

      if (msg != "") {
          $("#error-text").html(msg)
          return false
        }else{
         $.ajax({
            type : "POST",
            url : "/signup",
            data : data,
            dataType : "json",
            success : function(data){
              if(data.status){
                 location.href ="/user/edit/id/"+data.data.Id;
              }else{
                $("#error-text").html(data.msg);
              }
            }
          });
     }
   }
    function phone(){}

    </script>
  </body>
</html>
