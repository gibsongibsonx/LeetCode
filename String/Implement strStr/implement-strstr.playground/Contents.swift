import Foundation

// https://leetcode.com/problems/implement-strstr

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let nc = needle.count, hc = haystack.count
        if nc == 0 || haystack == needle { return 0 }
        
        guard hc >= nc else { return -1 }
        
        var hsi = haystack.startIndex
        for i in 0...(hc-nc) {
            let end = haystack.index(hsi, offsetBy: nc)
            if haystack[hsi..<end] == needle { return i }
            hsi = haystack.index(hsi, offsetBy: 1)
        }
        return -1
    }
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.267 (0.269) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.strStr("hello", "ll")
        XCTAssertEqual(res, 2)
    }
    func test2() {
        let res = s.strStr("aaaaa", "bba")
        XCTAssertEqual(res, -1)
    }
    func test3() {
        let res = s.strStr("", "")
        XCTAssertEqual(res, 0)
    }
}

Tests.defaultTestSuite.run()
