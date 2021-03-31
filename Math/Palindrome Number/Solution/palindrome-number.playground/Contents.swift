import Foundation

// https://leetcode.com/problems/palindrome-number/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        let reverse = { () -> Int in
            // https://leetcode.com/problems/reverse-integer/
            var r = 0, x = x
            while x != 0 {
                r = r * 10
                r = r + x % 10
                x /= 10
            }
            if r < Int32.min || r > Int32.max { return 0 }
            return r
        }
        return reverse() == x
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() {
        // Input: x = 121
        // Output: true
        XCTAssertTrue(s.isPalindrome(121) == true)
    }
    
    func testExample2() {
        // Input: x = -121
        // Output: false
        // Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
        XCTAssertTrue(s.isPalindrome(-121) == false)
    }
    
    func testExample3() {
        // Input: x = 10
        // Output: false
        // Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
        XCTAssertTrue(s.isPalindrome(10) == false)
    }
    
    func testExample4() {
        // Input: x = -101
        // Output: false
        XCTAssertTrue(s.isPalindrome(-101) == false)
    }
}

Tests.defaultTestSuite.run()
