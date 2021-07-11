import Foundation

// https://leetcode.com/problems/find-the-highest-altitude/

class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var cur = 0, res = 0
        gain.forEach { cur += $0; res = max(res, cur) }
        return res
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        let res = s.largestAltitude([-5,1,5,0,-7])
        XCTAssertEqual(res, 1)
    }
    func test1() {
        let res = s.largestAltitude([-4,-3,-2,-1,4,3,2])
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()
