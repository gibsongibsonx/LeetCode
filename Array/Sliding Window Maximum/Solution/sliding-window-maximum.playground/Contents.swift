import Foundation

// https://leetcode.com/problems/sliding-window-maximum/

/*
 You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
 
 Return the max sliding window.
*/

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

func tests() {
    let s = Solution()
    assert(s.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3) == [3,3,5,5,6,7]) // good
    assert(s.maxSlidingWindow([1], 1) == [1]) // good
    assert(s.maxSlidingWindow([1,-1], 1) == [1,-1]) // good
    assert(s.maxSlidingWindow([9,11], 2) == [11]) // good
    assert(s.maxSlidingWindow([4,-2], 2) == [4]) // good
}

tests()
