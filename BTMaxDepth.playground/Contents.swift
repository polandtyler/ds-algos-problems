import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
     self.val = val
     self.left = nil
     self.right = nil
    }
}
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 } else {
            let leftDepth = maxDepth(root?.left)
            let rightDepth = maxDepth(root?.right)
            
            return max(leftDepth, rightDepth) + 1
        }
    }
}
