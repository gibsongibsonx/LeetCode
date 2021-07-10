import Foundation

// https://leetcode.com/problems/search-insert-position
// Discuss: https://vk.cc/c3GfB9

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var count = 0, r = (nums.count - 1)
        
        while count <= r {
            let n = count + (r - count) / 2
            switch nums[n] < target {
            case true:
                count = n + 1
            case false where nums[n] > target:
                r = n - 1
            default:
                return n
            }
        }
        return count
    }
}

import XCTest

// MARK: Executed 5 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.searchInsert([1,3,5,6],5)
        XCTAssertEqual(res, 2)
    }
    func test2() {
        let res = s.searchInsert([1,3,5,6],2)
        XCTAssertEqual(res, 1)
    }
    func test3() {
        let res = s.searchInsert([1,3,5,6],7)
        XCTAssertEqual(res, 4)
    }
    func test4() {
        let res = s.searchInsert([1,3,5,6],0)
        XCTAssertEqual(res, 0)
    }
    func test5() {
        let res = s.searchInsert([1],0)
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()
