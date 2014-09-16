package controllers

import (
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"text/template"
)

type CommonController struct {
	e.HTTP
}

func (this *CommonController) ShowPage(choose string, views ...string) {
	wr := this.ResponseWriter

	t := u.ParesFiles(views...)

	cookie := u.Cookie{HTTP: this.HTTP}
	cookie = cookie.GetCookie()
	user := m.User{}
	flag := false
	log.Println("登录cookie获取", cookie)
	if cookie.UserId != nil {
		user.Id = cookie.UserId.Value
		flag = true
	}
	var data e.TData = e.TData{CurrentUser: user, Flag: flag, Selected: choose}
	log.Println("data", data)
	t.Execute(wr, &data)
}

/**
 * 根据多个模版文件得到最终的模版
 */
func (this *CommonController) getTpl(name string, views ...string) *template.Template {
	str := u.ParesFilesDefault(views...)
	t := u.ParesString(name, str)
	return t
}
