{{define "skill"}}
{{range .Data.Skill}}
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">①<a onclick="delSkill(this)" class="edit cursor-pointer pull-right">删除</a></h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<form id="skillForm" class="form-horizontal"  action="#" role="form">

								<div class="col-lg-4">
									<div class="form-group">
										<label class="col-sm-3 control-label">分类</label>
										<div class="col-sm-5">
											<select class="form-control" name="skill[category]" id="category"onchange="addOption('category','subCategory',this.value)">
											</select>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label class="col-sm-3 control-label">类别</label>
										<div class="col-sm-5">
											<select class="form-control" id="skill[subCategory]" name="subCategory" onchange="addOption('category','item',this.value)">
											</select>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label class="col-sm-3 control-label">项目</label>
										<div class="col-sm-5">
											<select class="form-control" id="item" name="skill[item]">
											</select>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label class="col-sm-3 control-label">经验</label>
										<div class="col-sm-5">
											<input type="text" value="{{.Experience}}" class="form-control" id="experience" name="skill[experience]skill[" placeholder="/年" >
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label class="col-sm-3 control-label">价格</label>
										<div class="col-sm-5">
											<input type="text" class="form-control" value="{{.Price}}" id="price" name="skill[price]skill[" placeholder="/次">
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label class="col-sm-3 control-label">标题</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" value="{{.Title}}" name="skill[title]" placeholder="搜索关键词限15字" maxlength="15">
										</div>
									</div>
								</div>
							</form>
					</div>
				</div>
</div>
{{end}}
{{end}}