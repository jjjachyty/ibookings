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
  <link href="/static/css/dashboard.css" rel="stylesheet">

  <!-- Just for debugging purposes. Don't actually copy this line! -->
  <!--[if lt IE 9]>
  <script src="../../assets/js/ie8-responsive-file-warning.js"></script>
  <![endif]-->

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script src="/static/js/jquery-1.8.3.min.js"></script>
  <script src="/static/js/common.js"></script>
  <style type="text/css">
    .Balance{ background-color: rgb(253, 140, 37);
      border-radius: 1000px;
      height: 200px;
      width: 200px;
      text-align: center;
      vertical-align: middle;
      padding-top: 70px;
      color: red;
    }
    .FBalance{ background-color: rgb(199, 209, 4);
      border-radius: 1000px;
      height: 200px;
      width: 200px;
      text-align: center;
      vertical-align: middle;
      padding-top: 70px;
      color: green;
    }

    .price{
      color: red;
    }
    .recharge{
      padding: 100px;
    }
    .bank{
      background-image: url('/static/img/tags/combo.png');
      display: block;
      height: 36px;
      line-height: 30px;
      background-repeat: no-repeat;
      padding: 0 10px;
      color: #07F;
      font-weight: 700;
      white-space: nowrap;
      overflow: hidden;
      position: relative;
      z-index: 1;
    }
    .CMB{
     background-position: 0px -324px; 
   }
   .ICBC{
    background-position: 0px -576px;
  }
  .CCB{
    background-position: 0px -144px; 
  }
  .ABC{
    background-position: 0px -0px; 
  }
   .PSBC{
    background-position: 0px -648px;
   }
   .COMM{
    background-position: 0px -396px; 
   }
   .BOC{
    background-position: 0px -108px; 
   }
   .CEB{
    background-position: 0px -216px;
   }
   .CITIC{
    background-position: 0px -288px; 
   }
   .SPDB{
    background-position: 0px -792px; 
   }
   .CMBC{
    background-position: 0px -360px; 
   }
   .CIB{
    background-position: 0px -252px;
   }
   .SPABANK{
    background-position: 0px -756px; 
   }
   .GDB{
    background-position: 0px -504px;
   }
   .FDB{
    background-position: 0px -468px;
   }
   hr{
    padding: 10px;
   }
</style>
</head>

<body>
  {{template "navbar" .}}
  <div class="slide page-heading">
   <div class="container">
    <h1>😄我会告诉你冲100送20嚒？</h1>
  </div>
</div>
<div class="container context">
  <div class="row">

    <div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
        <li class="active"><a onclick="account('info',this)" href="#">账户</a></li>
        <li><a href="#" onclick="account('recharge',this)">充值</a></li>
        <li><a href="#" onclick="account('withdraw',this)">提现</a></li>
      </ul>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
      <div class="placeholders info account " id="info">
        <div class="col-xs-6 col-sm-6 wel">
          <div class="Balance">
            <h1 class="">¥{{.Data.ABalance}}</h1>
          </div>
          <span class="text-muted">可用金额</span>
        </div>
        <div class="col-xs-6 col-sm-6 placeholder">
          <div class="FBalance">
            <h1 class="">¥{{.Data.FBalance}}</h1>
          </div>
          <span class="text-muted">冻结金额</span>
        </div>
      </div>
      <div class="col-sm-9 account recharge" id="recharge" style="display:none">
      <form action="/account/recharge/id/{{.Data.Id}}">
        <div class="col-xs-6 col-sm-6 placeholder">
          <input type="text" class="form-control" id="money" onkeyup="positivenumber(this)" style="height:45px;" placeholder="充值金额">
        </div>
        <div class="col-xs-6 col-sm-6 placeholder">
         <button type="submit" class="btn btn-warning btn-lg" >充值</button>
       </div>
       </form>
     </div> 
     <div class="col-sm-9 account" id="withdraw" style="display:none">
     <form id="cashForm">
     <!--1-->
       <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="中国工商银行" class="col-sm-2">
        <span class="bank ICBC col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="中国建设银行" class="col-sm-2">
        <span class="bank CCB col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="中国农业银行" class="col-sm-2">
        <span class="bank ABC col-sm-10"></span>
      </div>
      <!--2-->
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="中国邮政储蓄银行" class="col-sm-2"><!--邮政储蓄-->
        <span class="bank PSBC col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="交通银行" class="col-sm-2">
        <span class="bank COMM col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="招商银行" class="col-sm-2">
        <span class="bank CMB col-sm-10"></span>
      </div>
      <!--3-->
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="中国银行" class="col-sm-2"><!--中国银行-->
        <span class="bank BOC col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="光大银行" class="col-sm-2">
        <span class="bank CEB col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="中信银行" class="col-sm-2">
        <span class="bank CITIC col-sm-10"></span>
      </div>
            <!--4-->
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="浦发银行" class="col-sm-2"><!--浦东-->
        <span class="bank SPDB col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="民生银行" class="col-sm-2">
        <span class="bank CMBC col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="兴业银行" class="col-sm-2">
        <span class="bank CIB col-sm-10"></span>
      </div>
                  <!--5-->
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="平安银行" class="col-sm-2"><!--平安-->
        <span class="bank SPABANK col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="广发银行" class="col-sm-2">
        <span class="bank GDB col-sm-10"></span>
      </div>
      <div class="col-xs-6 col-sm-4">
        <input type="radio" name="bank" value="富滇银行" class="col-sm-2">
        <span class="bank FDB col-sm-10"></span>
      </div>
      <hr>
     <input type="text" class="form-control" name="card" placeholder="卡号">
     <hr>
     <input type="text" class="form-control" name="address" placeholder="开户行地址 例:北京市朝阳区东三环支行">
    <hr>
     <input type="text" class="form-control" name="cash" placeholder="您的可提现最大金额为{{.Data.ABalance}}">
         <hr>
     <div class="form-group">
    <div class="input-group">
      <input type="text" name="" id="" class="form-control" placeholder="验证码">
        <span class="input-group-btn">
        <button class="btn btn-default" type="button">发送验证码</button>
      </span>
    </div>
  </div>
  <hr>
   <button type="button" onclick="withdraw()" class="btn btn-lg btn-success col-sm-12">提现</button>
   <hr>
    </div>
    </form>
        </div>
      </div>
    </div>



    {{template "foot"}} 


<script src="/static/plugs/bootstrap/js/bootstrap.min.js"></script>


  <script>
    function account(id,taget){
      $(".active").attr("class","");
      taget.parentElement.className="active"
      $(".account").hide();
      $("#"+id+"").show();
    }
    function recharge(){
     var money =  $("＃money").val();
     var id = "{{.Data.Id}}";
     $.ajax({
          type : "GET",
          url : "/account/recharge/",
          data : "&money="+money+"&id="+id,
          dataType : "json",
          success : function(data){
            // if(data.status){
            //   $.scojs_message(data.msg, $.scojs_message.TYPE_OK);
            // }else{
            //   $.scojs_message(data.msg, $.scojs_message.TYPE_ERROR);
            // }
          }
        });
    }
    function aa(){
      alert(1)
    }
    function withdraw(){
      var data = $("#cashForm").serialize();
      $.ajax({
          type : "POST",
          url : "/account/cash/user/{{.Data.Id}}",
          data : data,
          dataType : "json",
          success : function(data){
            if(data.status){
              window.location.href="/account/apply/"
            }else{
              alert(000000000000)
            }
          }
        });
    }
  </script>
</body>
</html>