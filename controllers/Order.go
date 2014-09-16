package controllers

import (
	t "html/template"
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"net/http"
	"strconv"
	"time"
)

type OrderController struct {
	e.HTTP
}

func (this *OrderController) Get() {
	w := this.ResponseWriter
	r := this.Request
	skill := r.FormValue("skill")
	// common := CommonController{HTTP: this.HTTP}
	// common.ShowPage("", "Order.add.tpl")
	cookie := u.Cookie{HTTP: this.HTTP}
	cookie = cookie.GetCookie()
	log.Println(cookie.UserId)
	if cookie.UserId == nil { //没有登录，则跳转到登录界面
		http.Redirect(w, r, "/login", http.StatusSeeOther)
	} else {
		t, err := t.ParseFiles("views/Order.add.tpl")
		if err != nil {
			log.Println(err)
		}
		t.ExecuteTemplate(w, "orderAdd", skill)
	}
}
func (this *OrderController) Add() {
	w := this.ResponseWriter
	r := this.Request
	data := e.Data{Msg: "生成订单成功", Status: 1}
	r.ParseForm()

	money := r.FormValue("money")
	startTime := r.FormValue("startTime")
	endTime := r.FormValue("endTime")
	address := r.FormValue("address")
	ruserId := r.FormValue("ruser")
	remark := r.FormValue("remark")
	skillId := r.FormValue("skill")

	order := m.Order{}
	order.Skill.Id = skillId
	order.Skill = order.Skill.GetSkillById()

	order.RUser = ruserId
	cookie := u.Cookie{HTTP: this.HTTP}
	cookie = cookie.GetCookie()

	if cookie.UserId != nil {
		order.OUser = cookie.UserId.Value
	}

	log.Println(startTime)
	log.Println(endTime)
	order.BeginTime, _ = time.Parse("2006-01-02 15:04", startTime)
	order.EndTime, _ = time.Parse("2006-01-02 15:04", endTime)
	order.OrderTime = time.Now()
	order.Status = "预约"
	order.Remark = remark
	order.Address = address
	order.TotalPrice, _ = strconv.ParseFloat(money, 32)
	ordered, err := order.InsertOrder()
	data.Data = ordered
	if err != nil {
		data.Msg = "订单生成失败"
		data.Status = 0
	}
	u.OutputJson(w, &data)
}
