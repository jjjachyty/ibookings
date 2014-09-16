package utils

import ()

/**
 *
 * 分页对象
 */
type Page struct {
	CurrentPage  int         /*当前页*/
	NextPage     int         /*下一页*/
	SkipRecords  int         /*从多少条开始*/
	PageSize     int         /*页条数*/
	ShowPages    int         /*前段显示页数*/
	TotalRecords int         /*总记录数*/
	TotalPages   int         /*总页数*/
	Data         interface{} /*数据日期*/
}

/**过滤的开始条数**/
func (p *Page) InitSkipRecords() {
	if p.CurrentPage == 0 {
		p.CurrentPage = 1
	}
	if p.CurrentPage > 1 {
		p.SkipRecords = (p.CurrentPage - 1) * p.PageSize
	}
}

/**过滤的开始条数**/
func (p *Page) InitTotalPages() {

	number := p.TotalRecords / p.PageSize
	mod := p.TotalRecords % p.PageSize

	if mod > 0 {
		p.TotalPages = number + 1
	} else {
		p.TotalPages = number
	}
}
