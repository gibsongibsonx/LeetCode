import Foundation

// https://leetcode.com/problems/lemonade-change/

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for bill in bills {
            switch bill {
            case 5:
                five += 1
            case 10:
                ten += 1
                if five < 1 { return false }
                five -= 1
            case 20:
                if five < 1 { return false }
                if ten < 1, five < 3 { return false }
                ten >= 1 ? (ten -= 1, five -= 1) : ((five -= 3),())
            default: break
            }
        }
        return true
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.lemonadeChange([5,5,5,10,20]), true)
    }
    func test2() {
        XCTAssertEqual(s.lemonadeChange([5,5,10]), true)
    }
    func test3() {
        XCTAssertEqual(s.lemonadeChange([10,10]), false)
    }
    func test4() {
        XCTAssertEqual(s.lemonadeChange([5,5,10,10,20]), false)
    }
}

Tests.defaultTestSuite.run()
