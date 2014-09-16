package main

import (
	. "ibookings/controllers"
	//. "exppit/models"
	. "ibookings/utils"
	//"log"
)

func main() {
	Cotrollers["login"] = &LoginController{}
	Cotrollers["signup"] = &SignupController{}
	Cotrollers["schedule"] = &ScheduleController{}
	Cotrollers["sports"] = &SportsController{}
	Cotrollers["user"] = &UserController{}
	Cotrollers["avatar"] = &AvatarController{}
	Cotrollers["img"] = &Image{}
	Cotrollers["serch"] = &SerchController{}
	Cotrollers["select"] = &SelectController{}
	Cotrollers["order"] = &OrderController{}
	Cotrollers["account"] = &AccountController{}
	Cotrollers["pay"] = &PayController{}

	Int()
}
