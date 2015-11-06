package main

import (
	"fmt"
	c "github.com/skilstak/go/colors"
	"os"
)

func plain(message string) {
	fmt.Println(c.CL + message + c.X)
}

func color(message string) {
	for {
		fmt.Print(c.Rc() + message + " " + c.X)
	}
}

func main() {
	if len(os.Args) > 1 {
		if os.Args[1] == "color" {
			color("Hello World!")
		}
	} else {
		plain("Hello World!")
	}

}
