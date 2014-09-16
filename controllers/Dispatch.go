package controllers

import (
	e "ibookings/entity"
	u "ibookings/utils"
	"log"
	"net/http"
	"reflect"
	"strings"
)

var Cotrollers = make(map[string]interface{})

func dispatchController(w http.ResponseWriter, r *http.Request) {
	web := e.HTTP{Request: r, ResponseWriter: w}

	// defer func() {
	// 	log.Println("defer func is run")
	// 	e := recover()
	// 	if r != nil {
	// 		log.Println("recover : ", e)
	// 	}
	// }()

	pathInfo := strings.Trim(r.URL.Path, "/")
	parts := strings.Split(pathInfo, "/")
	r.ParseForm()
	cookie := u.Cookie{HTTP: web}
	cookie.InitCooike()
	log.Println((parts))

	if parts[0] != "" {
		log.Println("检测到url后面带/")
		var controllerName = ""
		var methodName = ""
		var formKey = ""
		var formValue = ""
		//处理类似URLxxx.com/login/exit/u/jjjachyty@163.com
		for index, value := range parts {
			switch index {
			case 0:
				//类名字
				controllerName = value
			case 1:
				//方法名字
				methodName = strings.Title(value)
			default:
				if index%2 == 0 {

					formKey = value

				} else {

					formValue = value

				}
				if formKey != "" && formValue != "" {
					log.Println("表单Key" + formKey)
					log.Println("表单Value" + formValue)
					r.Form.Add(formKey, formValue)
					//r.Form.Add("1", "1")
					log.Println(r.Form)
					formKey = ""
					formValue = ""
				}

			}

		}

		log.Println("controllerName：", controllerName)
		log.Println("methodName：", methodName)
		controllerClass, ok := Cotrollers[controllerName]
		if !ok {
			log.Print("没有找到Controller:", controllerName)
			controllerClass = Error{}
		}

		controller := reflect.ValueOf(controllerClass)
		if methodName == "" {
			if r.Method == "GET" {
				methodName = "Get"
			} else if r.Method == "POST" {
				methodName = "Post"
			}
		}
		method := controller.MethodByName(methodName)
		if method.IsValid() {
			// requestValue := reflect.ValueOf(r)
			// responseValue := reflect.ValueOf(w)
			log.Println(controller)

			webValue := reflect.ValueOf(web)
			httpField := controller.Elem().FieldByName("HTTP")

			log.Println("httpField", httpField, httpField.CanSet())
			httpField.Set(webValue)
			// fieldElem := httpField.Elem()
			// log.Println("Field can Set", fieldElem.CanSet())
			// fieldElem.Set(webValue)
			// responseWriter := controller.FieldByName("ResponseWriter")
			// responseWriter.Set(responseWriter)
			//method.Call([]reflect.Value{responseValue, requestValue})
			method.Call(nil)
		} else {
			log.Print("没有找到Method:", methodName)
		}
	} else {
		index := IndexController{HTTP: web}
		index.Index()

	}
}

func Int() {
	http.Handle("/static/", http.FileServer(http.Dir("."))) //文件服务器
	http.Handle("/views/", http.FileServer(http.Dir(".")))  //文件服务器
	http.HandleFunc("/", dispatchController)
	//设置访问的路由
	//设置访问的路由
	err := http.ListenAndServe(":9090", nil) //设置监听的端口
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
