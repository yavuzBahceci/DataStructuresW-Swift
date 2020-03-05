//
//  main.swift
//  Linked List
//
//  Created by Vivoo Mobile on 6.02.2020.
//  Copyright © 2020 MYB. All rights reserved.
//

import Foundation

//import UIKit

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty:Bool{
        return head == nil
    }
    
    mutating func push(value: Value){
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(value: Value){
        guard !isEmpty else {
            push(value: value)
            return
        }
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    func fetchNode(at index: Int) -> Node<Value> {
        var currentIndex = 0
        var currentNode = head
        
        while (currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode!
    }
    
    func insert(value: Value, after node: Node<Value>){
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func pop() -> Value?
    {
        defer {
            head = head?.next
            if isEmpty{
                tail = nil
            }
        }
        
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        guard let head = head else
        {
            return nil
        }
        guard head.next != nil else{
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next{
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
        
    }
    
    mutating func remove(after node: Node<Value>) -> Value?
    {
        defer {
            if node.next === tail
            {
                tail = node
            }
            
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    init() {
    }
}

extension LinkedList: CustomStringConvertible{
    var description: String
    {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value:Value, next:Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible{
    var description: String{
        guard let next = next else
        {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ""
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3


var linkedList = LinkedList<Int>()
linkedList.push(value: 15)
linkedList.push(value: 24)
linkedList.append(value: 100)
linkedList.insert(value: 42, after: linkedList.fetchNode(at: 1))
print(linkedList)
print(linkedList.pop())
print(linkedList)

linkedList.removeLast()
print(linkedList)

linkedList.remove(after: linkedList.fetchNode(at: 0))
print(linkedList)
