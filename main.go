package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello from Mondoo Engineer!")
}

func main() {
	http.HandleFunc("/", handler)
	port := ":8080"
	fmt.Printf("Server listening on %s...\n", port)
	if err := http.ListenAndServe(port, nil); err != nil { // nosem: go.lang.security.audit.net.use-tls.use-tls
		fmt.Printf("Error starting server: %s\n", err)
	}
}
