package main

import (
	"fmt"
	c "github.com/skilstak/go/colors"
	"os"
	"strings"
	"time"
)

func plain(message string) {
	fmt.Println(c.CL + message + c.X)
}

func color(message string) {
	for {
		fmt.Print(c.Rc() + message + " " + c.X)
	}
}

func multi(message string) {
	for {
		fmt.Print(c.Clear + c.Rc() + message + " " + c.X)
		time.Sleep(500 * time.Millisecond)
	}
}

func main() {
	var who = "world"
	var option = ""
	var message = ""

	if len(os.Args) > 2 {
		option = os.Args[1]
		who = os.Args[2]

	} else if len(os.Args) == 2 {
		if strings.HasPrefix(os.Args[1], "-") {
			option = os.Args[1]
		} else {
			who = os.Args[1]
		}
	}

	message = "Hello " + who + "!"

	// could do this more directly with switch or an arg
	// parser, but keeping is simple for now

	if option == "-m" {
		multi(message)
	} else if option == "-c" {
		color(message)
	} else {
		plain(message)
	}

}
