package models

import (
	"log"
	"time"
)

/**
 * 提现
 */
type Cash struct {
	Id        string    "_id"
	UserId    string    //用户号
	UserName  string    //用户真是名字
	Bank      string    //开户行
	Card      string    //卡号
	Address   string    //开户地址
	Money     float64   //提现金额
	BeginTime time.Time //申请提现时间
	Status    string    //申请状态
	OpUserid  string    //操作客服工号
	OpTime    time.Time //操作时间
}

/**
*插入一个用户
 */
func (this *Cash) InsertCash() {
	bm := BaseModel{TbName: "Cash"}.Instance()

	defer bm.Session.Close()

	err := bm.Collection.Insert(&this)

	if err != nil {
		log.Println(err)
	}
}
