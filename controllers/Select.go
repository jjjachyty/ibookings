package controllers

import (
	e "ibookings/entity"
	m "ibookings/models"
	u "ibookings/utils"
	"log"
)

type SelectController struct {
	e.HTTP
}

func (this *SelectController) Area() {
	w := this.ResponseWriter
	r := this.Request
	areaArry := []m.Select{}
	data := e.Data{Status: 1, Msg: "操作成功"}
	r.ParseForm()

	// t, err := t.ParseFiles("views/User.edit.area.tpl")
	// if err != nil {
	// 	log.Println(err)
	// }

	flag := r.FormValue("type")   //区别省市区
	value := r.FormValue("value") //
	areaArry = m.ProvinceCache
	city := m.CityCache
	country := m.CountyCache
	if "city" == flag {
		areaArry = city[value]
	} else if "country" == flag {

		areaArry = country[value]
	}
	data.Data = areaArry

	u.OutputJson(w, &data)

}
func (this *SelectController) Category() {
	w := this.ResponseWriter
	r := this.Request
	categoryArry := []m.Select{}
	data := e.Data{Status: 1, Msg: "操作成功"}
	r.ParseForm()

	// t, err := t.ParseFiles("views/User.edit.area.tpl")
	// if err != nil {
	// 	log.Println(err)
	// }

	flag := r.FormValue("type")
	log.Println("技能项", flag)
	value := r.FormValue("value") //
	categoryArry = m.CategoryCache
	if "subCategory" == flag {
		categoryArry = m.SubCategoryCache[value]
	}
	if "item" == flag {
		categoryArry = m.ItermCache[value]
	}
	data.Data = categoryArry
	log.Println("category", data)
	u.OutputJson(w, &data)

}
