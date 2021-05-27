import Foundation

// https://leetcode.com/problems/sort-array-by-parity-ii

class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var map = [Int](repeating: 0, count: nums.count)
        var i = 0, j = 1
        nums.forEach({
            if $0 % 2 == 0 {
                map[i] = $0
                i += 2
            } else {
                map[j] = $0
                j += 2
            }
        })
        return map
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.sortArrayByParityII([4,2,5,7]), [4,5,2,7])
    }
    func test2() {
        XCTAssertEqual(s.sortArrayByParityII([2,3]), [2,3])
    }
}

Tests.defaultTestSuite.run()
