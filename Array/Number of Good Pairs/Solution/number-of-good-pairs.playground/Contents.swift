import Foundation

// https://leetcode.com/problems/number-of-good-pairs

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var res = 0, map = [Int:Int]()
        nums.forEach({
            res += map[$0] ?? 0
            map[$0,default: 0] += 1
        })
        return res
    }
}
