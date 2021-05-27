import Foundation

// https://leetcode.com/problems/second-largest-digit-in-a-string

class Solution {
    func secondHighest(_ s: String) -> Int {
        let set = Set(s.compactMap { $0.wholeNumberValue }).sorted(by: >)
        return set.count > 1 ? set[1] : -1
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.110 (0.112) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.secondHighest("dfa12321afd"), 2)
    }
    func test2() {
        XCTAssertEqual(s.secondHighest("abc1111"), -1)
    }
}

Tests.defaultTestSuite.run()
