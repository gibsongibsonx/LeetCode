import Foundation

// https://leetcode.com/problems/find-peak-element/

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var res = 0, n = nums.count - 1
        while res < n {
            let m = res + (n-res)/2
            nums[m] < nums[m+1] ? (res = m+1) : (n = m)
        }
        return res
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        let res = s.findPeakElement([1,2,3,1])
        XCTAssertEqual(res, 2)
    }
    func test1() {
        let res = s.findPeakElement([1,2,1,3,5,6,4])
        XCTAssertEqual(res, 5)
    }
}

Tests.defaultTestSuite.run()
