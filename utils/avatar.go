package utils

func Check(name string) bool {
	ext := []string{".jpg", ".png"}

	for _, v := range ext {
		if v == name {
			return true
		}
	}
	return false
}
