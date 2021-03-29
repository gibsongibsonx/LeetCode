import UIKit

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
}

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        var result = [[Int]](), tree = [node]
        while !tree.isEmpty {
            result.insert(tree.map { $0.val }, at: 0)
            tree = tree.flatMap { [$0.left, $0.right] }.compactMap{ $0 }
        }
        return result
    }
}
