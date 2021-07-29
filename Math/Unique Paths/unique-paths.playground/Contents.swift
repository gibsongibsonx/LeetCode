import Foundation

// 62. Unique Paths
// https://leetcode.com/problems/unique-paths/

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0 else { return 0 }
        var dp = [Int](repeating: 1, count: n)
        (1..<m).forEach { _ in
            (1..<n).forEach { // col
                dp[$0] += dp[$0 - 1]
            }
        }
        return dp.last ?? 0
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.uniquePaths(3, 7)
        XCTAssertEqual(res, 28)
    }
    func test1() {
        let res = s.uniquePaths(3, 2)
        XCTAssertEqual(res, 3)
    }
    func test2() {
        let res = s.uniquePaths(7, 3)
        XCTAssertEqual(res, 28)
    }
    func test3() {
        let res = s.uniquePaths(3, 3)
        XCTAssertEqual(res, 6)
    }
}

Tests.defaultTestSuite.run()
