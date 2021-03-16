import UIKit
import XCTest

// https://leetcode.com/problems/array-partition-i/

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var arr = nums
        arr = arr.sorted()
        var res = 0
        for i in 0..<arr.count {
            if i & 1 != 0 {
                res += min(arr[i], arr[i - 1])
            }
        }
        return res
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func test() {
        XCTAssertTrue(solution.arrayPairSum([1,4,3,2]) == 4)
        XCTAssertTrue(solution.arrayPairSum([6,2,6,5,1,2]) == 9)
    }
}

Tests.defaultTestSuite.run()
