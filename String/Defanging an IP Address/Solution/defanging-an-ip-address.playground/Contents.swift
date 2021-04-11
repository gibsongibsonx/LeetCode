import Foundation

class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.components(separatedBy: ".").joined(separator: "[.]")
    }
}

import XCTest

//      Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.defangIPaddr("1.1.1.1"), "1[.]1[.]1[.]1")
    }
    func testExample2() {
        XCTAssertEqual(s.defangIPaddr("255.100.50.0"), "255[.]100[.]50[.]0")
    }
}

Tests.defaultTestSuite.run()
