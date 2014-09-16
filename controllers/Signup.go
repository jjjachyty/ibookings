package controllers

import (
	"html/template"
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"regexp"
)

const (
	mobile = "^(13[0-9]|14[57]|15[0-35-9]|18[07-9])\\d{8}$"
)

type SignupController struct {
	e.HTTP
}

func (this *SignupController) Get() {
	common := CommonController{HTTP: this.HTTP}
	common.ShowPage("", "T.signup.tpl")
}
func (this *SignupController) Post() {
	w := this.ResponseWriter
	r := this.Request
	user := m.User{}
	data := e.Data{Msg: "注册成功", Status: 1}
	r.ParseForm()
	userName := r.FormValue("username")
	passWord1 := r.FormValue("password1")
	passWord2 := r.FormValue("password2")
	reg := regexp.MustCompile(mobile)
	pleng := len(passWord1)
	if userName == "" {
		data.Status = 0
		data.Msg = "用户名不能为空"
	}

	if data.Status != 0 && !reg.MatchString(userName) {
		data.Status = 0
		data.Msg = "手机号码格式错误"
	}
	if data.Status != 0 && passWord1 == "" {
		data.Status = 0
		data.Msg = "密码不能为空"
	}

	if data.Status != 0 && (pleng < 6 || pleng > 12) {
		data.Status = 0
		data.Msg = "密码为6-12位字母或者数字组合"
	}

	if data.Status != 0 && passWord2 == "" {
		data.Status = 0
		data.Msg = "确认密码不能为空"
	}
	if data.Status != 0 && passWord1 != passWord2 { //后端验证两次密码不一致
		data.Status = 0
		data.Msg = "两次密码不一致！"
	}

	log.Println(template.HTMLEscapeString(passWord1))
	if data.Status != 0 {
		user.UserName = userName
		user.TelPhone = userName
		user.PassWord = passWord2
		/*新增用户*/
		user, err := user.InsertUser()
		if err != nil {
			data.Status = 0
			data.Msg = "用户注册出错"
			data.Data = err.Error()
		} else {
			data.Data = user
		}
	}
	u.OutputJson(w, &data)
	// user.Id = "9527"
	// user.RealName = "张力"
	// user.IDCard = "5002351991000000"
	// user.UserName = "15520010009"
	// user.Area = "重庆"

	// honours := make([]m.Honours, 1, 5)
	// h1 := m.Honours{"实名认证用户", "card"}

	// h2 := m.Honours{"会员", "vip"}
	// honours[0] = h1
	// honours = append(honours, h2)
	// user.Honours = honours
	// log.Println(cap(honours))

	// skills := make([]m.Skill, 2, 10)
	// skills[0].Category = "运动"
	// skills[0].Item = "游泳"
	// skills[0].Price = 50.00
	// skills[0].Bid = 0.00
	// skills[0].Experience = 2
	// skills[0].Sales = 90
	// skills[0].Title = "重庆市渝北区游泳馆高级游泳教练"
	// skills[0].Area = "重庆 云阳"
	// skills[0].UserId = "9530"

	// skills[1].Category = "电竟"
	// skills[1].Item = "LOL"
	// skills[1].Price = 10.00
	// skills[1].Bid = 0.00
	// skills[1].Experience = 3
	// skills[1].Sales = 1000
	// skills[1].Title = "英雄联盟LOL巨神峰白银高级带练"
	// skills[0].Area = "重庆 渝北"
	// skills[0].UserId = "9530"

	// skills[0].InsertSkills(skills)

	// user.Skill = skills
	// user.Introduction = "我就是爱音乐别让我停下来"
	// user.InsertUser(user)

	//log.Println(user)
}
