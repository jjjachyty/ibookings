<html>
    <head>
        <title>pongo2 demo</title>
  
<style type="text/css">
  <style>
.text-overflow{
width:200px;
height:100px;
border:1px solid red;
border-top:4px solid red;
padding:10px;
overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
white-space:nowrap;/* 不换行 */
}
</style>


</style>
   {% macro order_details(order) %}
   <tr>
    <th>{{order.BeginTime}} </th>
    <th>{{order.EndTime }} </th>
    <th>{{order.Skill.Category.Item}}</th>
    <th>{{order.TotalPrice}} 元</th>
    <th>{{order.Address}}</th>
    <th>张力</th>
    <th>15520010009</th>
    <th data-trigger="tooltip" data-content="Lorem ipsum dolor" title="{{order.Remark}}">{{order.Remark}}</th>
    <th>
    {{Status}}
      <a href="/schedule/accept/order/{{order.Id}}">接受</a>｜
      <a href="/topic/delete?tid=">拒绝</a>
    </th>
  </tr>
{% endmacro %}
  </head>
<body>
<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>开始时间</th>
      <th>结束时间</th>
      <th>项目</th>
      <th>金额</th>
      <th>地点</th>
      <th>预约人</th>
      <th>联系电话</th>
      <th>备注</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
{% for order in orderlist %}
        {{ order_details(order) }}
{% endfor %}

</tbody>
</table>

<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-5">
    <ul id="mypage"></ul>
  </div>
  <div class="col-md-3">
    总页数{{TotalPages}}
    总记录{{TotalRecords}}
  </div>
</div>



<script>

  var element = $('#mypage');

  var options = {
    bootstrapMajorVersion:3,
    alignment:'center',
    currentPage: {{CurrentPage}},
    numberOfPages: {{ShowPages}},
    totalPages:{{TotalPages}},
    onPageClicked: function(e,originalEvent,type,page){
      var user = getCookie("userid");
      loadHtml("my","/schedule/my/user/"+user+"/page/"+page);
    },
    itemContainerClass: function (type, page, current) {
      return (page === current) ? "active" : "pointer-cursor";
    }
  }
  element.bootstrapPaginator(options);
  
  function CrtTitle(o){
if( o.crtTitle == undefined ){
   o.crtTitle='true';
   o.title=o.scrollWidth>o.clientWidth?o.innerText:"";
}
}
</script>
</body>
</html>
