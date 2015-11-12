package main

import (
	"fmt"
	c "github.com/skilstak/go/colors"
	"os"
	"strings"
	"time"
)

func PrintPlain(message string) {
	fmt.Println(c.CL + message + c.X)
}

func PrintColor(message string) {
	for {
		fmt.Print(c.Rc() + message + " " + c.X)
	}
}

func PrintMulti(message string) {
	for {
		fmt.Println(c.Clear + c.Multi(message) + " " + c.X)
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

	if option == "-m" {
		PrintMulti(message)
	} else if option == "-c" {
		PrintColor(message)
	} else {
		PrintPlain(message)
	}

}
