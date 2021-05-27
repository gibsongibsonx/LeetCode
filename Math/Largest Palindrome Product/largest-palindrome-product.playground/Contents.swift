import Foundation

// https://leetcode.com/problems/largest-palindrome-product

class Solution {
    func largestPalindrome(_ n: Int) -> Int {
        let up = Int(pow(10.0,Double(n))) - 1
        let low = up / 10, num = low + 1
        let reversed = (num...up).reversed()
        for i in reversed {
            let str = String(i)
            let p = Int(str + String(str.reversed()))!
            var j = up
            while j * j > p {
                if p % j == 0 { return p % 1337 }
                j -= 1
            }
        }
        return 9
    }
}

// MARK: Tests

import XCTest

//     Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.largestPalindrome(2), 987)
    }
    func testExample2() {
        XCTAssertEqual(s.largestPalindrome(1), 9)
    }
}

Tests.defaultTestSuite.run()
