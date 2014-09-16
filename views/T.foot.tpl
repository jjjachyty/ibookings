{{define "foot"}}
<style type="text/css">
footer {
    background: #33B982;
    padding: 60px 0;
    margin: 0
}

footer h5 {
    color: #fff;
    letter-spacing: 0
}

footer a {
    color: #dbe4ea
}

footer a:hover {
    color: #fff
}

 footer .lovingly span {
    font-family: entypo;
    line-height: .4;
    color: #ddd;
    display: inline-block;
    font-size: 1.5rem
}
.copyright{
  text-align: center;
  margin-top: 5%;
  color: #ddd;
}
</style>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>网站相关</h5>
                <a href="#" target="_blank">App下载</a><br>
                <a href="#">建议反馈</a><br>
                <a href="#">帮助</a><br>
                
            </div>
            <div class="col-md-3">
              <h5>关于</h5>
              <a href="#">关于我们</a> <br>
              <a href="#">隐私</a> <br>
              <a href="#">团队</a>
            </div>
            <div class="col-md-3">
              <h5>社区</h5>
              <a href="#">博客</a> <br>
              <a href="#">微博</a> <br>
              <a href="#">微信</a><br>
              <a href="#">联系我们</a>
            </div>
            <div class="col-md-3 lovingly">
                <p>友情链接 <span>♥</span></p>
                <div style="margin-top:10px">
                 <a href="">天猫</a>
                 <a href="">淘宝</a>
                 <a href="">京东商城</a>
                 <a href="">亚马逊</a>
                </div>
            </div>

        </div>
            <div class="copyright">
              <label>CopyRight 2014 ©舍力集团(CILI) </label>
            </div>
    </div>
</footer>
{{end}}