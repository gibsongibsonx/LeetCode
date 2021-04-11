import Foundation

// https://leetcode.com/problems/4sum/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        
        var result = [[Int]]()
        let sort = nums.sorted(), c = sort.count
        
        for i in 0..<(c - 1) where i == 0 || sort[i] != sort[i-1] {
            for j in (i + 1)..<c where j == i + 1 || sort[j] != sort[j-1] {
                var f = j + 1, l = c - 1
                while f < l {
                    let s = sort[f], e = sort[l], n = sort[i], k = sort[j]
                    let sum = s + e + n + k
                    if sum == target { result.append([s,e,n,k]) }
                    if sum < target {
                        while sort[f] == s, f < c - 1 { f += 1 }
                    } else {
                        while sort[l] == e, l > j { l -= 1 }
                    }
                }
            }
        }
        return result
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.036 (0.038) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.fourSum([1,0,-1,0,-2,2], 0), [[1,2,-2,-1],[0,2,-2,0],[0,1,-1,0]]) // success
    }
    func testExample2() {
        XCTAssertEqual(s.fourSum([2,2,2,2,2], 8), [[2,2,2,2]]) // success
    }
}

Tests.defaultTestSuite.run()
