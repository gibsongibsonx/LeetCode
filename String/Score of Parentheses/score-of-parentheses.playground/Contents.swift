import Foundation

// https://leetcode.com/problems/score-of-parentheses/

class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
        var value = 0, result = 0
        let S = Array(s)
        for i in 0 ..< S.count {
            if S[i] == "(" {
                value += 1
            } else {
                value -= 1
                if S[i-1] == "(" { result += 1 << value }
            }
        }
        return result
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.008 (0.009) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.scoreOfParentheses("()"), 1)
    }
    func test2() {
        XCTAssertEqual(s.scoreOfParentheses("(())"), 2)
    }
    func test3() {
        XCTAssertEqual(s.scoreOfParentheses("()()"), 2)
    }
    func test4() {
        XCTAssertEqual(s.scoreOfParentheses("(()(()))"), 6)
    }
}

Tests.defaultTestSuite.run()
