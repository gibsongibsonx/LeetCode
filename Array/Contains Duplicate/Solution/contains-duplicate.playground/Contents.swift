import Foundation

// https://leetcode.com/problems/contains-duplicate/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count > Set(nums).count
    }
}
