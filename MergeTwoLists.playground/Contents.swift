import UIKit

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let prehead: ListNode = ListNode(-1)
    var l1 = l1
    var l2 = l2
    
    var prev = prehead
    while l1 != nil && l2 != nil {
        if l1!.val <= l2!.val {
            prev.next = l1
            l1 = l1?.next
        } else {
            prev.next = l2
            l2 = l2?.next
        }
        prev = prev.next!
    }
    
    prev.next = l1 == nil ? l2 : l1
    return prehead.next
}
