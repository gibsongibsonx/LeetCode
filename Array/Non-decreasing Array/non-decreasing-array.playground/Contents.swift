import Foundation

// https://leetcode.com/problems/non-decreasing-array/

class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return true }
        var modify = 0, n = nums.count - 1
        while n != 0 {
            if nums[n] < nums[n-1] {
                modify += 1
                if n > 1,
                   n < nums.count - 1,
                   nums[n+1] < nums[n-1],
                   nums[n-2] > nums[n] { return false }
            }
            if modify > 1 { return false }
            n -= 1
        }
        return true
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertTrue(s.checkPossibility([4,2,3])) // success
    }
    func testExample2() {
        XCTAssertFalse(s.checkPossibility([4,2,1])) // success
    }
}

Tests.defaultTestSuite.run()
