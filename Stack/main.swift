//
//  main.swift
//  Stack
//
//  Created by Vivoo Mobile on 14.02.2020.
//  Copyright © 2020 MYB. All rights reserved.
//

import Cocoa
import Foundation
//Concept of LIFO -> Lats in first out

struct Stack<Element> {
    private var storage:[Element] = []
    
    init() {
        
    }
    
    mutating func push(_ element : Element)
    {
        storage.append(element)
    }
    
    mutating func pop() -> Element?
    {
        storage.popLast()
    }
}


extension Stack:CustomStringConvertible{
    var description: String{
        let topDivider = "--------TOP---------\n"
        let bottomDivider = "\n--------BOTTOM---------"
        let stackElement = storage.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElement + bottomDivider
    }
    
    
}


var stack = Stack<Int>()
stack.push(1)
stack.push(12)
stack.push(14)
stack.push(11)
stack.push(16)
stack.push(61)
stack.push(81)
stack.push(62)

print(stack)
stack.pop()
print(stack)
