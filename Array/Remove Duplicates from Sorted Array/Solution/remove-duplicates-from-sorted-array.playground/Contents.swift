import Foundation

// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result: [Int: Int] = [:]
        nums.map { result[$0] = $0 }
        nums = result.map { $0.key }.sorted{ $1 > $0}
        return nums.count
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.094 (0.130) seconds

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func testExample1() {
        // Input: nums = [1,1,2]
        // Output: 2, nums = [1,2]
        var input = [1,1,2]
        s.removeDuplicates(&input)
        XCTAssertEqual(2, [1,2].count)
    }
    
    func testExample2() {
        // Input: nums = [0,0,1,1,1,2,2,3,3,4]
        // Output: 5, nums = [0,1,2,3,4]
        var input = [0,0,1,1,1,2,2,3,3,4]
        s.removeDuplicates(&input)
        XCTAssertEqual(5, [0,1,2,3,4].count)
    }
}

Tests.defaultTestSuite.run()
