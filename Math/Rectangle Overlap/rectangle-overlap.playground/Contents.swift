import Foundation

// https://leetcode.com/problems/rectangle-overlap/

class Solution {
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        let xr1 = rec1[0]..<rec1[2], xr2 = rec2[0]..<rec2[2]
        let yr1 = rec1[1]..<rec1[3], yr2 = rec2[1]..<rec2[3]
        return xr1.overlaps(xr2) && yr1.overlaps(yr2)
    }
}

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.isRectangleOverlap([0,0,2,2], [1,1,3,3]), true)
    }
    func test2() {
        XCTAssertEqual(s.isRectangleOverlap([0,0,1,1], [1,0,2,1]), false)
    }
    func test3() {
        XCTAssertEqual(s.isRectangleOverlap([0,0,1,1], [2,2,3,3]), false)
    }
}

Tests.defaultTestSuite.run()
