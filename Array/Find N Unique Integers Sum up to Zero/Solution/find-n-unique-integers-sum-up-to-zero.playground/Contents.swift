import Foundation

// https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero/

class Solution {
    func sumZero(_ n: Int) -> [Int] {
        if n <= 1 && 1000 >= n { return [0] }
        var sum = [Int](repeating: 0, count: n)
        for i in 1...(n >> 1) {
            sum[i-1] = i
            sum[n-i] = -i
        }
        return sum
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() {
        XCTAssert(s.sumZero(5) == [1,2,0,-2,-1]) // success
    }
    
    func testExample2() {
        XCTAssert(s.sumZero(3) == [1,0,-1]) // success
    }
    
    func testExample3() {
        XCTAssert(s.sumZero(1) == [0]) // success
    }
}

Tests.defaultTestSuite.run()
