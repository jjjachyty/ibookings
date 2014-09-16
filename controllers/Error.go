package controllers

import (
	"html/template"
	e "ibookings/entity"
	"log"
)

type Error struct {
	e.HTTP
}

func (this Error) Get() {
	t, err := template.ParseFiles("views/404.html")
	if err != nil {
		log.Println(err)
	}
	t.Execute(this.ResponseWriter, nil)
}
func (this Error) Post() {
	t, err := template.ParseFiles("views/404.html")
	if err != nil {
		log.Println(err)
	}
	t.Execute(this.ResponseWriter, nil)
}
func (this Error) Detail(i interface{}) {
	t, _ := template.ParseFiles("views/404.html")
	t.Execute(this.ResponseWriter, &i)
}

func (this Error) PermissionDenied() {
	t, _ := template.ParseFiles("views/401.html")
	t.Execute(this.ResponseWriter, nil)
}
