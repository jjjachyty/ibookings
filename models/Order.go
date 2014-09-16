package models

import (
	u "ibookings/utils"
	"labix.org/v2/mgo/bson"
	"log"
	"time"
)

/**
 * 订单
 */
type Order struct {
	Id            string    "_id"
	RUser         string    /*被预定用户*/
	RUserName     string    /*预定用户名*/
	OUser         string    /*预定用户*/
	BeginTime     time.Time /**下单时间**/
	TimeConsuming int       /**预约时长/小时**/
	EndTime       time.Time /**结束时间**/
	TotalPrice    float64   /**金额**/
	Address       string    /**地址**/
	Status        string
	Skill         Skill     /*备注*/
	OrderTime     time.Time /*下单时间*/
	Remark        string    /*备注*/
}

/**
 * 评论
 */

type Comments struct {
	Start   int    /**评级**/
	Content string /**内容**/
}

/**
*插入一个预约订单
 */
func (o *Order) InsertOrder() (*Order, error) {
	o.getOrderId()
	bm := BaseModel{TbName: "Order"}.Instance()

	defer bm.Session.Close()

	err := bm.Collection.Insert(&o)

	if err != nil {
		log.Println(err)
		return o, err
	}
	return o, nil
}

/**
*得到预约我的订单
 */
func (o *Order) GetRuserOrders(page u.Page) u.Page {
	bm := BaseModel{TbName: "Order"}.Instance()
	defer bm.Session.Close()

	result := []Order{}

	query := bson.M{"ruser": o.RUser}

	moq := bm.Collection.Find(query).Sort("-OrderTime")
	pipestr := []bson.M{{"$match": query}, {"$group": bson.M{"_id": "", "count": bson.M{"$sum": 1}}}}
	log.Println(pipestr)
	iter := bm.Collection.Pipe(pipestr).Iter()

	var its []struct {
		Count int
	}
	iter.All(&its)
	log.Println(its)
	if len(its) > 0 {
		page.TotalRecords = its[0].Count //moq.Count()
	} else {
		page.TotalRecords = 0
	}
	log.Println("page.SkipRecords", page.SkipRecords, "page.PageSize", page.PageSize)
	moq.Skip(page.SkipRecords).Limit(page.PageSize).All(&result)

	page.Data = result
	return page
}

/**
*得到我预约的订单
 */
func (o *Order) GetOuserOrders(page u.Page) u.Page {
	bm := BaseModel{TbName: "Order"}.Instance()
	defer bm.Session.Close()

	result := []Order{}

	query := bson.M{"ouser": o.OUser}

	moq := bm.Collection.Find(query).Sort("-OrderTime")
	pipestr := []bson.M{{"$match": query}, {"$group": bson.M{"_id": "", "count": bson.M{"$sum": 1}}}}
	log.Println(pipestr)
	iter := bm.Collection.Pipe(pipestr).Iter()

	var its []struct {
		Count int
	}
	iter.All(&its)
	log.Println(its)
	if len(its) > 0 {
		page.TotalRecords = its[0].Count //moq.Count()
	} else {
		page.TotalRecords = 0
	}
	log.Println("page.SkipRecords", page.SkipRecords, "page.PageSize", page.PageSize)
	moq.Skip(page.SkipRecords).Limit(page.PageSize).All(&result)

	page.Data = result
	return page
}

/**
*插入一个用户
 */
func (this *Order) UpdateOrderStatusById() {

	this.InsertOrUpdateOrderById(bson.M{"status": this.Status})
}

/**
*插入一个用户
 */
func (this *Order) InsertOrUpdateOrderById(update bson.M) error {

	bm := BaseModel{TbName: "Order"}.Instance()

	defer bm.Session.Close()
	err := bm.Collection.UpdateId(this.Id, bson.M{"$set": update})

	if err != nil {
		log.Println(err)
		return err
	}
	return nil
}

func (o *Order) getOrderId() {
	timeStr := time.Now().Format("200601021504050700")
	timeStr = o.RUser + o.OUser + timeStr
	o.Id = timeStr
}
