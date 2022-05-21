package main

import (
	"net/http"

	"github.com/gobuffalo/packr/v2"
)

func main() {
	box := packr.New("site", "../frontend/dist")

	http.Handle("/", http.FileServer(box))

	http.ListenAndServe(":3030", nil)
}
