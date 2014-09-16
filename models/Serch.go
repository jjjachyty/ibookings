package models

import (
	u "ibookings/utils"
	"labix.org/v2/mgo/bson"
	"log"
	"regexp"
	"strconv"
	"strings"
)

type Serch struct {
	UserId   string  //用户ID
	Title    string  //关键词搜索
	Price    float64 //价格
	Sales    int32   //销量
	Province string  //省
	City     string  //市
	County   string  //县
}

/**
 * 查询所有title
 *
 *
 */
func QuerySkillTitle(words map[string][]string, p u.Page) u.Page {
	bm := BaseModel{TbName: "User"}.Instance()
	defer bm.Session.Close()

	result := []User{}

	query := bson.M{}
	var sort = "-skill.bid"
	var serchWords = ""

	for k, v := range words { //map[title:[重庆 云阳] item:[网球]]
		if k == "title" { //如果有title，则需要划分词组
			wordArry := strings.Split(v[0], " ") //按照空格拆开
			for _, n := range wordArry {         //[重庆] [云阳]
				n = strings.TrimSpace(n) //去掉空格
				if n != "" {             //如果不为空则后面加上|化词组
					serchWords += "|" + n
				}
			}
			serchWords = strings.Replace(serchWords, "|", "", 1) //需要去掉第一个|
			query = bson.M{"skill.title": bson.M{"$regex": serchWords, "$options": "i"}}
			log.Println("搜索title划分词", query)
		} else if k == "experience" {
			experienceArry := strings.Split(v[0], "-") //按照-格拆开[1-3]则为大于等于1小于3
			begin, _ := strconv.Atoi(experienceArry[0])
			end, _ := strconv.Atoi(experienceArry[1])
			query["skill.experience"] = bson.M{"$gte": begin, "$lt": end}
		} else if k == "category" { //根据竞价排名显示
			sort = "skill.category." + v[0]
		} else if k == "desc" { //根据竞价排名显示
			sort = "-skill." + v[0]
		} else if k == "asc" { //根据竞价排名显示
			sort = "skill." + v[0]
		} else {
			query[k] = v[0]
		}
	}
	log.Println("组合query", query)
	log.Println("排序规则", sort)
	moq := bm.Collection.Find(query).Sort(sort)
	pipestr := []bson.M{{"$match": query}, {"$group": bson.M{"_id": "", "count": bson.M{"$sum": 1}}}}

	log.Println(" pipe ", pipestr)
	iter := bm.Collection.Pipe(pipestr).Iter()

	var its []struct {
		Count int
	}
	iter.All(&its)
	if len(its) > 0 {
		p.TotalRecords = its[0].Count //moq.Count()
	} else {
		p.TotalRecords = 0
	}
	moq.Skip(p.SkipRecords).Limit(p.PageSize).All(&result)
	serchResult := make([]Serch, len(result))

	for i, value := range result {
		for _, n := range value.Skill {
			serchResult[i].Title = n.Title
			if serchWords != "" {
				log.Println("正则表达式", "(?i:"+serchWords+")")
				reg := regexp.MustCompile("(?i:" + serchWords + ")")

				repl := "<span class='match-words'>$0</span>"

				serchResult[i].Title = reg.ReplaceAllString(n.Title, repl)
			}
			serchResult[i].UserId = value.Id
			serchResult[i].Sales = n.Sales
			serchResult[i].Province = value.Area.Province
			serchResult[i].City = value.Area.City
			serchResult[i].County = value.Area.County
			serchResult[i].Price = n.Price

		}
	}
	p.Data = serchResult
	return p
}
