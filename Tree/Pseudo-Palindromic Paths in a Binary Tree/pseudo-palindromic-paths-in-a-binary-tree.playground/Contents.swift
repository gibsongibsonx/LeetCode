import Foundation

// https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree

class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        return calculate(root, Set())
    }
    
    private func calculate(_ node: TreeNode?, _ set: Set<Int>) -> Int {
        guard let node = node else { return 0 }
        var newSet = set
        if set.contains(node.val) {
            newSet.remove(node.val)
        } else {
            newSet.insert(node.val)
        }
        switch (node.left, node.right) {
        case let (left?,right?):
            return calculate(left, newSet) + calculate(right, newSet)
        case let (left?, nil):
            return calculate(left, newSet)
        case let (nil, right?):
            return calculate(right, newSet)
        case (nil, nil):
            return newSet.count <= 1 ? 1 : 0
        }
    }
}

// MARK: - Tests

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.347 (0.349) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let tree = TreeNode([2,3,1,3,1,nil,1])
        XCTAssertEqual(s.pseudoPalindromicPaths(tree), 2)
    }
    func test2() {
        let tree = TreeNode([2,1,1,1,3,nil,nil,nil,nil,nil,1])
        XCTAssertEqual(s.pseudoPalindromicPaths(tree), 1)
    }
    func test3() {
        let tree = TreeNode([9])
        XCTAssertEqual(s.pseudoPalindromicPaths(tree), 1)
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

// To pass the tests

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.val == rhs.val
    }
}
