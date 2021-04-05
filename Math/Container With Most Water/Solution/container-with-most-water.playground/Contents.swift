import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 2 else { return min(height[0], height[1]) }

        var area = 0, l = 0, r = height.count - 1
        while l < r {
            let lots = min(height[l],height[r]) * (r - l)
            area = max(area, lots)
            if height[l] < height[r] { l += 1 } else { r -= 1 }
        }
        return area
    }
}
