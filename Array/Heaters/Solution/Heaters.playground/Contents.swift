import UIKit

// https://leetcode.com/problems/heaters/

class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var i = 0 // index
        var r = 0 // radius
        
        let heaters = heaters.sorted()
        
        for h in houses.sorted() {
            while i < heaters.count - 1 && (h * 2) >= heaters[i] + heaters[i+1] {
                i += 1
            }
            r = max(r, abs(h - heaters[i]))
        }
        return r
    }
}

func tests() {
    let s = Solution()
    assert(s.findRadius([1,2,3], [2]) == 1)
    assert(s.findRadius([1,2,3,4], [1,4]) == 1)
    assert(s.findRadius([1,5], [2]) == 3)
}

tests()
