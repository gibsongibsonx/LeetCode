import Foundation

// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func helper(_ left: Int, _ right: Int, _ input: [Int]) -> TreeNode? {
            guard left <= right else {return nil}
            let mid = (left + right)/2
            let root = TreeNode(input[mid])
            root.left = helper(left,mid - 1, input)
            root.right = helper(mid + 1, right, input)
            return root
        }
        return helper(0, nums.count - 1, nums)
    }
}

// MARK: - TreeNode -

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
                node.left = .init(val)
                queue.append(node.left!)
            }
            if !values.isEmpty, let val = values.removeFirst() {
                node.right = .init(val)
                queue.append(node.right!)
            }
        }
    }
}
