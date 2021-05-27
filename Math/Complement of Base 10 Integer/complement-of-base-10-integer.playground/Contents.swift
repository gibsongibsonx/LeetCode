import Foundation

// https://leetcode.com/problems/complement-of-base-10-integer

class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        var s = 1
        while s < n { s = (s << 1) | 1 }
        return s - n
    }
}

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.bitwiseComplement(5), 2)
    }
    func test2() {
        XCTAssertEqual(s.bitwiseComplement(7), 0)
    }
    func test3() {
        XCTAssertEqual(s.bitwiseComplement(10), 5)
    }
}

Tests.defaultTestSuite.run()
