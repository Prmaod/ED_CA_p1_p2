package function

import (
	"fmt"
	"net/http"
)

// HelloWorld prints the JSON encoded "message" field in the body
// of the request or "Hello, World!" if there isn't one.
func GetSportsNews(w http.ResponseWriter, r *http.Request) {

	fmt.Fprint(w, "Latest! Winners vs. Loosers 1:5")
}
