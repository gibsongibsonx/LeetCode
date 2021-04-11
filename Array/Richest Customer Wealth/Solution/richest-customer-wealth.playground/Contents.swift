import Foundation

class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var res = 0
        accounts.forEach({ res = max(res, $0.reduce(0, {$0 + $1})) })
        return res
    }
}

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExaple1() {
        XCTAssertEqual(s.maximumWealth([[1,2,3],[3,2,1]]), 6) // success
    }
    func testExaple2() {
        XCTAssertEqual(s.maximumWealth([[1,5],[7,3],[3,5]]), 10) // success
    }
    func testExaple3() {
        XCTAssertEqual(s.maximumWealth([[2,8,7],[7,1,3],[1,9,5]]), 17) // success
    }
}

Tests.defaultTestSuite.run()
