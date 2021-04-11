import Foundation

// https://leetcode.com/problems/running-sum-of-1d-array/

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for i in 0..<nums.count where !nums.isEmpty {
            i == 0 ? res.append(nums[i]) : res.append(res[i-1] + nums[i])
        }
        return res
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.runningSum([1,2,3,4]), [1,3,6,10]) // success
    }
    func testExample2() {
        XCTAssertEqual(s.runningSum([1,1,1,1,1]), [1,2,3,4,5]) // success
    }
    func testExample3() {
        XCTAssertEqual(s.runningSum([3,1,2,10,1]), [3,4,6,16,17]) // success
    }
}

Tests.defaultTestSuite.run()
