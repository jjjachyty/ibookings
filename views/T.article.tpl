{{define "article"}}
<h1>aaaaa</h1>
{{.articles}}
{{range .article}}
   <label>标题</label><label>{{.Title}}</label>
{{end}}
{{end}}