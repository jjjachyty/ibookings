package models

import (
	u "ibookings/utils"
	"labix.org/v2/mgo"
	"labix.org/v2/mgo/bson"
	"log"
)

type BaseModel struct {
	DbIp       string
	DbName     string
	TbName     string
	Session    *mgo.Session
	DataBase   *mgo.Database
	Collection *mgo.Collection
	Object     interface{}
}

func init() {

}

/**
 * 初始化baseModel
 *
 *
 *
 */
func (bm BaseModel) Instance() BaseModel {
	log.Println("baseModel bm", bm)
	if bm.TbName == "" {
		panic("tbname is null")
	}
	if bm.DbIp == "" {
		log.Println("default dbip 127.0.0.1")
		bm.DbIp = "127.0.0.1"
	}
	if bm.DbName == "" {
		log.Println("default database exppit")
		bm.DbName = "exppit"
	}
	log.Println("baseModel default", bm)
	session, err := mgo.Dial(bm.DbIp)
	if err != nil {
		panic(err)
	}
	session.SetMode(mgo.Monotonic, true)
	dbcol := session.DB(bm.DbName)
	tbcol := dbcol.C(bm.TbName)

	bm.Session = session
	bm.DataBase = dbcol
	bm.Collection = tbcol
	return bm
}

/**
*插入一个对象
 */
func (bm BaseModel) InsertObjects(obj interface{}) bool {
	log.Println(obj)
	structMap := u.Struct2Map(obj)
	log.Println(structMap)
	defer bm.Session.Close()
	err := bm.Collection.Insert(structMap)

	if err != nil {
		log.Println(err)
		return false
	}
	return true
}

/**
*query一个对象
 */
func (bm BaseModel) QueryObjetc() []bson.M {
	log.Println("－－－－－－－－－－查询－－－－－－－－－－－－")
	defer bm.Session.Close()
	var result = []bson.M{}
	log.Println("bm.Object", bm.Object)

	structMap := u.Struct2Map(bm.Object)

	err := bm.Collection.Find(structMap).All(&result)

	if err != nil {
		log.Println(err)
		//return err
	}

	return result
}
