package utils

import (
	//"html/template"
	e "ibookings/entity"
	"log"
	"net/http"
	"time"
)

type Cookie struct {
	e.HTTP
	Gsid   *http.Cookie
	UserId *http.Cookie
}

func (c *Cookie) InitCooike() {
	w := c.ResponseWriter
	cookie := c.GetCookie()
	log.Println("获取sessionid", cookie.Gsid)
	if cookie.Gsid == nil {
		gsid := http.Cookie{Name: "gsid", Value: GetNewGessionId(), Path: "/"}
		log.Println("生成新的sessionid", cookie.Gsid)
		http.SetCookie(w, &gsid)
	}

}

func (c *Cookie) DestroyCooike() {
	cookie, _ := c.Request.Cookie("userid")
	cookie.MaxAge = 0
	cookie.Path = "/"
	times := time.Now().AddDate(-1, 0, 0)
	cookie.Expires = times
	http.SetCookie(c.ResponseWriter, cookie)
}

func (c *Cookie) GetCookie() Cookie {
	cookie := Cookie{}
	cookie.Gsid, _ = c.Request.Cookie("gsid")
	cookie.UserId, _ = c.Request.Cookie("userid")
	log.Println("打印COOKIE", cookie)
	return cookie
}
