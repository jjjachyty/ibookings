package models

import (
	"labix.org/v2/mgo"
	"labix.org/v2/mgo/bson"
	"log"
	"strconv"
)

type User struct {
	Id           string    "_id" /*主键*/
	UserName     string    /*用户名*/
	PassWord     string    /*密码*/
	TelPhone     string    /*电话*/
	RealName     string    /*真实姓名*/
	IDCard       string    /*身份证*/
	Age          int       /*年龄*/
	Sex          string    /*性别*/
	Seniority    string    /*教龄*/
	Area         Area      /*地区*/
	Honours      []Honours /**荣誉**/
	Introduction string    /*介绍*/
	Skill        []Skill
	ABalance     float64 /*可用余额*/
	FBalance     float64 /*冻结余额*/

}
type Honours struct {
	Title string /*解释*/
	Name  string /**名字**/
}

/**
*根据id获取唯一用户
 */
func (u *User) GetOneUserById() User {
	bm := BaseModel{TbName: "User"}.Instance()
	defer bm.Session.Close()

	result := User{}

	err := bm.Collection.Find(bson.M{"_id": u.Id}).One(&result)
	if err != nil {
		panic(err)
	}
	return result
}

/**
*根据用户名获取唯一用户
 */
func (u *User) GetOneUserByName(name string) User {
	bm := BaseModel{TbName: "User"}.Instance()

	defer bm.Session.Close()

	result := User{}

	err := bm.Collection.Find(bson.M{"username": name}).One(&result)
	if err != nil {
		panic(err)
	}
	return result
}

/**
*获取用户详细信息
 */
func (u *User) GetUserDetil(user User) User {
	bm := BaseModel{TbName: "User"}.Instance()

	defer bm.Session.Close()

	result := User{}
	query := bson.M{"username": user.UserName, "password": user.PassWord}
	log.Println("查询语句", query)
	err := bm.Collection.Find(query).One(&result)

	if err != nil {
		//panic(err)
	}

	return result
}

/**
*插入一个用户
 */
func (u User) InsertUser() (User, error) {
	log.Println("新增用户")
	u.Id = strconv.Itoa(GetCurrentSequence())
	bm := BaseModel{TbName: "User"}.Instance()

	defer bm.Session.Close()

	err := bm.Collection.Insert(&u)

	if err != nil {
		log.Println(err)
		return u, err
	}
	return u, nil
}

func (this User) UpdateABalance() error {

	return this.UpdateUserById(bson.M{"abalance": this.ABalance})
}

/**
*更新简介
 */
func (this User) UpdateSkillById() error {

	return this.UpdateUserById(bson.M{"skill": this.Skill})
}

func (this User) UpdateBaseInfoById() error {
	return this.UpdateUserById(bson.M{"realname": this.RealName, "idcard": this.IDCard, "age": this.Age, "sex": this.Sex, "area": this.Area, "honours": this.Honours})
}

func (this User) UpdateIntroductionById() error {
	return this.UpdateUserById(bson.M{"introduction": this.Introduction})
}

/**
*插入一个用户
 */
func (this User) InsertOrUpdateUserById(update bson.M) (*mgo.ChangeInfo, error) {

	bm := BaseModel{TbName: "User"}.Instance()

	defer bm.Session.Close()
	info, err := bm.Collection.UpsertId(this.Id, update)

	if err != nil {
		log.Println(err)
		return info, err
	}
	return info, nil
}

/**
*插入一个用户
 */
func (this User) UpdateUserById(update bson.M) error {

	bm := BaseModel{TbName: "User"}.Instance()

	defer bm.Session.Close()
	err := bm.Collection.UpdateId(this.Id, bson.M{"$set": update})

	if err != nil {
		log.Println(err)
		return err
	}
	return nil
}
