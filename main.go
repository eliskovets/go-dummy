package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, world")
	})
	port := ":9101"
	fmt.Printf("Starting web service on port %s\n", port);
	http.ListenAndServe(port, nil)
}
