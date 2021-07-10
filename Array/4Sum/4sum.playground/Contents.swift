import Foundation

// https://leetcode.com/problems/4sum/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        
        var result = [[Int]]()
        let nums = nums.sorted(), count = nums.count
        
        for i in 0..<(count - 1) where i == 0 || nums[i] != nums[i-1] {
            for j in (i + 1)..<count where j == i + 1 || nums[j] != nums[j-1] {
                var f = j + 1, l = count - 1
                while f < l {
                    let a = nums[f], b = nums[l], c = nums[i], d = nums[j]
                    let sum = a + b + c + d
                    if sum == target { result.append([a,b,c,d]) }
                    if sum < target {
                        while nums[f] == a, f < count - 1 { f += 1 }
                    } else {
                        while nums[l] == b, l > j { l -= 1 }
                    }
                }
            }
        }
        return result
    }
}

import XCTest

//      Executed 2 tests, with 0 failures (0 unexpected) in 0.032 (0.033) seconds

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
