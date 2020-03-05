//
//  main.swift
//  Binary Trees
//
//  Created by Vivoo Mobile on 14.02.2020.
//  Copyright © 2020 MYB. All rights reserved.
//

import Foundation


class BinaryNode<Element>{
    var value : Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    func traversInOrder(visit: (Element) -> Void)
    {
        leftChild?.traversInOrder(visit: visit)
        visit(value)
        rightChild?.traversInOrder(visit: visit)
    }
    
    func traversPostOrder(visit: (Element) -> Void)
    {
        leftChild?.traversPostOrder(visit: visit)
        rightChild?.traversPostOrder(visit: visit)
        visit(value)
    }
    
    func traversPreOrder(visit: (Element) -> Void)
    {
        visit(value)
        leftChild?.traversPreOrder(visit: visit)
        rightChild?.traversPreOrder(visit: visit)
    }
}

let ten = BinaryNode(10)
let twenty = BinaryNode(20)
let six = BinaryNode(6)
let one = BinaryNode(1)
let five = BinaryNode(5)
let sixteen = BinaryNode(16)

ten.leftChild = twenty
ten.rightChild = six

twenty.leftChild = one
twenty.rightChild = five

six.leftChild = sixteen


ten.traversInOrder{ (val) in
    print(val)
}

ten.traversPostOrder { (val) in
    print(val)
}

ten.traversPreOrder { (val) in
    print(val)
}
