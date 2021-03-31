import Foundation

// https://leetcode.com/problems/longest-common-prefix

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var common = strs[0]
        strs.forEach({
            while !$0.hasPrefix(common) {
                common = String(common.dropLast())
            }
        })
        return common
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        // Input: strs = ["flower","flow","flight"]
        // Output: "fl"
        XCTAssertTrue(s.longestCommonPrefix(["flower","flow","flight"]) == "fl")
    }
    func testExample2() {
        // Input: strs = ["dog","racecar","car"]
        // Output: ""
        // Explanation: There is no common prefix among the input strings.
        XCTAssertTrue(s.longestCommonPrefix(["dog","racecar","car"]) == "")
    }
}

Tests.defaultTestSuite.run()
