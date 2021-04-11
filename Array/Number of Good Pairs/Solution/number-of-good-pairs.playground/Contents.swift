import Foundation

// https://leetcode.com/problems/number-of-good-pairs

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var res = 0, map = [Int:Int]()
        nums.forEach({
            res += map[$0] ?? 0
            map[$0,default: 0] += 1
        })
        return res
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.numIdenticalPairs([1,2,3,1,1,3]), 4) // success
    }
    func testExample2() {
        XCTAssertEqual(s.numIdenticalPairs([1,1,1,1]), 6) // success
    }
    func testExample3() {
        XCTAssertEqual(s.numIdenticalPairs([1,2,3]), 0) // success
    }
}

Tests.defaultTestSuite.run()
