import UIKit

class Node<T> {
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T, left: Node? = nil, right: Node? = nil) {
        self.left = left
        self.right = right
        self.data = data
    }
}

class BinaryTree<T: Comparable & CustomStringConvertible> {
    private var root: Node<Int>?
    
    func insert(element: Int) {
        let node = Node(data: element)
        
        if let root = self.root {
            self.insert(root, node)
        } else {
            self.root = node
        }
    }
    
    private func insert(_ root: Node<Int>, _ node: Node<Int>) {
        if root.data > node.data {
            if let leftNode = root.left {
                self.insert(leftNode, node)
            } else {
                root.left = node
            }
        } else {
            if let rightNode = root.right {
                self.insert(rightNode, node)
            } else {
                root.right = node
            }
        }
    }
}

extension BinaryTree {
    func traverse() {
//        print("\nPRE-ORDER TRAVERSE")
//        self.preOrderTraversal(self.root)
        print("\n\nIN-ORDER TRAVERSE")
        self.inOrderTraversal(self.root)
//        print("\n\nPOST-ORDER TRAVERSE")
//        self.postOrderTraversal(self.root)
        print("\n")
    }
    
    func preOrderTraversal(_ node: Node<T>?) {
        guard let node = node else { return }
        
        print("\(node.data)", terminator: " ")
        self.preOrderTraversal(node.left)
        self.preOrderTraversal(node.right)
    }
    
    func inOrderTraversal(_ node: Node<Int>?) -> [Int] {
        guard let node = node else { return [] }
        var returnValues = [Int]()
        
        self.inOrderTraversal(node.left)
        `
        self.inOrderTraversal(node.right)
        
        print(returnValues)
        return returnValues
    }
    
    func postOrderTraversal(_ node: Node<T>?) {
        guard let node = node else { return }
        self.postOrderTraversal(node.left)
        self.postOrderTraversal(node.right)
        print("\(node.data)", terminator: " ")
    }
}

let tree = BinaryTree<String>()
tree.insert(element: 1)
tree.insert(element: 3)
tree.insert(element: 5)
tree.insert(element: 7)
tree.insert(element: 9)

tree.traverse()
