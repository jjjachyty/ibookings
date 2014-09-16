{{define "baseinfo"}}
<style type="text/css">
	.bootstrap-switch{
		width: 100%;
	}
	.form-group{
		padding: 2%;
	}

</style>
<link href="/static/plugs/sco/css/scojs.css" rel="stylesheet">
<link href="/static/plugs/sco/css/sco.message.css" rel="stylesheet">
<link href="/static/plugs/switch/css/bootstrap-switch.min.css" rel="stylesheet">
<div class="edit-context">

	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">基本资料</h3>
		</div>
		<div class="panel-body">
			<div class="row">
				<form id="baseInfo" class="form-horizontal"  action="#" role="form">

					<div class="col-lg-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">真实姓名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" value="{{.Data.RealName}}" id="realName" name="realName" placeholder="为了方便实名认证,请输入您的身份证名称">
							
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">身份证号码</label>
							<div class="col-sm-9">
								<input type="text" maxlength="18" class="form-control" value="{{.Data.IDCard}}" id="idCard" name="idCard" placeholder="为了方便实名认证,请输入您的正确身份证号码" onblur="setAgeAndSex(this.value)">
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">年龄</label>
							<div class="col-sm-9">
								<label id="age">{{.Data.Age}}</label>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">性别</label>
							<div class="col-sm-9">
								<input type="checkbox" id="sex" name="sex" checked>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">联系电话</label>
							<div class="col-sm-9">
								<label>{{.Data.TelPhone}}</label>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label class="col-sm-3 control-label">地区</label>
							<div class="col-sm-3">
								<select class="form-control" id="province" name="province" onchange="addOption('area','city',this.value)">
								</select>
							</div>
							<div class="col-sm-3">
								<select class="form-control" id="city" name="city" onchange="addOption('area','country',this.value)">
								</select>
							</div>
							<div class="col-sm-3">
								<select class="form-control" id="country" name="country">
								</select>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-12">
				<button type="button" class="btn btn-success btn-lg btn-block" onclick="baseInfo()">保存</button>
			</div>
		</div>
	</div><!--个人技能-->

	<script type="text/javascript">
		$(function(){ 
			addOption("area","province");
		}); 
		

		$.fn.bootstrapSwitch.defaults.size = 'normal';
		$.fn.bootstrapSwitch.defaults.offColor = 'success';
		$.fn.bootstrapSwitch.defaults.onText = '男';
		$.fn.bootstrapSwitch.defaults.offText = '女';
		$("[name='sex']").bootstrapSwitch();

		function baseInfo(){
			var data = $("#baseInfo").serialize();
			var  age = $('#age').html()
			var msg = ""
			var realName = $("#realName").val();
			var idCard = $("#idCard").val();
			var idCardReg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			if( realName =="") {
				$("#realName").parent().attr("class","col-sm-9 has-error")
				msg = "真实姓名不能为空"
			}else{
				$("#realName").parent().attr("class","col-sm-9 has-success")
			}
			if (msg == "") {
				if (idCard == ""){
					msg = "身份证号不能为空"
					$("#idCard").parent().attr("class","col-sm-9 has-error")
				}else{
					if (!idCardReg.test(idCard)) {
						msg = "请输入正确的身份证"
						$("#idCard").parent().attr("class","col-sm-9 has-error")
					}else{
						$("#idCard").parent().attr("class","col-sm-9 has-success")
					}
				}
			}
			if(msg != ""){
				$.scojs_message(msg, $.scojs_message.TYPE_ERROR);
			}else{

				$.ajax({
					type : "POST",
					url : "/user/info/id/1002/age/"+age,
					data : data,
					dataType : "json",
					success : function(data){
						if(data.status){
							$.scojs_message(data.msg, $.scojs_message.TYPE_OK);
						}else{
							$.scojs_message(data.msg, $.scojs_message.TYPE_ERROR);
						}
					}
				});
			}

		}
		function setAgeAndSex(value){
			var len = value.length;
			var nowDate = new Date();
			var nowYear = nowDate.getFullYear();
			var nowMonth = nowDate.getMonth()+1;
			var nowDay = nowDate.getDate();
            if (18 == len) {//如果为18位数
            	var year = value.substr(6,4);
            	var month = value.substr(10,2);
            	var day = value.substr(12,2);
            	var age = nowYear-year;
            	var sex = value.substr(16,1)%2;

            	age = nowMonth-month<0?age-1:age;
            	age = (nowMonth-month==0&& nowDay-day < 0)?age-1:age;

            	$("#age").html(age)
            	if (sex == 0 ) {//有余数为男
            		$('#sex').bootstrapSwitch('state', false);
            	};
            };
        }
        
        var province = "{{.Data.Area.Province}}";
        if ("男" == "{{.Data.Sex}}"){
        	$('#sex').bootstrapSwitch('state', true);
        }else{
        	$('#sex').bootstrapSwitch('state', false);
        }
        if ( province!= "") {
        	$("#province").val(province);
        };

    </script>



</div>
{{end}}