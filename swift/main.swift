//
//  main.swift
//  hello
//
//  Created by Timothy Laskoski on 12/1/15. (2015-12-1)
//  Copyright © 2015 Timothy Laskoski. All rights reserved.
//

import Foundation

let po = parseArgs()
let message = "Hello, " + po["name"]! + "!"

if po["option"] == "-f" {
    printForever(message)
} else if po["option"] == "-c" {
    printColor(message)
} else if po["option"] == "-m" {
    printMulti(message)
} else {
    printPlain(message)
}