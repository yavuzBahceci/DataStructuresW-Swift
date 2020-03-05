//
//  main.swift
//  Binary Search Trees
//
//  Created by Vivoo Mobile on 14.02.2020.
//  Copyright © 2020 MYB. All rights reserved.
//

import Foundation

class BinaryNode<Element>
{
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
    
}

struct BinarySearchTree<Element: Comparable> {
    private(set) var root: BinaryNode<Element>?
    init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String{
        guard let root = root else {
            return "Empty tree"
        }
        
        return String(describing: root)
    }
}


extension BinaryNode: CustomStringConvertible
{
    public var description: String{
        return diagram(for :self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root:String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        
        return diagram(for: node.rightChild, top + " ", top + "-----", top + "| ")
    }
    
}

extension BinarySearchTree{
    
    
    mutating func insert(_ value: Element)
    {
        root = insert(from: root, value : value)
    }
    
    private func insert(from node: BinaryNode<Element>? , value: Element) -> BinaryNode<Element>{
        
        guard let node = node else{
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        }else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
    func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            }else {
                current = node.rightChild
            }
        }
        return false
    }
}

var bst = BinarySearchTree<Int>()

bst.insert(1)
bst.insert(66)
bst.insert(124)
bst.insert(12)

print(bst.contains(65))
