package models

import (
	"labix.org/v2/mgo/bson"
)

/**
 * 技能
 */
type Skill struct {
	Id         string   "_id" /**/
	Title      string   /*标题*/
	Category   Category /**类别**/
	Experience int      /*经验*/
	Seniority  int      /**教龄**/
	Price      float64  /**单价**/
	Bid        float64  /****/
	Sales      int32    /**销量**/
	Comments   Comments /**评论**/
	UserId     string   /**用户主键**/
}

/**
*插入一个用户
 */
func (s Skill) InsertOrUpdateSkillsById() bool {
	bm := BaseModel{TbName: "Skill"}.Instance()
	defer bm.Session.Close()
	bm.Collection.UpsertId(s.Id, &s)
	return true
}

/**
*根据ID得到特长项
*
 */
func (s Skill) GetSkillById() Skill {
	bm := BaseModel{TbName: "Skill"}.Instance()
	defer bm.Session.Close()

	result := Skill{}

	err := bm.Collection.Find(bson.M{"_id": s.Id}).One(&result)
	if err != nil {
		panic(err)
	}
	return result
}
