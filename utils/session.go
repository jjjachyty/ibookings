package utils

import ()

var Session map[string]string

func init() {
	Session = make(map[string]string)
}
