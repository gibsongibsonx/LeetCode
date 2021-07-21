import Foundation

// 34. Find First and Last Position of Element in Sorted Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        var result = [-1, -1], l = 0, r = nums.count - 1
        
        while l < r {
            let m = l + (r - l) / 2
            nums[m] < target ? (l = m + 1) : (r = m)
        }
        
        guard nums[l] == target else { return result }
        result[0] = l
        
        r = nums.count - 1
        while l < r {
            let m = l + (r - l) / 2 + 1
            target < nums[m] ? (r = m - 1) : (l = m)
        }
        result[1] = l
        return result
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.011 (0.014) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.searchRange([5,7,7,8,8,10], 8)
        XCTAssertEqual(res, [3,4])
    }
    func test1() {
        let res = s.searchRange([5,7,7,8,8,10], 6)
        XCTAssertEqual(res, [-1,-1])
    }
    func test2() {
        let res = s.searchRange([], 0)
        XCTAssertEqual(res, [-1,-1])
    }
}

Tests.defaultTestSuite.run()
