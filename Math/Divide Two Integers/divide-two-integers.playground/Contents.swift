import Foundation

// https://leetcode.com/problems/divide-two-integers/

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let positive = (dividend < 0) == (divisor < 0)
        var _dividend = Int64(abs(dividend))
        let _divisor = Int64(abs(divisor))
        
        var count = 0, t = 1, divisor = _divisor
        
        while divisor < _dividend {
            divisor = divisor << 1
            t = t << 1
        }
        
        while divisor > 0, divisor > _divisor {
            while divisor > _dividend {
                divisor = divisor >> 1
                t = t >> 1
            }
            _dividend -= divisor
            count += t
        }
        if _dividend == _divisor { count += 1 }
        return positive ? min(count, Int(Int32.max)) : max(-count, Int(Int32.min))
    }
}

import XCTest

//      Executed 4 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssert(s.divide(10, 3) == 3) // success
    }
    func testExample2() {
        XCTAssert(s.divide(7, -3) == -2) // success
    }
    func testExample3() {
        XCTAssert(s.divide(0, -1) == 0) // success
    }
    func testExample4() {
        XCTAssert(s.divide(1, 1) == 1) // success
    }
}

Tests.defaultTestSuite.run()
