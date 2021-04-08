import Foundation

// https://leetcode.com/problems/merge-two-sorted-lists/

/*
 Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.
 */

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

// MARK: - Tests

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func testExample1() {
        let l1 = ListNode([1,2,4])
        let l2 = ListNode([1,3,4])
        let expected = ListNode([1,1,2,3,4,4])
        XCTAssertEqual(s.mergeTwoLists(l1, l2), expected) // success
    }
    
    func testExample2() {
        let l1 = ListNode([])
        let l2 = ListNode([])
        let expected = ListNode([])
        XCTAssertEqual(s.mergeTwoLists(l1, l2), expected) // success
    }
    
    func testExample3() {
        let l1 = ListNode([])
        let l2 = ListNode([0])
        let expected = ListNode([0])
        XCTAssertEqual(s.mergeTwoLists(l1, l2), expected) // success
    }
}

Tests.defaultTestSuite.run()

// MARK: - ListNode Class + Extension

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    // An additional initializer that can be used to implement nodes from an array
    public init?(_ array: [Int]) {
        guard !array.isEmpty else { return nil }
        self.val = array[0]
        var prev: ListNode = self
        for i in 1..<array.count {
            let new = ListNode(array[i])
            prev.next = new
            prev = new
        }
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}
