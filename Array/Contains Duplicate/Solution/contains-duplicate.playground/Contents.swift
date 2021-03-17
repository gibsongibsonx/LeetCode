import Foundation

// https://leetcode.com/problems/contains-duplicate/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count > Set(nums).count
    }
}

func tests() {
    let s = Solution()
    assert(s.containsDuplicate([1,2,3,1]) == true)
    assert(s.containsDuplicate([1,2,3,4]) == false)
    assert(s.containsDuplicate([1,1,1,3,3,4,3,2,4,2]) == true)
}

tests()
