import Foundation

// https://leetcode.com/problems/shuffle-the-array/

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var res = [Int]()
        for i in 0..<n {
            res.append(nums[i])
            res.append(nums[i + n])
        }
        return res
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.029 (0.031) seconds

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() {
        XCTAssertEqual(s.shuffle([2,5,1,3,4,7], 3), [2,3,5,4,1,7]) // success
    }
    
    func testExample2() {
        XCTAssertEqual(s.shuffle([1,2,3,4,4,3,2,1], 4), [1,4,2,3,3,2,4,1]) // success
    }
    
    func testExample3() {
        XCTAssertEqual(s.shuffle([1,1,2,2], 2), [1,2,1,2]) // success
    }
}

Tests.defaultTestSuite.run()
