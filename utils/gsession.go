package utils

import (
	"crypto/md5"
	//"encoding/hex"
	"fmt"
	"io"
	"strconv"
	"time"
)

type GSessionId struct {
}

func GetNewGessionId() string {
	crutime := time.Now().Unix()
	h := md5.New()
	io.WriteString(h, strconv.FormatInt(crutime, 10))
	token := fmt.Sprintf("%x", h.Sum(nil))
	return token
}
