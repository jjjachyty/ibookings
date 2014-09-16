function publish()
{
	  var content = $('#editor').html();
	  var title = $('#title').val();
	  var pas = "title="+title+"&content="+content;
          $.ajax({
            type : "POST",
            url : "/article",
            data : pas,
            dataType : "json",
            success : function(data){
              if(data.status){
                 location.href ="/";
              }else{
                $("#error-text").html(data.msg);
              }
            }
          });
}