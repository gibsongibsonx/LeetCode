import Foundation

// https://leetcode.com/problems/longest-consecutive-sequence/

// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

// MARK: - Solution

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        let sorted = Set(nums).sorted()
        var long = 0, count = 1, i = 0
        
        while i < sorted.count {
            if i - 1 >= 0, sorted[i-1] == sorted[i] - 1 {
                count += 1
            } else {
                long = max(count, long)
                count = 1
            }
            i += 1
        }
        long = max(count, long)
        return long
    }
}

// MARK: - Tests

import XCTest

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() {
        XCTAssertEqual(s.longestConsecutive([100,4,200,1,3,2]), 4) // good
    }
    
    func testExample2() {
        XCTAssertEqual(s.longestConsecutive([0,3,7,2,5,8,4,6,0,1]), 9) // good
    }
}

Tests.defaultTestSuite.run()
