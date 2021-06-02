import Foundation

// https://leetcode.com/problems/majority-element/

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0, vote = 0
        nums.forEach({
            if vote == 0 { candidate = $0 }
            $0 == candidate ? (vote += 1) : (vote -= 1)
        })
        return candidate
    }
}

import XCTest

//      Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.majorityElement([3,2,3]), 3)
    }
    func test2() {
        XCTAssertEqual(s.majorityElement([2,2,1,1,1,2,2]), 2)
    }
}

Tests.defaultTestSuite.run()
