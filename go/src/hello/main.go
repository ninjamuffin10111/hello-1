/*
Not yo grandma's hello world.

This program can be run from the command line (see parseArgs())
or imported as a module  that other programs can use
its functions.

This documentation can be displayed with or converted to web page
with any number of tools.
*/
package main

import h "hello/lib"

func main() {
	who, option := h.ParseArgs()
	message := "Hello " + who + "!"
	if option == "-m" {
		h.PrintMulti(message)
	} else if option == "-c" {
		h.PrintColor(message)
	} else {
		h.PrintPlain(message)
	}
}
