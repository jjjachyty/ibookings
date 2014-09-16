<!DOCTYPE html>
<!-- saved from url=(0049)http://getbootstrap.com/2.3.2/examples/fluid.html -->
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <title>宜人网－个人信息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Janly">
  <!-- Le styles -->

  <link href="/static/plugs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/static/css/common.css" rel="stylesheet">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="../assets/js/html5shiv.js"></script>
  <![endif]-->
    <link href="/static/plugs/sco/css/scojs.css" rel="stylesheet">
    <link href="/static/plugs/sco/css/sco.message.css" rel="stylesheet">
    <script src="/static/js/jquery-1.8.3.min.js"></script>
    <script src="/static/js/common.js"></script>
  <style type="text/css">

    .user-base{
      padding-top: 80px;
    }
    .cursor-pointer{
      cursor: pointer;
    }
    .edit{
      margin-left: 90%;
    }
    .modal-dialog {
      right: auto;
      width: 900px;
      padding-top: 30px;
      padding-bottom: 30px;
    }
      .panel-heading{
        height: 40px;
      }

 /*     .btn{
        margin-top: -10px;
        height: 40px;
      }*/
     .cursor-pointer{
      cursor: pointer;
    }
    .ordered{
      color: red;
    }
    .label{
      padding-top: 10px;
      text-align: center;
      font-size: 22px;
    }
    .ibx-uc-uimg-mask{
      position:absolute;
      z-index:2;
/*      top:13px;
      left:46%;**/
      margin-right:3px;
      width:79%;
      height:220px;
      cursor:pointer;
      background:url(/static/img/uc_user.png) -1000px -1000px no-repeat}
      .ibx-uc-ulink{
        display:none;
        width:100%;
        position:absolute;
        /*left:5%;*/
        bottom:0;
        /*line-height:24px;*/
        color:#FFF;
        font-size:12px;
        text-decoration:none;
        text-align: center;
        cursor:pointer;
        /*margin-top:-109px;*/
        z-index:5;
        background:rgba(0,0,0,.6);
        background:black\9;filter:alpha(opacity=70) \9}
.thumbnail:hover .ibx-uc-ulink{display:block}
  </style>

  <body>
    {{template "navbar" .}} 

    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="user-base">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">基本资料<a id="edita" href="/user/edit/id/{{.Data.Id}}"  class="edit cursor-pointer">编辑</a></h3>
              </div>
              <div class="panel-body">
               <div class="row">
                 <div class="col-sm-1 col-lg-2">
                   <div class="thumbnail cursor-pointer" height="220px" width="220px">
                   <!-- <div class="ibx-uc-uimg-mask"><a class="ibx-uc-ulink" target="_blank" href="">更换头像</a></div> -->
                    <img src="/static/img/avatar/{{.Data.Id}}.png" data-toggle="modal" data-target="#avatarModal" id="avatar">
                  </div>
                </div >
                <div class="col-lg-10">
                 <div class="row">
                  <div class="col-lg-6">
                   <div class="row">
                    <input type="hidden" id="showUserId" name="showUserId" value="{{.Data.Id}}">
                    <div class="col-sm-2 col-lg-6">姓名:{{.Data.RealName}}</div>
                    <div class="col-sm-2 col-lg-6">性别:{{.Data.Sex}}</div>
                    <br><hr>
                    <div class="col-sm-2 col-lg-6">年龄:{{.Data.Age}}</div>
                    <div class="col-sm-2 col-lg-6">身份证:{{.Data.IDCard}}</div>
                    <br><hr>
                    <div class="col-sm-2 col-lg-6">联系电话:{{.Data.UserName}}</div>
                    <div class="col-sm-2 col-lg-6">地区:{{.Data.Area}}</div>
                    <br><hr>
                    
                   <br><hr>
                    <br>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="col-lg－12">
                      <h3>认证:</h3>
                      {{range .Data.Honours}}
                      <img title="{{.Title}}" src="/static/img/honours/{{.Name}}.png">
                      {{end}}
                  </div>
                 <div class="col-lg－12">
                      <h3>等级:</h3>
                      <img title="20" src="/static/img/tags/crown.png">
                      <img title="20" src="/static/img/tags/crown.png">
                      <img title="5" src="/static/img/tags/masonry.png">
                      <img title="5" src="/static/img/tags/masonry.png">
                      <img title="1" src="/static/img/tags/star.png">
                      <img title="1" src="/static/img/tags/star.png">
                      <img title="1" src="/static/img/tags/star.png">
                  </div>
               </div>
             </div>
            </div>
           </div>
         </div>
       </div>
     </div><!--基本资料-->
     <div class="panel panel-success">
        <div class="panel-heading">
          <h3 class="panel-title">个人技能</h3>
        </div>
        <div class="panel-body">
          <div class="row">


                     {{with .Data.Skill}} {{range .}}

           <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <!-- <div class="panel-heading cursor-pointer" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> -->
              <div class="panel-heading cursor-pointer" data-toggle="collapse" data-parent="#accordion">
                <div class="col-lg-12">
                 <div class="col-lg-2"><span class="label label-primary">{{.Category.Category}} </span></div>
                 <div class="col-lg-2"><span class="label label-success">{{.Category.Item}}</span></div>
                 <div class="col-lg-2"><span class="label label-info">{{.Experience}}年</span></div>
                 <div class="col-lg-2"><span class="label label-danger" id="price">{{.Price}}</span></div>
                 <div class="col-lg-2 ordered"><span class="badge">{{.Sales}}</span></div>
                 <div class="col-lg-2">
                 <a data-trigger="modal" href="/order/get/skill/{{.Id}}" id="order" onclick="checkUser()" data-title="在线预约" class="label label-warning btn">预定</a>
                 </div>
               </div>
             </div>
             <div id="collapseOne" class="panel-collapse collapse ">
              <div class="panel-body">

             </div>
           </div>
         </div>
      </div>
            {{end}}{{end}}
    </div>
  </div>
</div>



        <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">个人简绍</h3>
    </div>
    <div class="panel-body">
     {{.Data.Introduction}}
   </div>
 </div>
 </div>
</div>
</div>
{{template "foot"}} 

<script src="/static/js/bootstrap.min.js"></script>

<script src="/static/plugs/sco/js/sco.modal.js"></script>
<script src="/static/plugs/sco/js/sco.message.js"></script>
<script src="/static/plugs/sco/js/span.js"></script>
<script type="text/javascript">

$("#order").attr("href","/order/get/ruser/{{.Data.Id}}/skill/{{.Data.Skill.Id}}")

var loguser = getCookie("userid");

if (loguser == {{.Data.Id}}) {
  $("#order").remove()
}else{
  $("#edita").remove()
}
  function checkUser(){
  var url = window.location.href
          $.ajax({
        type : "POST",
        url : "/login/check/",
        dataType : "json",
        success : function(data){
          if(!data.status){
            window.location.href="/login/get/redirect_url/"+url
          }
        }
      });

  }

</script>
</body>
</html>