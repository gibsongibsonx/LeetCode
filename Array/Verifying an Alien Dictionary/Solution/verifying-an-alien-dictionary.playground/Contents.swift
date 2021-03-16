import UIKit
import XCTest

// https://leetcode.com/problems/verifying-an-alien-dictionary/

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let order = Array(order)
        var last = words[0] // last word
        for i in 1..<words.count {
            let current = words[i]
            let min = Swift.min(current.count, last.count)
            for j in 0..<min {
                let ci = order.firstIndex(of: Array(current)[j]) ?? 0 // current index
                let li = order.firstIndex(of: Array(last)[j]) ?? 0 // last index
                if ci > li { break }
                else if ci < li || (j == min - 1 && current.count < last.count) { return false }
            }
            last = current
        }
        return true
    }
}


class SolutionTests: XCTestCase {
    private var solution: Solution!
    
    override func setUp() {
        super.setUp()
        solution = .init()
    }
    
    func testAsserts() {
        XCTAssertTrue(solution.isAlienSorted(["hello","leetcode"],"hlabcdefgijkmnopqrstuvwxyz"))
        XCTAssertFalse(solution.isAlienSorted(["word","world","row"],"worldabcefghijkmnpqstuvxyz"))
        XCTAssertTrue(solution.isAlienSorted(["kuvp","q"],"ngxlkthsjuoqcpavbfdermiywz"))
        XCTAssertFalse(solution.isAlienSorted(["apple","app"],"abcdefghijklmnopqrstuvwxyz"))
        XCTAssertTrue(solution.isAlienSorted(["mtkwpj","wlaees"],"evhadxsqukcogztlnfjpiymbwr"))
    }
}

SolutionTests.defaultTestSuite.run()
