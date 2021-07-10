import Foundation

// https://leetcode.com/problems/plus-one

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var offset = 1, result = digits
        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            result[i] += offset
            offset = result[i] / 10
            result[i] %= 10
        }
        if offset > 0 { result.insert(offset, at: 0) }
        return result
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.009) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.plusOne([1,2,3])
        XCTAssertEqual(res, [1,2,4])
    }
    func test2() {
        let res = s.plusOne([4,3,2,1])
        XCTAssertEqual(res, [4,3,2,2])
    }
    func test3() {
        let res = s.plusOne([0])
        XCTAssertEqual(res, [1])
    }
}

Tests.defaultTestSuite.run()
