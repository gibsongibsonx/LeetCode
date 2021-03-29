import Foundation

// https://leetcode.com/problems/merge-two-sorted-lists/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        guard l1.val < l2.val else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    }
}
