package controllers

import (
	"fmt"
	"github.com/flosch/pongo2"
	"html/template"
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"net/http"
	"strconv"
	"time"
)

type ScheduleController struct {
	e.HTTP
}

func (this *ScheduleController) Info() {
	w := this.ResponseWriter
	// r := this.Request
	// r.ParseForm()
	//userId := r.FormValue("user")

	// common := CommonController{HTTP: this.HTTP}

	// t := common.getTpl("schedule", "Schedule.info.html")

	// showuser := m.User{Id: userId}
	// data := e.TData{}
	// flag := false

	// cookie := u.Cookie{HTTP: this.HTTP}
	// cookie = cookie.GetCookie()

	// log.Println(userId)
	// if userId == "" {
	// 	log.Println("url有错误")
	// }

	// loginuser := m.User{}

	// cookieUserId := cookie.UserId //登录用户

	// if cookieUserId != nil { //查到有登录用户
	// 	loginuser.Id = cookieUserId.Value
	// 	flag = true
	// 	if showuser.Id == loginuser.Id { //自己浏览自己
	// 		data = e.TData{Data: showuser, CurrentUser: loginuser, Flag: flag}
	// 		t.Execute(w, &data)
	// 	} else {
	// 		Error{HTTP: this.HTTP}.PermissionDenied()
	// 	}
	// } else {
	// 	Error{HTTP: this.HTTP}.PermissionDenied()
	// }
	//http.Redirect(w, r, "/views/Schedule.info.html", 302)
	html := u.ParesFilesRtString("Schedule.info.html")
	fmt.Fprintln(w, html)
}
func datetime(x time.Time) interface{} {
	return x.Format("2006/01/02 15:04")
}
func shortenstr(x string) interface{} {
	length := len(x)
	if length > 10 {
		return u.SubString(x, 0, 10) + "..."
	}
	return x
}

// func (this *ScheduleController) My() {
// 	w := this.ResponseWriter
// 	r := this.Request
// 	r.ParseForm()
// 	user := r.FormValue("user")

// 	page := u.Page{PageSize: 10, ShowPages: 5}

// 	currentPage := r.FormValue("page")

// 	log.Println("当前页数", currentPage)
// 	page.CurrentPage, _ = strconv.Atoi(currentPage)
// 	page.InitSkipRecords()

// 	log.Println("过滤多少页", page.SkipRecords)
// 	log.Println("总页数", page.TotalPages)
// 	order := m.Order{RUser: user}
// 	page = order.GetRuserOrders(page)
// 	page.InitTotalPages()

// 	t := template.New("")
// 	t = t.Funcs(template.FuncMap{"datetime": datetime, "shortenstr": shortenstr})
// 	t, err := t.ParseFiles("views/Schedule.my.tpl")
// 	t.ExecuteTemplate(w, "mySchedule", &page)

// 	if err != nil {
// 		http.Error(w, err.Error(), http.StatusInternalServerError)
// 	}
// }
func (this *ScheduleController) My() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	user := r.FormValue("user")

	page := u.Page{PageSize: 10, ShowPages: 5}

	currentPage := r.FormValue("page")

	log.Println("当前页数", currentPage)
	page.CurrentPage, _ = strconv.Atoi(currentPage)
	page.InitSkipRecords()

	log.Println("过滤多少页", page.SkipRecords)
	log.Println("总页数", page.TotalPages)
	order := m.Order{RUser: user}
	page = order.GetRuserOrders(page)
	page.InitTotalPages()

	context := pongo2.Context{"orderlist": page.Data}

	var tplExample = pongo2.Must(pongo2.FromFile("views/Schedule.my.tpl"))

	err := tplExample.ExecuteWriter(context, w)
	if err != nil {
		log.Println(err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func (this *ScheduleController) Me() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	user := r.FormValue("user")

	page := u.Page{PageSize: 5, ShowPages: 5}

	currentPage := r.FormValue("page")

	log.Println("当前页数", currentPage)
	page.CurrentPage, _ = strconv.Atoi(currentPage)
	page.InitSkipRecords()

	log.Println("过滤多少页", page.SkipRecords)
	log.Println("总页数", page.TotalPages)
	order := m.Order{OUser: user}
	page = order.GetOuserOrders(page)
	page.InitTotalPages()

	t := template.New("")
	t = t.Funcs(template.FuncMap{"datetime": datetime})
	t, err := t.ParseFiles("views/Schedule.me.tpl")
	t.ExecuteTemplate(w, "mySchedule", &page)

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

/**
 * 接受预约
 */
func (this *ScheduleController) Accept() {
	data := e.Data{Msg: "操作成功", Status: 1}
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	orderId := r.FormValue("order")
	order := m.Order{Id: orderId, Status: "已接受"}
	order.UpdateOrderStatusById()
	u.OutputJson(w, &data)
}
