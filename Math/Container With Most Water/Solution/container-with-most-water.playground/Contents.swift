import Foundation

// https://leetcode.com/problems/container-with-most-water/

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

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() { XCTAssert(s.maxArea([1,8,6,2,5,4,8,3,7]) == 49) } // success
    
    func testExample2() { XCTAssert(s.maxArea([1,1]) == 1) } // success
    
    func testExample3() { XCTAssert(s.maxArea([4,3,2,1,4]) == 16) } // success
    
    func testExample4() { XCTAssert(s.maxArea([1,2,1]) == 2) } // success
}

Tests.defaultTestSuite.run()
