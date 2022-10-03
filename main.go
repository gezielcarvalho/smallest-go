package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(rw, "Code.education Rocks!\n")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}