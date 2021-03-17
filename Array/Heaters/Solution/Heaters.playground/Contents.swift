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
