import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var r = 0, x = x
        while x != 0 {
            r = r * 10
            r = r + x % 10
            x /= 10
        }
        if r < Int32.min || r > Int32.max { return 0 }
        return r
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.005 (0.039) seconds

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() {
        // Input: x = 123
        // Output: 321
        XCTAssertTrue(s.reverse(123) == 321)
    }
    
    func testExample2() {
        // Input: x = -123
        // Output: -321
        XCTAssertTrue(s.reverse(-123) == -321)
    }
    
    func testExample3() {
        // Input: x = 120
        // Output: 21
        XCTAssertTrue(s.reverse(120) == 21)
    }
    
    func testExample4() {
        // Input: x = 0
        // Output: 0
        XCTAssertTrue(s.reverse(0) == 0)
    }
}

Tests.defaultTestSuite.run()
