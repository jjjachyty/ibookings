    




//Create variables (in this scope) to hold the API and image size  
var jcrop_api, boundx, boundy, path;  
/** 
 * 更新缩略图，实现原理：根据原图框选的内容，显示到缩略图上，而缩略图也是原图是进行了放大，只是超过img范围的部分被隐藏 
 */  
 function updatePreview(c) {  
    if (parseInt(c.w) > 0) {  
        $('#x1').val(c.x);  
        $('#y1').val(c.y);  
        $('#x2').val(c.x2);  
        $('#y2').val(c.y2);  
        $('#w').val(c.w);  
        $('#h').val(c.h);  
        
        var rx = xsize / c.w;  
        var ry = ysize / c.h;  

        // 精确计算图片的位置  
        $pimg.css({  
            width : Math.round(rx * boundx) + 'px',  
            height : Math.round(ry * boundy) + 'px',  
            marginLeft : '-' + Math.round(rx * c.x) + 'px',  
            marginTop : '-' + Math.round(ry * c.y) + 'px'  
        });  
    }  
}  

/** 
 * 异步上传图片 
 * @returns {Boolean} 
 */  
 function ajaxFileUpload() {
    $("#loading").ajaxStart(function() {  
        $(this).show();  
    })//开始上传文件时显示一个图片    
    .ajaxComplete(function() {  
        $(this).hide();  
    });//文件上传完成将图片隐藏起来    

    var file = $("#realPicFile").val();  
    if(!/\.(gif|jpg|jpeg|png|JPG|PNG)$/.test(file))  
    {  
        Error("不支持的图片格式.图片类型必须是.jpeg,jpg,png,gif格式.");  
        return false;  
    }  

    $.ajaxFileUpload({
        url : '/avatar/',//用于文件上传的服务器端请求地址
        type : "post",
        secureuri : false,//一般设置为false
        fileElementId : 'realPicFile',//文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType : 'json',//返回值类型 一般设置为json
        success : function(data) //服务器成功响应处理函数
        {

            // 图片在服务器上的相对地址，加随机数防止不刷新  
            path = data.data + "?" + Math.random();  
            $("#realPic").attr("src", path);  
            $("#crop_preview").attr("src", path);  
            
            var imgs = $(".jcrop-holder").find("img");  
            // 原本有图片，重新上传后，所有的img都需要刷新  
            imgs.each(function (i, v) {  
                $(this).attr("src", path);  
            }); 

            $('#preview-pane .preview-container img').attr("src", path);  

            // 切图样式  
            // Grab some information about the preview pane  
            $preview = $('#preview-pane'), $pcnt = $('#preview-pane .preview-container'), $pimg = $('#preview-pane .preview-container img'),  
            xsize = $pcnt.width(), ysize = $pcnt.height();  
            //console.log('init', [ xsize, ysize ]);  

            //$('#realPic').Jcrop({  
            //     onChange : updatePreview, //切图框改变事件  
            //     onSelect : updatePreview, // 切图框选择事件  
            //     onRelease: clearCoords, // 切图框释放的事件  
            //     bgFade   : true,  
            //     bgOpacity: .8, // 截图框以外部分的透明度  
            //     setSelect: [10, 10, 100, 100], // 默认选择的区域  
            // aspectRatio : 1 //xsize / ysize 截图比例，这里我采用1 : 1 的比例，即切出来的为正方形  
            // }, function() {  
            //     // Use the API to get the real image size  
            //     var bounds = this.getBounds();  
            //     boundx = bounds[0];  
            //     boundy = bounds[1];  
            //     // Store the API in the jcrop_api variable  
            //     jcrop_api = this;  
            //     // Move the preview into the jcrop container for css positioning  
            //     $preview.appendTo(jcrop_api.ui.holder);  
            // });          
            $("#realPic").Jcrop({
                onChange:showCoords,
                onSelect:showCoords,
                setSelect: [10, 10, 280, 280],
                aspectRatio:1
            }); 

            function showCoords(obj){
                $("#x").val(obj.x);
                $("#y").val(obj.y);
                $("#x2").val(obj.x2);
                $("#y2").val(obj.y2);
                if(parseInt(obj.w) > 0){
                //计算预览区域图片缩放的比例，通过计算显示区域的宽度(与高度)与剪裁的宽度(与高度)之比得到
                var rx = $("#preview_box").width() / obj.w; 
                var ry = $("#preview_box").height() / obj.h;
                //通过比例值控制图片的样式与显示
                $("#crop_preview").css({
                    width:Math.round(rx * $("#realPic").width()) + "px",  //预览图片宽度为计算比例值与原图片宽度的乘积
                    height:Math.round(rx * $("#realPic").height()) + "px",    //预览图片高度为计算比例值与原图片高度的乘积
                    marginLeft:"-" + Math.round(rx * obj.x) + "px",
                    marginTop:"-" + Math.round(ry * obj.y) + "px"
                });
            }
        }

    },  
        error : function(data, status, e)//服务器响应失败处理函数    
        {  
            Error(e);  
        }  
    });  
    return false;  
}  

function _getShowWidth(str) {  
    return _getValue(str, "width");  
}  

function _getShowHeight(str) {  
    return _getValue(str, "height");  
}  

function _getValue (str, key) {  
    var str = str.replace(/\:|\;|\s/g, '').toLowerCase();  
    var pos = str.indexOf(key);  
    if (pos >= 0) {  
        // 截取  
        var tmp = str.substring(pos, str.length);  
        var px = tmp.indexOf("px");  
        if (px > 0){  
            var width = tmp.substring(key.length, px);  
            return width;  
        }  
        return 0;  
    }  
    return 0;  
}  

/** 
 * 裁剪图片 
 */  
 function cutPic() {  
    if($("#x").val() != ""){
        var x = $("#x").val();
        var y = $("#y").val();
        var x2 = $("#x2").val();
        var y2 = $("#y2").val();
        var fileName = "."+path.substring(0,path.indexOf('?'))


        $.ajax({  
            type : "post",  
            dataType : "json",  
            url : "/avatar/cut/",  
            data : {  
                fileName : fileName,  
                x : x,  
                y : y,  
                x2 : x2,  
                y2 : y2
            },  
            success : function(data) {  


                if(data.status){
                   $('.modal-backdrop fade in').trigger("click");
               }
               $.scojs_message(data.msg, $.scojs_message.TYPE_OK);
           },  
           error : function () {
            $.scojs_message("上传失败,请稍后重试.", $.scojs_message.TYPE_ERROR);
        }  
    });    
    }else{
        alert("请先在图片上划一个选区再单击确认剪裁的按钮！");   
    }
}  

function clearCoords()  
{  
  $('#coords input').val('');  
};  
