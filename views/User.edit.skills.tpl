{{define "skills"}}
<div class="edit-context">

	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">特长项<a title="会员" class="edit cursor-pointer pull-right" onclick="addSkill()">新增</a></h3>
		</div>
		<div class="panel-body">
			<div class="row" id="skills">

				{{template "skill" .}}

				<div class="col-lg-12">
					<button type="button" class="btn btn-success btn-lg btn-block" onclick="skills()">保存</button>
				</div>
			</div>

		</div>
	</div>


</div>
<script type="text/javascript">
	window.onload=addOption("category","category");
	function skills(){
		if (checkSkillsForm()) {
			var data = $("#skillForm").serialize();
			$.ajax({
				type : "POST",
				url : "/user/skills/id/1002/",
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
	function checkSkillsForm(){
		var category = $("#category").val();
		var subCategory = $("#subCategory").val();
		var item = $("#item").val();
		var experience = $("#experience").val();
		var price = $("#price").val();
		var title = $("#title").val();
		var msg = "";
		var regPrice = /^[1-9]{1}\d*(\.\d{1,2})?$/;
		var regYear = /^[0-9]?$/;
		if (category == "请选择") {
			$("#category").parent().addClass("has-error")
			msg = "请选择一个分类"
		}else{
			$("#category").parent().removeClass("has-error")
		}
		if (msg =="" && subCategory == "请选择") {
			$("#subCategory").parent().addClass("has-error")
			msg = "请选择一个类别"
		}else{
			$("#subCategory").parent().removeClass("has-error")
		}
		if (msg =="" && item == "请选择") {
			$("#item").parent().addClass("has-error")
			msg = "请选择一个项目"
		}else{
			$("#item").parent().removeClass("has-error")
		}
		if (msg =="" && !regYear.test(experience)) {
			$("#experience").parent().addClass("has-error")
			msg = "经验(/年)格式输入错误"
		}else{
			$("#experience").parent().removeClass("has-error")
		}
		if (msg =="" && !regPrice.test(price)) {
			$("#price").parent().addClass("has-error")
			msg = "价格(/小时)格式输入错误"
		}else{
			$("#price").parent().removeClass("has-error")
		}
		if(msg != ""){
			$.scojs_message(msg, $.scojs_message.TYPE_ERROR);
		}else{
			return	true;
		}
	}
	function addSkill(){
		$("#skills").append('{{template "skill" .}}')
	}
	function delSkill(taget){
		taget.parentElement.parentElement.parentElement.remove()
	}
</script>
{{end}}