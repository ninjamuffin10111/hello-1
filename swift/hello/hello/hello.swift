//
//  hello.swift
//  hello
//
//  Created by Timothy Laskoski on 12/1/15. (2015-12-1)
//  Copyright © 2015 Timothy Laskoski. All rights reserved.
//

import Foundation

public func printPlain(message: String) {
    print(message)
}

public func printForever(message: String) {
    while true {
        print(message, terminator: " ")
    }
}

public func printColor(message: String) {
    print(cl)
    while true {
        print(rc() + message, terminator: " ")
    }
}

public func printMulti(message: String) {
    while true {
        print(cl + multi(message))
        sleep(1)
    }
}

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
