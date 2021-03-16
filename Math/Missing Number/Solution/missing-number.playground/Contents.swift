import Foundation

// https://leetcode.com/problems/missing-number/

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        nums.count * (nums.count + 1) / 2 - nums.reduce(0, +)
    }
}
