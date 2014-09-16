package models

import (
//"log"
)

/**
 * 技能
 */
type Select struct {
	Name string /*生*/
	Sub  []Select
	flag int32 "type"
}
type Area struct {
	Province string /*生*/
	City     string
	County   string
}
type Category struct {
	Category    string /*生*/
	SubCategory string
	Item        string
}

var (
	ProvinceCache []Select
	CityCache     map[string][]Select
	CountyCache   map[string][]Select

	CategoryCache    []Select
	SubCategoryCache map[string][]Select
	ItermCache       map[string][]Select
)

/**
*插入一个用户
 */
func (a Select) QueryAllProvince() []Select {
	result := []Select{}

	bm := BaseModel{TbName: "Area"}.Instance()

	defer bm.Session.Close()
	bm.Collection.Find(nil).All(&result)
	ProvinceCache = result
	return result
}

func (a Select) QueryAllCategory() []Select {
	result := []Select{}

	bm := BaseModel{TbName: "Category"}.Instance()

	defer bm.Session.Close()
	bm.Collection.Find(nil).All(&result)
	CategoryCache = result
	return result
}
func init() {
	CityCache = make(map[string][]Select)
	CountyCache = make(map[string][]Select)
	allAre := Select{}.QueryAllProvince()
	for _, v := range allAre {
		CityCache[v.Name] = v.Sub
		for _, w := range v.Sub {

			CountyCache[w.Name] = w.Sub
		}
	}
	ItermCache = make(map[string][]Select)
	SubCategoryCache = make(map[string][]Select)
	allCategory := Select{}.QueryAllCategory()
	for _, v := range allCategory {
		SubCategoryCache[v.Name] = v.Sub
		for _, w := range v.Sub {
			ItermCache[w.Name] = w.Sub
		}
	}
}
