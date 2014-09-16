function reflush()
{
  document.getElementById("vercodeImg").src="/img?"+Math.random();
             //$("#captchaimg").attr('src','/img')
           }

   function login(){
     var username = $("#username").val()
     var password = $("#password").val()
     var vercode = $("#vercode").val()
     var msg = ""
       //对电子邮件的验证
       //var email = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
       if (username =="") {
        $("#username").parent().attr("class","has-error")
        msg="用户名不能为空"
      }else{
        // if (!email.test(username)) {
        //   $("#username").parent().attr("class","has-error")
        //   msg="用户名格式不正确"
        // }else{
          $("#username").parent().attr("class","has-success")
       // }
      }
      if (msg =="" ){
        if( password =="") {
          $("#password").parent().attr("class","has-error")
          msg="密码不能为空"
        }else{
          $("#password").parent().attr("class","has-success")

        }}
        
        if (msg ==""){
          if (vercode =="") {
            $("#vercode").parent().attr("class","has-error")
            msg="验证码不能为空"
          }else{
            $("#vercode").parent().attr("class","has-success")
          }
        }
        if (msg != "") {
          $("#error-text").html(msg)
          return false
        }else{
          var pars = $("#loginForm").serialize();
          var url = window.location.href
          var urlArry = url.split("redirect_url/")
          if (urlArry[1] != undefined) {
              url =  urlArry[1]
          }else{
            url = "/"
          }
          $.ajax({
            type : "POST",
            url : "/login",
            data : pars,
            dataType : "json",
            success : function(data){
              if(data.status){
                 window.location.href=url;
              }else{
                $("#error-text").html(data.msg);
              }
            }
          });
        }
      }





