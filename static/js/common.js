String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}

var orderBy = "bid"
function loadHtml(id,url){
	$("#"+id+"").load(url);
}


window.onload=serch(1);

function serch(page){

	var words = encodeURI($("#serchText").val())
	var item = $("input[name='item']:checked").val();
	var sex =  $("input[name='sex']:checked").val();
	var experience = $("input[name='experience']:checked").val();
	var category = $('#category').val();
	if(page == undefined){
		page = 1;
	}
	var query = "/category/"+category+"/page/"+page;

	if (words != "") {
		query +="/title/"+words
	}
	if(item != undefined && item != ""){
		query +="/item/"+item
	}
	if(experience != undefined && experience != ""){
		query +="/experience/"+experience
	}
	if(sex != undefined && sex != ""){
		query +="/sex/"+sex
	}

	if (orderBy != "") {
		query += "/desc/"+orderBy
	};

	loadHtml("sportslist","/serch/title/"+query);
}

function order(taget,tx,field){
	$('.active').attr('class','');
	taget.text =  tx;
	taget.parentElement.className="active"

	orderBy = field
	serch()
}

function toUserDetial(id){
	window.location.href="/user/id/"+id
}

function showBidding(){
	serch()
}


function addOption(controllersName,type,value){
	$("#"+type+" option").remove(); 
	$.ajax({
		type : "POST",
		url : "/select/"+controllersName+"/type/"+type+"/value/"+value,
		dataType : "json",
		success : function(data){
			if(data.status){
				$.each(data.data, function(key, val) {
					$("#"+type+"").append("<option value='"+val.Name+"'>"+val.Name+"</option>"); 
				});
			}else{
				$.scojs_message(data.msg, $.scojs_message.TYPE_ERROR);
			}
		}
	});
}

/**
 * 日期格式化
 * var d =new Date().format('yyyy-MM-dd');
 * @param  {[type]} format [description]
 * @return {[type]}        [description]
 */
Date.prototype.format =function(format)
{
var o = {
"M+" : this.getMonth()+1, //month
"d+" : this.getDate(), //day
"h+" : this.getHours(), //hour
"m+" : this.getMinutes(), //minute
"s+" : this.getSeconds(), //second
"q+" : Math.floor((this.getMonth()+3)/3), //quarter
"S" : this.getMilliseconds() //millisecond
}
if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
(this.getFullYear()+"").substr(4- RegExp.$1.length));
for(var k in o)if(new RegExp("("+ k +")").test(format))
format = format.replace(RegExp.$1,
RegExp.$1.length==1? o[k] :
("00"+ o[k]).substr((""+ o[k]).length));
return format;
}

//读取cookies 
function getCookie(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
}


function positivenumber(taget){
	if (/[^[0-9].*$]/g.test(taget.value))
	{
		$.scojs_message("金额格式错误", $.scojs_message.TYPE_ERROR);
		taget.value="";
	}
}
