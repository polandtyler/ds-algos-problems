import UIKit


public class TreeNode<T>: CustomStringConvertible where T: CustomStringConvertible, T: Comparable {
    public var description: String = ""
    
    public var val: T
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: T) {
     self.val = val
     self.left = nil
     self.right = nil
    }
}

public class BinaryTree<T: Comparable & CustomStringConvertible> {
    public var description: String = ""
    
    private var root: TreeNode<T>?
    
    private var queue: Queue<TreeNode<T>> = Queue<TreeNode<T>>()
    
    func insert(element: T) {
        let node = TreeNode<T>(element)
        if let rootNode = self.root {
            insert(root: rootNode, node)
        } else {
            self.root = node
        }
    }
    
    private func insert(root: TreeNode<T>, _ node: TreeNode<T>) {
        if node.val > root.val {
            if let rightNode = root.right {
                insert(root: rightNode, node)
            } else {
                root.right = node
            }
        } else {
            if let leftNode = root.left {
                insert(root: leftNode, node)
            } else {
                root.left = node
            }
        }
    }
}

extension BinaryTree {
    func levelOrderTraverse() {
        guard let node = self.root else { return }
        self.queue.enqueue(node)
        while !self.queue.isEmpty {
            guard let nodeToPop = self.queue.dequeue() else { break }
            
            if let left = nodeToPop.left {
                self.queue.enqueue(left)
            }
            
            if let right = nodeToPop.right {
                self.queue.enqueue(right)
            }
        }
    }
}




func mostNodes(from node: TreeNode<Int>?) -> Int {
    guard let node = node else { return 0 }
    let leftDepth = mostNodes(from: node.left)
    let rightDepth = mostNodes(from: node.right)

    print(rightDepth)
    print(leftDepth)
    return max(leftDepth, rightDepth)
}


class Queue<T: CustomStringConvertible>: CustomStringConvertible {
    fileprivate var array: [T] = []
    
    func dequeue() -> T? {
        let dequeueItem = self.array.removeFirst()
        return dequeueItem
    }
    
    func enqueue(_ item: T) {
        array.append(item)
    }
    
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    var count: Int {
        return self.array.count
    }
    
    var description: String {
        let top = "### QUEUE ###\n\n"
        let bottom = "\n\n#############\n"
        let elements = self.array.map { $0.description }.joined(separator: " ")
        return top + elements + bottom
    }
}

func maxNodeLevel(_ root: TreeNode<Int>?) -> Int {
    var arrayQueue: [TreeNode<Int>] = []
    print("Left: \(root!.left)")
    print("Right: \(root!.right)")
    guard let root = root else { return 0 }
//    if root.left == nil && root.right == nil { return 1 }
    
    var currentLevel = 1
    var maxLevel = Int.min
    var levelNumber = 0
    
    arrayQueue.append(root)
    print("Count: \(arrayQueue.count)")
    
    while true {
        var nodeCount = arrayQueue.count
        if nodeCount == 0 { break }
        
        if nodeCount > maxLevel {
            maxLevel = nodeCount
            levelNumber = currentLevel
        }
        
        while nodeCount > 0 {
            let node = arrayQueue.first!
            arrayQueue.removeFirst()
            if let leftNode = node.left { arrayQueue.append(leftNode) }
            if let rightNode = node.right { arrayQueue.append(rightNode) }
            nodeCount -= 1
        }
        
        currentLevel += 1
    }
    
    return levelNumber
}

let tree = BinaryTree<Int>()
var root = TreeNode(5)
tree.insert(element: 3)
tree.insert(element: 2)
tree.insert(element: 2)
tree.insert(element: 7)
tree.insert(element: 6)
tree.insert(element: 11)
tree.insert(element: 12)
tree.insert(element: 13)

print("Max: \(maxNodeLevel(root))")



