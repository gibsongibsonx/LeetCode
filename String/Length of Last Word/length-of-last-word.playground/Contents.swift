import Foundation

// https://leetcode.com/problems/length-of-last-word

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.lengthOfLastWord("Hello World")
        XCTAssertEqual(res, 5)
    }
    func test2() {
        let res = s.lengthOfLastWord(" ")
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()
