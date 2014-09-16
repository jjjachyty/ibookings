<!DOCTYPE html>
<!-- saved from url=(0049)http://getbootstrap.com/2.3.2/examples/fluid.html -->
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <title>51私教</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Janly">
    <!-- Le styles -->

   <link href="/static/plugs/bootstrap/css/bootstrap.css" rel="stylesheet">
   <link href="/static/css/common.css" rel="stylesheet">

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
</style>
<body>
   {{template "navbar" .}} 
  
  <div id="container"class="container">

  </div>
  {{template "foot"}} 
  <script src="/static/js/jquery-2.0.0.min_0.js"></script>
  <script src="/static/js/bootstrap.min.js"></script>
  <script src="/static/js/common.js"></script>
  <!--头像上传需用js-->
    <script src="/static/plugs/jcrop/js/jquery-1.3.2-min.js"></script>
  <script src="/static/plugs/ajaxfileuploader/ajaxfileupload.js"></script>
  <script src="/static/plugs/jcrop/js/jquery.Jcrop.js"></script>
  <script src="/static/js/avatar.js"></script>
  <script type="text/javascript">
    function load(url){
       $('#container').load('/user/id/9527')
    }


  </script>
</body>
</html>