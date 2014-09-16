package utils

import (
	"encoding/json"
	"ibookings/entity"
	"labix.org/v2/mgo/bson"
	"net/http"
	"reflect"
)

func OutputJson(w http.ResponseWriter, data *entity.Data) {

	b, err := json.Marshal(&data)

	if err != nil {

		return

	}
	w.Write(b)
}

func Struct2Map(obj interface{}) map[string]interface{} {
	if obj != nil {
		var data = make(map[string]interface{})

		t := reflect.TypeOf(obj)
		v := reflect.ValueOf(obj)

		numField := t.NumField()

		for i := 0; i < numField; i++ {
			data[t.Field(i).Name] = v.Field(i).Interface()
		}

		return data
	} else {
		return nil
	}
}
func Map2Struct(resultMap []bson.M, obj interface{}) interface{} {
	// t := reflect.TypeOf(obj)
	// length := t.Len()
	// for i := 0; i < length; i++ {
	// 	log.Println(obj[i])
	// }
	// log.Println(t)
	// for _, v := range resultMap {
	// 	for k, u := range v {
	// 		log.Println("k", k, "u", u)
	// 	}
	// }
	data, _ := bson.Marshal(resultMap)
	bson.Unmarshal(data, obj)
	return obj
}
