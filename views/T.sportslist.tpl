 {{define "sportslist"}}
 <style type="text/css">
   .match-words{
    color: red;
  }
  a:hover{ color:#ff0000; }
  .thumbnail:hover{
   border:#ff0000 solid 1px;
   cursor: pointer;
 }
 .divumbnail {
   /*height: 335px;*/
 }
 .area{
  font-size: 8px;
}

.dealing {
  color: #888;
  font-size: 9px;
  line-height: 13px;
  height: 13px;
  text-align: right;
}
</style>
{{range .Data}}
<div class="col-sm-3 col-lg-3 thumbnail divumbnail">
  <a href="#" class="thumbnail">
    <img src="/static/img/avatar/{{.UserId}}.png">
  </a>
  <div class="caption-l">
    <div class="row">
      <div class="col-sm-6 col-lg-7 price"><i>￥</i>{{.Price}}</div>
      <div class="col-sm-6 col-lg-5 dealing">{{.Sales}} 人预约</div>
      <div class="col-sm-12"><a href="/user/q/id/{{.UserId}}" >{{.Title | unescaped}}</a></div>
      <div class="col-sm-12 area">{{.Province}}/{{.City}}/{{.County}}</div>
      <div class="col-sm-9"></div>
    </div>
  </div>
</div>
{{end}}
<div class="row"></div>
<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-5">
    <ul id="page"></ul>
  </div>
  <div class="col-md-3"></div>
</div>
<script>
 $(function(){
  var element = $('#page');

  var options = {
    bootstrapMajorVersion:3,
    alignment:'center',
    currentPage: {{.CurrentPage}},
    numberOfPages: {{.ShowPages}},
    totalPages:{{.TotalPages}},
    onPageClicked: function(e,originalEvent,type,page){
      serch(page);
    },
    itemContainerClass: function (type, page, current) {
      return (page === current) ? "active" : "pointer-cursor";
    }
  }
  element.bootstrapPaginator(options);
});
</script>
{{end}}