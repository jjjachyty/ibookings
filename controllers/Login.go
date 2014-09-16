package controllers

import (
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"net/http"

	"time"
)

type LoginController struct {
	e.HTTP
}

func (this *LoginController) Get() {
	common := CommonController{HTTP: this.HTTP}
	common.ShowPage("", "T.login.tpl")
}
func (this *LoginController) Post() {
	r := this.Request
	w := this.ResponseWriter
	data := e.Data{}
	r.ParseForm()
	username := r.FormValue("username")
	password := r.FormValue("password")
	//remomberme := r.FormValue("remember")
	vercode := r.FormValue("vercode")

	cookie, _ := r.Cookie("gsid")
	if cookie != nil { //如果cookie为空

		key := cookie.Value + "Img"
		captchaS := u.Session[key]
		log.Println("获得session中得验证码", captchaS)
		if captchaS == vercode {
			delete(u.Session, key)
			data.Status = 1
			data.Msg = ""
			//http.Redirect(w, r, "/", http.StatusSeeOther)
		} else {
			data.Status = 0
			data.Msg = "验证码错误"
		}
		user := m.User{UserName: username, PassWord: password}
		log.Println("用户表单数据：", user.UserName, user.PassWord)

		//user.InsertOneUserById(user)
		userDetail := user.GetUserDetil(user)
		log.Println(userDetail)
		if userDetail.UserName == "" {
			data.Status = 0
			data.Msg = "用户名或密码错误"
		}
		//登录成功设置成功标志位
		if data.Msg == "" {
			// usernameCookie := http.Cookie{Name: "username", Value: userDetail.UserName}
			// usernameCookie.Expires = time.Now().AddDate(0, 3, 0)
			// http.SetCookie(w, &usernameCookie)
			idCookie := http.Cookie{Name: "userid", Value: userDetail.Id, Path: "/"}
			idCookie.Expires = time.Now().AddDate(0, 3, 0)
			log.Println("设置登录cookie", idCookie)
			http.SetCookie(w, &idCookie)

		}
	} else {
		data.Status = 0
		data.Msg = "非法访问！"
	}
	u.OutputJson(w, &data)
}

func (this *LoginController) Exit() {
	r := this.Request
	w := this.ResponseWriter
	cookie := u.Cookie{HTTP: this.HTTP}
	cookie.DestroyCooike()
	http.Redirect(w, r, "/", http.StatusSeeOther)
}

func (this *LoginController) Check() {
	data := e.Data{Status: 1, Msg: "已登录"}
	cookie := u.Cookie{HTTP: this.HTTP}
	cookie = cookie.GetCookie()
	if cookie.UserId == nil { //没有登录
		data.Status = 0
		data.Msg = "没有登录"
		data.Data = "/login"
	}
	u.OutputJson(this.ResponseWriter, &data)
}
