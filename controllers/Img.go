package controllers

import (
	"github.com/disintegration/gift"
	e "ibookings/entity"
	u "ibookings/utils"
	"image"
	"image/jpeg"
	"image/png"
	"log"
	"os"
	"path/filepath"
	"strconv"
)

const (
	Upload_Dir   = "./static/img/avatar_tmp/"
	Show_Dir     = "/static/img/avatar_tmp/"
	Avatar_ReDir = "./static/img/avatar/"
)

type AvatarController struct {
	e.HTTP
}

func (this *AvatarController) Post() {
	w := this.ResponseWriter
	r := this.Request
	data := e.Data{Status: 1, Msg: "上传成功"}
	log.Println("头像上传post")
	r.ParseMultipartForm(32 << 20)
	log.Println("表单解析")
	file, handler, err := r.FormFile("realPicFile")

	if err != nil {
		log.Println("上传错误")
		return
	}

	fileext := filepath.Ext(handler.Filename)
	log.Println("文件后缀名字" + fileext)
	if u.Check(fileext) == false {
		data.Status = 0
		data.Msg = "不允许的上传类型"
		u.OutputJson(w, &data)
		return
	}
	cookie := u.Cookie{HTTP: this.HTTP}

	filename := cookie.GetCookie().UserId.Value + ".png"
	log.Println("文件名称" + filename)

	imgfile, _ := os.OpenFile(Upload_Dir+filename, os.O_CREATE|os.O_WRONLY, 0660)
	defer imgfile.Close()
	//把图片变成400X400尺寸的
	m1, err := jpeg.Decode(file)
	if err != nil {
		panic(err)
	}
	bounds := m1.Bounds()
	//如果第二参数为0则保持横纵比
	g := gift.New(
		gift.Resize(400, 400, gift.LanczosResampling),
	)
	dst := image.NewRGBA(g.Bounds(bounds))
	g.Draw(dst, m1)
	err = png.Encode(imgfile, dst)

	if err != nil {
		log.Println("上传失败")
		return
	}
	filedir := Show_Dir + filename
	data.Data = filedir
	log.Println(data)
	u.OutputJson(w, &data)
}

func (this *AvatarController) Get() {
	common := CommonController{HTTP: this.HTTP}
	common.ShowPage("T.avatar.tpl")
}

func (this *AvatarController) Cut() {
	r := this.Request
	data := e.Data{Status: 1, Msg: "上传成功"}
	r.ParseForm()
	x, err := strconv.Atoi(r.FormValue("x"))
	y, err := strconv.Atoi(r.FormValue("y"))
	x2, err := strconv.Atoi(r.FormValue("x2"))
	y2, err := strconv.Atoi(r.FormValue("y2"))

	fileName := r.FormValue("fileName")
	log.Println(x, y, x2, y2, fileName)
	g := gift.New(
		gift.Crop(image.Rect(x, y, x2, y2)),
		gift.Resize(220, 220, gift.LanczosResampling),
	)
	log.Println("图片名称" + fileName)
	//打开待处理的图片
	file, err := os.Open(fileName)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	m1, err := png.Decode(file)
	if err != nil {
		panic(err)
	}
	bounds := m1.Bounds()

	dst := image.NewRGBA(g.Bounds(bounds))
	g.Draw(dst, m1)
	cookie := u.Cookie{HTTP: this.HTTP}

	filename := cookie.GetCookie().UserId.Value + ".png"

	imgfile, err := os.Create(Avatar_ReDir + filename)
	os.Remove(Upload_Dir + filename)
	defer imgfile.Close()
	err = png.Encode(imgfile, dst)
	u.OutputJson(this.ResponseWriter, &data)
}

func (this *AvatarController) Upload() {
	//w := this.ResponseWriter
	r := this.Request
	r.ParseForm()
	values := r.Form

	for k, v := range values {
		log.Println("k", k, "v", v)
	}
}
