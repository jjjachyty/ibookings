{{define "orderAdd"}}
<link href="/static/plugs/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<style type="text/css">
	.price{
		color: red;
	}
	.remark{
		margin-left: -40px
	}
</style>


<div class="row">
	<form id="orderAddForm" action="/order/add/">
		<div class="col-lg-6">
			<div class="form-group">
				<label for="dtp_input1" class="col-md-3 control-label">开始时间</label>
				<div class="input-group date form_datetime startTime col-md-8" data-date-format="yyyy-MM-dd HH:ii" data-link-field="mirror_start" data-link-format="yyyy/mm/dd hh:ii">
					<input class="form-control" onchange="setMoney()" size="16" id="startTime" name="startTime" type="text" value="" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
					<input type="hidden" id="mirror_start" value="" readonly />
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="form-group">
				<label for="dtp_input1" class="col-md-3 control-label">结束时间</label>
				<div class="input-group date form_datetime col-md-8" data-date-format="yyyy-MM-dd HH:ii" data-link-field="mirror_end" data-link-format="yyyy/mm/dd hh:ii">
					<input class="form-control" onchange="setMoney()" size="16" id="endTime" name="endTime" type="text" value="" readonly>
					<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
					<input type="hidden" id="mirror_end" value="" readonly />
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="form-group">
				<label for="dtp_input1" class="col-md-3 control-label">地点</label>
				<div class="input-group col-md-8">
					<input class="form-control" type="text" value="" id="address" name="address" placeholder="请填写详细地址">
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="form-group">
				<label for="dtp_input1" class="col-md-3 control-label">金额</label>
				<div class="input-group price col-md-9">
					<label>¥</label><label id="money">0</label>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="form-group">
				<label for="dtp_input1" class="col-md-2">备注</label>
				<div class="input-group col-md-10">
					<input class="form-control remark" type="text" value="" id="remark" name="remark" placeholder="备注信息">
				</div>
			</div>
		</div>
		<input type="hidden" name="skill" value="{{.}}">
		<div class="col-lg-12">
			<div class="modal-footer">
				<button type="button" class="btn btn-success btn-lg btn-block" onclick="orderAdd()" >预约</button>
			</div>
			
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/plugs/datetimepicker/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/static/plugs/datetimepicker/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
	$('.form_date').datetimepicker({
		language:  'zh-CN',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
  //   $('.form_datetime').datetimepicker({
  //      // language:  'zh-CN',
  //       weekStart: 1,
  //       todayBtn:  1,
		// autoclose: 1,
		// todayHighlight: 1,
		// startView: 2,
		// forceParse: 0,
  //   });
$(".form_datetime").datetimepicker({
	language:  'zh-CN',
	format: 'yyyy-mm-dd hh:00',
	pickerPosition: "bottom-left",
	todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	minuteStep:60,
	minView:1,

});
var dateTime = new Date();
dateTime.setDate(dateTime.getDate() + 1);
var dateStr = dateTime.format('yyyy-MM-dd');

$('.form_datetime').datetimepicker('setStartDate', dateStr+' 08:00');


$('.form_datetime').datetimepicker('setEndDate', dateStr+' 23:00');



function check(taget){
	if (/[^1-9]/g.test(taget.value))
	{
		$.scojs_message("时长应为大于1的正整数", $.scojs_message.TYPE_ERROR);
		taget.value="";
	}
}

function setMoney(){

	var startStr = $('#mirror_start').val();
	var endStr = $('#mirror_end').val();
	if (startStr != "" && endStr != "") {
		var hours = (new Date(endStr) - new Date(startStr))/3600000
		if (hours < 1) {
			$.scojs_message("结束时间应该大于开始时间至少1小时", $.scojs_message.TYPE_ERROR);
			$('#endTime').val('')
		}else{
			var price = Number($('#price').html())*hours
			$('#money').html(price)

		}
	}

}
function orderAdd(){
	var msg = ""
	var pars = $("#orderAddForm").serialize();
	var ruser = $("#showUserId").val();
	var money = $("#money").html();
	pars = pars +"&money="+money+"&ruser="+ruser
	var address = $("#address").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();

    alert(window.location.href)
	if (address == "") {
		msg = "请填写详细地址"
	}
	if (endTime == "") {
		msg = "请填写预约结束时间"
	}
	if (startTime == "") {
		msg = "请填写预约开始时间"
	}
	if (msg == "") {
		$.ajax({
			type : "POST",
			url : "/order/add/",
			data : pars,
			dataType : "json",
			success : function(data){
				if(data.status){
					window.location.href="/pay/alipay/order/"+data.data.Id
				}else{
					$.scojs_message(data.msg, $.scojs_message.TYPE_ERROR);
				}
			}
		});
	}else{
		$.scojs_message(msg, $.scojs_message.TYPE_ERROR);
	}

}

</script>
{{end}}