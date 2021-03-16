import UIKit

// https://leetcode.com/problems/binary-tree-pruning/

// We are given the head node root of a binary tree, where additionally every node's value is either a 0 or a 1.
// Return the same tree where every subtree (of the given tree) not containing a 1 has been removed.
// (Recall that the subtree of a node X is X, plus every node that is a descendant of X.)

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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val == 0, root.left == nil, root.right == nil { return nil }
        
        let left = pruneTree(root.left)
        let right = pruneTree(root.right)
        
        if root.val == 0, left == nil, right == nil { return nil }
        
        (root.left,root.right) = (left,right)
        
        return root
    }
}
