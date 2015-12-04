//
//  hello.swift
//  hello
//
//  Created by Timothy Laskoski on 12/1/15. (2015-12-1)
//  Copyright © 2015 Timothy Laskoski. All rights reserved.
//

import Foundation

// Prints the message without any effects
public func printPlain(message: String) {
    print(message)
}

// `printPlain`s forever
public func printForever(message: String) {
    while true {
        printPlain(message, terminator: " ")
    }
}

// Fills the screen with random colored `message`s
public func printColor(message: String) {
    print(cl)
    while true {
        print(rc() + message, terminator: " ")
    }
}

// Prints every letter in `message` in a different, random color
public func printMulti(message: String) {
    while true {
        print(cl + multi(message))
        sleep(1)
    }
}

// Parses the command-line args
public func parseArgs() -> [String : String] {
    let argv = Process.arguments
    var p: [String : String] = ["name": "World", "option": ""]
    
    if argv.count > 2 {
        p["option"] = argv[1]
        p["name"] = argv[2]
    } else if argv.count == 2 {
        if argv[1].hasPrefix("-") {
            p["option"] = argv[1]
        } else {
            p["name"] = argv[1]
        }
    }
    
    return p
}
