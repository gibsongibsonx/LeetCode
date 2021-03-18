import Foundation

// https://leetcode.com/problems/remove-element/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}

func tests() {
    let s = Solution()
    
    var test1 = [3,2,2,3]
    s.removeElement(&test1, 3)
    assert(test1 == [2,2])
    
    var test2 = [0,1,2,2,3,0,4,2]
    s.removeElement(&test2, 2)
    assert(test2 == [0,1,3,0,4])
}

tests()
