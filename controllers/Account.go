package controllers

import (
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
	"net/http"
	"strconv"
	"time"
)

type AccountController struct {
	e.HTTP
	userid   string  /*用户*/
	Balance  float64 /*余额*/
	ABalance float64 /*可用余额*/
	FBalance float64 /*冻结余额*/
}

func (this *AccountController) Info() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	parId := r.FormValue("id")

	common := CommonController{HTTP: this.HTTP}

	t := common.getTpl("account", "Account.info.tpl")

	showuser := m.User{Id: parId}
	data := e.TData{}
	flag := false

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
	log.Println(showuser.ABalance, showuser.FBalance)
	userId := cookie.UserId //登录用户

	log.Println(showuser.RealName)
	if showuser.RealName != "" { //查到用户
		if userId != nil { //查到有登录用户
			loginuser.Id = userId.Value
			flag = true
			if showuser.Id == loginuser.Id { //自己浏览自己
				data = e.TData{Data: showuser, CurrentUser: loginuser, Flag: flag}
				t.Execute(w, &data)
			}
		}

	}
}

func (this *AccountController) Recharge() {
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	parId := r.FormValue("id")
	//monry := r.FormValue("money")
	valus := r.Form

	valus.Add("billid", this.getRechargeId(parId))
	w.Header().Add("FormData", "xxxx")
	http.Redirect(w, r, "/pay/alipay/", http.StatusSeeOther)
}

func (this *AccountController) Cash() {
	data := e.Data{Msg: "申请成功", Status: 1}
	w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	userId := r.FormValue("user")
	money, _ := strconv.ParseFloat(r.FormValue("cash"), 32)
	user := m.User{Id: userId}
	user = user.GetOneUserById()
	if user.RealName == "" { //无开户人姓名
		data.Status = 0
		data.Msg = "真实姓名为空,请先设置真实姓名"
	}
	if data.Status == 1 && user.ABalance < money {
		data.Status = 0
		data.Msg = "提取金额有误"
	}
	if data.Status == 1 {
		username := user.RealName
		bank := r.FormValue("bank")

		card := r.FormValue("card")
		address := r.FormValue("address")
		cash := m.Cash{Id: this.getCashId(userId), UserId: userId, UserName: username, Bank: bank, Card: card, Address: address, Money: money, BeginTime: time.Now(), Status: "申请"}
		cash.InsertCash()
		user.ABalance = user.ABalance - money
		user.UpdateABalance()
	}
	u.OutputJson(w, &data)
}

/**
 * 获取充值流水号
 */
func (this *AccountController) getRechargeId(id string) string {
	timeStr := time.Now().Format("200601021504050")
	timeStr = "R" + id + timeStr
	return timeStr
}

/**
 * 获取体现流水号
 */
func (this *AccountController) getCashId(id string) string {
	timeStr := time.Now().Format("200601021504050")
	timeStr = "C" + id + timeStr
	return timeStr
}
