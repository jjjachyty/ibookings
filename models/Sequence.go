package models

import (
	"labix.org/v2/mgo/bson"
	"log"
	"sync"
)

var (
	lock         sync.Mutex
	sequenceCode Sequence
)

type Sequence struct {
	Id            bson.ObjectId "_id"
	CurrentNumber int           "CurrentNumber"
}

func GetCurrentSequence() int {
	var currentNumber int
	lock.Lock()
	currentNumber = sequenceCode.CurrentNumber
	sequenceCode.CurrentNumber += 1
	bm := BaseModel{TbName: "Sequence"}.Instance()
	log.Println(sequenceCode)
	bm.Collection.Update(bson.M{"CurrentNumber": currentNumber}, bson.M{"$set": bson.M{"CurrentNumber": sequenceCode.CurrentNumber}})
	lock.Unlock()
	return currentNumber
}

/**
 * 初始化序列值
 */
func init() {
	bm := BaseModel{TbName: "Sequence"}.Instance()
	sequence := Sequence{}
	bm.Collection.Find(nil).One(&sequence)
	sequenceCode = sequence
}
