package controllers

import (
	"html/template"
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"net/http"
	"strconv"
)

type SerchController struct {
	e.HTTP
}

func unescaped(x string) interface{} {
	return template.HTML(x)
}

func (this *SerchController) Title() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	values := r.Form
	log.Println("Form 表单数据", values)
	page := u.Page{PageSize: 12, ShowPages: 5}

	currentPage := values.Get("page")
	values.Del("page")
	log.Println("当前页数", currentPage)
	page.CurrentPage, _ = strconv.Atoi(currentPage)
	page.InitSkipRecords()

	log.Println("过滤多少页", page.SkipRecords)
	log.Println("总页数", page.TotalPages)
	//map[words:[重庆] item:[网球]]

	page = m.QuerySkillTitle(values, page)

	page.InitTotalPages()

	t := template.New("")
	t = t.Funcs(template.FuncMap{"unescaped": unescaped})
	t, err := t.ParseFiles("views/T.sportslist.tpl")
	log.Println(page)
	t.ExecuteTemplate(w, "sportslist", &page)

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
