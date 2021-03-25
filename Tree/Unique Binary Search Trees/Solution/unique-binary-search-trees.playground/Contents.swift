import Foundation

// https://leetcode.com/problems/unique-binary-search-trees/

// Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.

class Solution {
    func numTrees(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var arr: [Int] = .init(repeating: 0, count: n + 1)
        arr[0] = 1; arr[1] = 1
        
        for i in 2...n where n >= 2 {
            for j in 0..<i {
                arr[i] += arr[j] * arr[i - 1 - j]
            }
        }
        return arr[n]
    }
}

func tests() {
    let s = Solution()
    assert(s.numTrees(3) == 5) // good
    assert(s.numTrees(1) == 1) // good
}

tests()
