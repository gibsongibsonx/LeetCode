import UIKit

// https://leetcode.com/problems/diameter-of-binary-tree

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        @discardableResult
        func helper(_ node: TreeNode?, _ diameter: inout Int) -> Int {
            guard let root = node else { return 0 }
            var lh = 0, rh = 0
            if let l = root.left { lh += 1 + helper(l, &diameter) }
            if let r = root.right { rh += 1 + helper(r, &diameter) }
            diameter = max(diameter, (lh + rh))
            return max(lh, rh)
        }
        var diameter: Int = 0
        helper(root, &diameter)
        return diameter
    }
}

// MARK: - Tests

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.332 (0.334) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.diameterOfBinaryTree(.init([1,2,3,4,5])), 3)
    }
    func test2() {
        XCTAssertEqual(s.diameterOfBinaryTree(.init([1,2])), 1)
    }
}

Tests.defaultTestSuite.run()

// MARK: - TreeNode

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    // Additional initializer
    public init?(_ array: [Int?]) {
        var values = array
        guard !values.isEmpty, let head = values.removeFirst() else { return nil }
        
        val = head; left = nil; right = nil
        
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if !values.isEmpty, let val = values.removeFirst() {
                node.left = TreeNode(val)
                queue.append(node.left!)
            }
            if !values.isEmpty, let val = values.removeFirst() {
                node.right = TreeNode(val)
                queue.append(node.right!)
            }
        }
    }
}
