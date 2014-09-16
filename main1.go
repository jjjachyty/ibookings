package main

import (
	"fmt"

	"time"
)

func main() {
	//y, m, d := time.Now().Date()
	//times := string(year) + string(month) + string(day)
	// fmt.Println(time.Now().Format("200601021504050700"))
	fmt.Print(time.Parse("2006-01-02 15:04", "2014-09-12 09:00"))
	//fmt.Println(y, d, m)
}
