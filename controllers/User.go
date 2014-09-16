package controllers

import (
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"regexp"
	"strconv"
	"strings"
)

type UserController struct {
	e.HTTP
}

var (
	idCardReg = "/(^\\d{15}$)|(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)/"
)

func (this *UserController) Q() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	parId := r.FormValue("id")

	common := CommonController{HTTP: this.HTTP}

	t := common.getTpl("UserDetail", "T.user.tpl", "Order.add.tpl")

	showuser := m.User{Id: parId}
	data := e.TData{}
	flag := false
	isCurrentUser := false
	cookie := u.Cookie{HTTP: this.HTTP}
	cookie = cookie.GetCookie()
	// log.Println("获取cookie中的用户名")
	// username := u.GetCookieUserName(w, r)
	// if username != "" { //如果已经登录了
	// 	user = user.GetOneUserByName(username)
	// } else {

	// }

	log.Println(parId)
	if parId == "" {
		log.Println("url有错误")
	}
	showuser = showuser.GetOneUserById()
	loginuser := m.User{}
	userId := cookie.UserId //登录用户

	log.Println(showuser.RealName)
	if showuser.RealName != "" { //查到用户
		if userId != nil { //查到有登录用户
			loginuser.Id = userId.Value
			flag = true
			if showuser.Id == loginuser.Id { //已登录的用户浏览别人的资料
				isCurrentUser = true
			}
		}
		if !isCurrentUser { //别人浏览
			telph := u.SubString(showuser.UserName, 0, len(showuser.UserName)-4) + "****"
			idCard := u.SubString(showuser.IDCard, 0, len(showuser.IDCard)-4) + "****"
			showuser.UserName = telph
			showuser.IDCard = idCard
		}

		data = e.TData{Data: showuser, CurrentUser: loginuser, Flag: flag}

		t.Execute(w, &data)
	}

}

func (this *UserController) Info() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	user := m.User{}
	data := e.Data{Msg: "保存成功", Status: 1}

	id := r.FormValue("id")
	realName := r.FormValue("realName")
	idCard := r.FormValue("idCard")
	age := r.FormValue("age")
	sex := r.FormValue("sex")
	province := r.FormValue("province")
	city := r.FormValue("city")
	country := r.FormValue("country")

	if realName == "" {
		data.Msg = "真实姓名不能为空"
		data.Status = 0
	}
	if data.Status == 1 {
		if idCard == "" {
			data.Msg = "身份证号不能为空"
			data.Status = 0
		} else {
			reg := regexp.MustCompile(idCardReg)
			if !reg.MatchString(idCard) {
				data.Msg = "身份证号格式错误"
				data.Status = 0
			}
		}
	}
	if data.Status == 1 {
		if province == "请选择" {
			data.Msg = "请选择完整的地区信息"
			data.Status = 0
		}
		if city == "请选择" {
			data.Msg = "请选择完整的地区信息"
			data.Status = 0
		}
		if country == "请选择" {
			data.Msg = "请选择完整的地区信息"
			data.Status = 0
		}
	}
	if data.Status == 1 {
		user.Id = id
		user.RealName = realName
		user.IDCard = idCard
		user.Age, _ = strconv.Atoi(age)
		if sex == "on" {
			user.Sex = "男"
		} else {
			user.Sex = "女"
		}
		user.Area = m.Area{province, city, country}
		honours := make([]m.Honours, 3)
		honours[0].Name = "sm"
		honours[0].Title = "未实名认证"
		honours[1].Name = "vip"
		honours[1].Title = "普通用户"
		honours[2].Name = "db"
		honours[2].Title = "未交担保金"
		user.Honours = honours

		err := user.UpdateBaseInfoById()
		if err != nil {
			panic(err)
		}
	}

	u.OutputJson(w, &data)
}

func (this *UserController) Edit() {
	w := this.ResponseWriter
	r := this.Request
	data := e.TData{}

	common := CommonController{HTTP: this.HTTP}

	t := common.getTpl("User.edit.introduction.tpl", "User.edit.tpl", "User.edit.avatar.tpl", "User.edit.baseinfo.tpl", "User.edit.skills.tpl", "User.edit.skill.tpl", "User.edit.introduction.tpl")

	r.ParseForm()
	userId := r.FormValue("id")
	user := m.User{Id: userId}

	cookie := u.Cookie{HTTP: this.HTTP}
	cookie = cookie.GetCookie()

	flag := true
	if cookie.UserId == nil || userId != cookie.UserId.Value { //无登录cookie
		flag = false
	}
	if flag {
		user = user.GetOneUserById()
		data.CurrentUser = user
		data.Data = user
		data.Flag = flag
		t.Execute(w, &data)
	} else {
		Error{HTTP: this.HTTP}.Get()
	}

}

/**
 * 特长项新增修改
 */
func (this *UserController) Skills() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	userId := r.FormValue("user")
	category := r.FormValue("category")
	subCategory := r.FormValue("subCategory")
	experience := r.FormValue("experience")
	price := r.FormValue("price")
	item := r.FormValue("item")
	title := r.FormValue("title")

	user := m.User{Id: userId}
	skill := make([]m.Skill, 1) //普通用户默认只有一个技能项
	data := e.Data{Msg: "保存成功", Status: 1}
	skill[0].Id = userId + "1"
	skill[0].Category = m.Category{category, subCategory, item}
	skill[0].Title = title

	skill[0].Experience, _ = strconv.Atoi(experience)
	skill[0].Price, _ = strconv.ParseFloat(price, 1000)
	skill[0].UserId = userId
	skill[0].InsertOrUpdateSkillsById()
	user.Skill = skill
	user.UpdateSkillById()
	u.OutputJson(w, &data)
}

func (this *UserController) Introduction() {
	data := e.Data{Msg: "保存成功", Status: 1}
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	id := r.FormValue("id")
	introduction := r.FormValue("data")
	introduction = strings.Replace(introduction, "##", ";", -1)
	user := m.User{Id: id, Introduction: introduction}
	log.Println("user", user)
	user.UpdateIntroductionById()
	u.OutputJson(w, &data)
}
