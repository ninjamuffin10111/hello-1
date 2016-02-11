/*
Not yo grandma's hello world.

This program can be run from the command line (see parseArgs())
or imported as a module  that other programs can use
its functions.

This documentation can be displayed with or converted to web page
with any number of tools.
*/
package lib

import (
	"fmt"
	c "github.com/skilstak/go/colors"
	"os"
	"strings"
	"time"
)

func PrintPlain(message string) {
	fmt.Println(message)
}

func PrintFoeva(message string) {
	for {
		fmt.Println(message)
	}
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

func ParseArgs() (string, string) {
	var who = "world"
	var option = ""

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
	return who, option

}
