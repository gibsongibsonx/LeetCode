import Foundation

// https://leetcode.com/problems/next-greater-element-iii/

class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        var n = Array("\(n)"), i = n.count-1
        while i > 0 {
            switch n[i] > n[i-1] {
            case true:
                var k = i
                while k < n.count && n[k] > n[i-1] { k += 1 }
                (n[i-1], n[k-1]) = (n[k-1], n[i-1])
                n = n[0..<i] + n[i...].sorted()
                let nn = Int(String(n))!, max32 = Int(INT32_MAX)
                return nn < max32 + 1 ? nn : -1
            default:
                i -= 1
            }
        }
        return -1
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.nextGreaterElement(12), 21)
    }
    func test2() {
        XCTAssertEqual(s.nextGreaterElement(21), -1)
    }
}

Tests.defaultTestSuite.run()
