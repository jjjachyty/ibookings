package controllers

import (
	t "html/template"
	m "ibookings/models"
	"log"
	"net/http"
)

type MainController struct {
}

func (main *MainController) Get(w http.ResponseWriter, r *http.Request) {
	t, err := t.ParseFiles("views/T.main.tpl", "views/T.navbar.tpl", "views/T.foot.tpl")
	if err != nil {
		log.Println(err)
	}

	cookie, _ := r.Cookie("username")
	user := m.User{}
	if cookie != nil {
		user.UserName = cookie.Value
	}
	t.Execute(w, &user)

}
