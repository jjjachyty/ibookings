package controllers

import (
	e "ibookings/entity"
)

type SportsController struct {
	e.HTTP
}

func (this *SportsController) Get() {
	common := CommonController{HTTP: this.HTTP}
	common.ShowPage("sports", "T.sports.tpl")

}
