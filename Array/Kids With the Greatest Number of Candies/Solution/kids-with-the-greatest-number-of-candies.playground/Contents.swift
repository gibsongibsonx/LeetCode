import Foundation

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        guard let maxValue = candies.max() else { return [] }
        return candies.map { $0 + extraCandies >= maxValue ? true : false }
    }
}

import XCTest

//     Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.059) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.kidsWithCandies([2,3,5,1,3], 3), [true,true,true,false,true])
    }
    func testExample2() {
        XCTAssertEqual(s.kidsWithCandies([4,2,1,1,2], 1), [true,false,false,false,false])
    }
    func testExample3() {
        XCTAssertEqual(s.kidsWithCandies([12,1,12], 10), [true,false,true])
    }
}

Tests.defaultTestSuite.run()
