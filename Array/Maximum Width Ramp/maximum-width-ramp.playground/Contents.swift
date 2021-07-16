import Foundation

// 962. Maximum Width Ramp
// https://leetcode.com/problems/maximum-width-ramp/

class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        var n = Int.max, w = 0
        
        let nums = nums.enumerated().sorted {
            let le = $0.element, re = $1.element
            return (le != re) ? le < re : $0.offset < $1.offset
        }
        
        for i in 1..<nums.count {
            n = min(n, nums[i-1].offset)
            w = max(w, nums[i].offset - n)
        }
        return max(0, w)
    }
}
