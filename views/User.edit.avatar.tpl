{{define "avatar"}}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="">

  <title>宜人网/我的个人预约平台/头像修改</title>

    <!-- Bootstrap core CSS 
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">-->

    <!-- Custom styles for this template -->
    <link href="/static/plugs/jcrop/css/jquery.Jcrop.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <style type="text/css">
        .jcrop-holder #preview-pane {  
          width:156px;  
          height:156px;   
          display: block;  
          position: absolute;  
          /*z-index: 2000;*/  
          top: 0px;  
          right: -200px;  
          padding: 6px;  
          border: 1px rgba(0,0,0,.4) solid;  
          background-color: white;  

          -webkit-border-radius: 6px;  
          -moz-border-radius: 6px;  
          border-radius: 6px;  

          -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);  
          -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);  
          box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);  
        }  

/* The Javascript code will set the aspect ratio of the crop 
   area based on the size of the thumbnail preview, 
   specified here */  
/*#preview-pane .preview-container {  
  width: 156px;  
  height: 156px;  
  overflow: hidden;  
}  */
#target-pane {  
  width: 400px;  
  height: 400px;  
}  


.fileinput-button {  
  position: relative;  
  overflow: hidden;  
}  
.fileinput-button input {  
  position: absolute;  
  top: 0;  
  right: 0;  
  margin: 0;  
  opacity: 0;  
  filter: alpha(opacity=0);  
  transform: translate(-300px, 0) scale(4);  
  font-size: 23px;  
  direction: ltr;  
  cursor: pointer;  
}  
.crop_preview{
  position:absolute; 
  top:32px;
  width:220px; 
  height:220px; 
  overflow:hidden;
}
.realPic{
  margin-top: 1%;
}
</style>
</head>

<body>
  <div class="edit-context">
    <div class="panel panel-success">
      <div class="panel-heading">
        <h3 class="panel-title">头像修改</h3>
      </div>
      <div class="panel-body">
        <div class="row">
          <div class="realPic col-sm-3 col-lg-4">
            <!-- 显示图片的img -->  
            <img src="/static/img/avatar_tmp/{{.Data.Id}}.png" id="realPic" width="300px" height="300px" />
            <div class="col-sm-10 col-lg-10">
              <!-- 打开图片控制 -->  
              <span class="btn btn-success fileinput-button">   
                <i class="icon-plus icon-white"></i>   
                <span>选择图片</span>   
                <input type="file" onchange="ajaxFileUpload()" name="realPicFile" id="realPicFile" multiple />  
              </span>  
              <a class="btn btn-success" href="javascript:cutPic();">保存头像</a>  
            </div>
          </div>
          <div class="col-sm-12 col-lg-4">
            <!-- 缩略图预览 -->  
            <div id="preview-pane">  
              <div class="preview-container">  
                <span id="preview_box" class="crop_preview"><img id="crop_preview" src="/static/img/avatar/{{.Data.Id}}.png" 
                  width="220px" height="220px"/></span>
                  预览220X220
                </div>  
              </div>  
            </div>



               <!--       
               这种做法IE不支持，拒绝访问.                                                          
               <input id="realPicFile" value="选择图片" onchange="ajaxFileUpload()" type="file" style="display: none;" name="realPicFile" />  
               <a class="btn btn-success" href="javascript:selectPic();" > <i class="icon-plus icon-white"></i>  
                    选择图片   
               </a>  
             -->  
             <!-- 上传并裁剪图片 -->  
             <!--  <img src="${ctx}/images/ajax-loader.gif" id="loading" style="display: none;"> -->


             <!-- 获取裁剪的起始坐标和宽度、高度给后台 -->  
             <form id="coords" class="coords">  
              <div class="inline-labels">  
                <input type="hidden" id="x" name="x" />
                <input type="hidden" id="y" name="y" />
                <input type="hidden" id="x2" name="x2" />
                <input type="hidden" id="y2" name="y2" />
                <input type="hidden" id="w" name="y2" />
                <input type="hidden" id="h" name="y2" />
              </div>  
            </form>  
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster 
    <script src="/static/plugs/jcrop/js/jquery-1.3.2-min.js"></script>
    <script src="/static/plugs/ajaxfileuploader/ajaxfileupload.js"></script>
    <script src="/static/plugs/jcrop/js/jquery.Jcrop.js"></script>
    <script src="/static/js/avatar.js"></script>-->
    
  </body>
  </html>
  {{end}}