//
//  main.swift
//  Trees
//
//  Created by Vivoo Mobile on 14.02.2020.
//  Copyright © 2020 MYB. All rights reserved.
//

import Foundation

struct Queue<Element>{
    var element :[Element] = []
    
    mutating func enqueue(_ value : Element) -> Bool{
        element.append(value)
        return true
    }
    
    mutating func dequeue() -> Element?
    {
        return element.removeFirst()
    }
}

class TreeNode<T>{
    var value : T
    var children :[TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode)
    {
        self.children.append(child)
    }
}

extension TreeNode where T :Equatable{
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach{
            $0.forEachDepthFirst(visit)
        }
    }
    
    func forEachLevelOrder(_ visit: (TreeNode) -> Void)
    {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach{
            queue.enqueue($0)
        }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{queue.enqueue($0)}
        }
    
    }
    
    func search(_ value : T) -> TreeNode?
    {
        var res: TreeNode?
        
        forEachDepthFirst { (node) in
            if node.value == value
            {
                res = node
            }
        }
        return res
    }
}

let sex = TreeNode<String>("SEX")
let male = TreeNode<String>("MALE")
let female = TreeNode<String>("FEMALE")

sex.add(male)
sex.add(female)

let A = TreeNode<String>("A")
let B = TreeNode<String>("B")
male.add(A)
male.add(B)

let C = TreeNode<String>("C")
let D = TreeNode<String>("D")
female.add(C)
female.add(D)

//
//sex.forEachDepthFirst { (treeNode) in
//    print(treeNode.value)
//}

//sex.forEachLevelOrder { (treenode) in
//    print(treenode.value)
//}

let res = sex.search("D")
print(res!.value)
