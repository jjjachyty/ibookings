package controllers

import (
	e "ibookings/entity"
)

type IndexController struct {
	e.HTTP
}

func (this *IndexController) Index() {
	common := CommonController{HTTP: this.HTTP}
	common.ShowPage("index", "T.banner.tpl", "T.index.tpl")
}
