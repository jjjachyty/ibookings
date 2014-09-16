{{define "mySchedule"}}
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
   {{range .Data}}
   <tr>
    <th>{{.BeginTime | datetime}} </th>
    <th>{{.EndTime | datetime}} </th>
    <th>{{.Skill.Category.Item}}</th>
    <th>{{.TotalPrice}} 元</th>
    <th>{{.Address}}</th>
    <th>张力</th>
    <th>15520010009</th>
    <th title="">{{.Remark}}</th>
    <th>
      <a href="/topic/modify?tid=">接受</a>｜
      <a href="/topic/delete?tid=">拒绝</a>
    </th>
  </tr>
  {{end}}
</tbody>
</table>

<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-5">
    <ul id="mepage"></ul>
  </div>
  <div class="col-md-3"></div>
</div>
<script>

  var element = $('#mepage');

  var options = {
    bootstrapMajorVersion:3,
    alignment:'center',
    currentPage: {{.CurrentPage}},
    numberOfPages: {{.ShowPages}},
    totalPages:{{.TotalPages}},
    onPageClicked: function(e,originalEvent,type,page){
      var user = getCookie("userid");
      loadHtml("my","/schedule/my/user/"+user+"/page/"+page);
    },
    itemContainerClass: function (type, page, current) {
      return (page === current) ? "active" : "pointer-cursor";
    }
  }
  element.bootstrapPaginator(options);

</script>
{{end}}
