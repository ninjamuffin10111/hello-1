//
//  colors.swift
//  hello
//
//  Created by Timothy Laskoski on 12/1/15. (2015-12-1)
//  Copyright © 2015 Timothy Laskoski. All rights reserved.
//

import Foundation

extension Array {
    func randItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

let base03  = "\u{001b}[1;30m"
let BASE03  = base03
let B03     = base03
let b03     = base03
    
let base02  = "\u{001b}[0;30m"
let BASE02  = base02
let B02     = base02
let b02     = base02
    
let base01  = "\u{001b}[1;32m"
let BASE01  = base01
let B01     = base01
let b01     = base01
    
let base00  = "\u{001b}[1;33m"
let BASE00  = base00
let B00     = base00
let b00     = base00
    
let base0   = "\u{001b}[1;34m"
let BASE0   = base0
let B0      = base0
let b0      = base0
    
let base1   = "\u{001b}[1;36m"
let BASE1   = base1
let B1      = base1
let b1      = base1
    
let base2   = "\u{001b}[0;37m"
let BASE2   = base2
let B2      = base2
let b2      = base2
    
let base3   = "\u{001b}[1;37m"
let BASE3   = base3
let B3      = base3
let b3      = base3
let white   = base3

let yellow  = "\u{001b}[0;33m"
let YELLOW  = yellow
let Y       = yellow
let y       = yellow

let orange  = "\u{001b}[1;31m"
let ORANGE  = orange
let O       = orange
let o       = orange

let red     = "\u{001b}[0;31m"
let RED     = red
let R       = red
let r       = red
    
let magenta = "\u{001b}[0;35m"
let MAGENTA = magenta
let M       = magenta
let m       = magenta
    
let violet  = "\u{001b}[1;35m"
let VIOLET  = violet
let V       = violet
let v       = violet
    
let blue    = "\u{001b}[0;34m"
let BLUE    = blue
let B       = blue
let b       = blue
    
let cyan    = "\u{001b}[0;36m"
let C       = cyan
let c       = cyan
    
let green   = "\u{001b}[0;32m"
let G       = green
let g       = green
    
let reset   = "\u{001b}[0m"
let RESET   = reset
let X       = reset
let x       = reset
    
let conceil = "\u{001b}[0;8m"
let CONCEIL = conceil
    
let clear   = "\u{001b}[H\u{001b}[2J"
let CLEAR   = clear
let CL      = clear
let cl      = clear

let colors  = [red,orange,yellow,green,cyan,blue,magenta,violet]

public func randomColor() -> String {
    return colors.randItem()
}
public func rc() -> String {
    return randomColor()
}

public func multi(text: String) -> String {
    var buf = ""
    for char in text.characters {
        buf += rc() + String(char) + x
    }
    return buf
}

public func rainbow(text: String) -> String {
    var buf = ""
    var i = 0
    
    for char in text.characters {
        buf += colors[i] + String(char)
        i += 1
        if i == 8 {i = 0}
    }
    buf += x
    return buf
}

public func merica(text: String) -> String {
    var buf = ""
    let colorz = [red,white,blue]
    var i = 0
    
    for char in text.characters {
        buf += colorz[i] + String(char)
        i += 1
        if i == 3 {i = 0}
    }
    buf += reset
    return buf
}