import UIKit



public class ListNode {
 public var val: Int
 public var next: ListNode?
 public init(_ val: Int) {
     self.val = val
     self.next = nil
 }
}

class Solution {
    func reverseListUsingStackIntermediary(_ head: ListNode?) -> ListNode? {
        //
        // Stack-based iterative approach
        //
        var head = head
        if head == nil { return head }
        var stack = [ListNode]()
        var current = head

        while current != nil {
            stack.append(current!)
            current = current?.next
        }

        head = stack.removeLast()
        current = head

        while !stack.isEmpty {
            current?.next = stack.last
        }
        current?.next = nil
        return head
        
    }
    
    func reverseListUsingInPlaceMutation(_ head: ListNode?) -> ListNode? {
            var previous: ListNode? = nil
            var current = head
            
            while (current != nil) {
                // make a temp value that points to the current node's next node
                let nextTemp = current?.next
                // set the current nodes next value to the previous (on first iteration, this will be nil)
                current?.next = previous
                // set the previous value to the current node
                previous = current
                // and move the current node to the next value
                current = nextTemp
            }
            // once we are here, we have fully reversed the list,
            return previous
    }
    
    func reverseListUsingRecursion(_ head: ListNode?) -> ListNode? {
        // if its a single-node list or an empty node, return that node
        if head == nil || head?.next == nil { return head }
        // traverse the call stack to get to a node where next = null
        let p = reverseListUsingRecursion(head?.next)
        
        // if the current list is 1 -> 2 -> 3 -> 4 -> 5 -> nil
        // and we have traversed the call stack to node(4)
        // at which point, we say head.next (5) .next (4) = 5
        // so we are saying that the next pointer of the next value should point to the value we are on
        // thereby reversing the pointed value
        head?.next?.next = head
        // once we have worked our way all the way up the call stack, we can set the next value to nil
        // because we have arrived back at the original starting value
        head?.next = nil
        return p
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        get {
            return "Node(\(val))"
        }
    }
}
