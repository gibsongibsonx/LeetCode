import Foundation

// https://leetcode.com/problems/majority-element/

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0, vote = 0
        nums.forEach({
            if vote == 0 { candidate = $0 }
            $0 == candidate ? (vote += 1) : (vote -= 1)
        })
        return candidate
    }
}
