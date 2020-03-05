//
//  main.swift
//  Queue
//
//  Created by Vivoo Mobile on 14.02.2020.
//  Copyright © 2020 MYB. All rights reserved.
//

import Foundation

//Fifo concept -> First in first out

struct Queue<T> {
    var array : [T] = []
    init() {
        
    }
    
    var isEmpty: Bool{
        return array.isEmpty
    }
    
    var peek:T?{
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T?{
        return isEmpty ? nil : array.removeFirst()
    }
}

extension Queue : CustomStringConvertible{
    var description: String{
        return String(describing: array)
    }
}


var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

print(queue)

queue.dequeue()

print(queue)

