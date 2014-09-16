package entity

import (
	"net/http"
)

/**
 * 基础Controller
 */
type HTTP struct {
	Request        *http.Request
	ResponseWriter http.ResponseWriter
}

/**
 *
 *
 * ajax后台返回前端的数据实体结构*
 */
type Data struct {
	Status int         `json:"status"` /**状态位**/
	Msg    string      `json:"msg"`    /**成功或者失败消息**/
	Data   interface{} `json:"data"`   /**返回的数据**/
}

/**
 * 后端处理页面导航了用户登录数据实体
 */
type TData struct {
	Data        interface{} /**其他携带数据**/
	CurrentUser interface{} /**登录的用户**/
	Selected    string
	Flag        bool /**标识位，资料查看是否是本人**/
}

/**
 *
 * 分页对象
 */
type Page struct {
	CurrentPage  int
	NextPage     int
	PageSize     int
	TotalRecords int
	TotalPages   int
	Data         interface{}
}
