/**
 * copyright cili
 *模版处理工具类
 *@Janly 2014-09-02
 *
**/
package utils

import (
	ht "html/template"
	"io/ioutil"
	"log"
	"text/template"
)

func unescaped(x string) interface{} {
	log.Println("unescaped不处理html")
	return ht.HTML(x)
}

func ParesFiles(views ...string) *template.Template {
	var ss string

	foot, e := ioutil.ReadFile("views/T.foot.tpl")
	if e != nil {
		log.Println(e)
	}
	navbar, e := ioutil.ReadFile("views/T.navbar.tpl")
	if e != nil {
		log.Println(e)
	}
	ss = string(foot) + string(navbar)
	for _, v := range views {
		b, e := ioutil.ReadFile("views/" + v)
		if e != nil {
			log.Println(e)
		}
		s := string(b)
		ss += s
	}

	t, err := template.New("tmplString").Funcs(template.FuncMap{"unescaped": unescaped}).Parse(ss)
	log.Println(t)
	if err != nil {
		log.Println(err)
	}
	log.Println("temple", t)
	return t
}

/**
 * 把tpl的str转换成模版
 *
 *
 *
 */
func ParesString(name string, s string) *template.Template {
	t, err := template.New(name).Funcs(template.FuncMap{"unescaped": unescaped}).Parse(s)
	if err != nil {
		log.Println(err)
	}
	return t
}

/**
 * 把视图模版转成字符串
 */
func ParesFilesRtString(views ...string) string {
	var ss string
	for _, v := range views {
		b, e := ioutil.ReadFile("views/" + v)
		if e != nil {
			log.Println(e)
		}
		s := string(b)
		ss += s
	}
	return ss
}

/**
 *
 */
func ParesFilesDefault(views ...string) string {
	var ss string

	foot, e := ioutil.ReadFile("views/T.foot.tpl")
	if e != nil {
		log.Println(e)
	}
	navbar, e := ioutil.ReadFile("views/T.navbar.tpl")
	if e != nil {
		log.Println(e)
	}
	ss = string(foot) + string(navbar)
	for _, v := range views {
		b, e := ioutil.ReadFile("views/" + v)
		if e != nil {
			log.Println(e)
		}
		s := string(b)
		ss += s
	}
	return ss
}
