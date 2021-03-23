import Foundation

// https://leetcode.com/problems/sliding-window-maximum/

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.isEmpty == false else { return [] }
        
        var left = [Int]()
        var right = [Int]()
        
        for i in 0..<nums.count {
            while (left.count > 0) && (nums[left.last!] < nums[i]) {
                left.removeLast()
            }
            left.append(i)
            
            if i >= k - 1 {
                if left.first! + k == i { left.removeFirst() }
                right.append(nums[left.first!])
            }
        }
        return right
    }
}
