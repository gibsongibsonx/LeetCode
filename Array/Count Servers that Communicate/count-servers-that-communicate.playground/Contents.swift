import Foundation

// https://leetcode.com/problems/count-servers-that-communicate

class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        var rows = Array(repeating: 0, count: grid.count)
        var cols = Array(repeating: 0, count: grid[0].count)
        var servers = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    rows[i] += 1
                    cols[j] += 1
                    servers += 1
                }
            }
        }
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 && rows[i] == 1 && cols[j] == 1 {
                    servers -= 1
                    break
                }
            }
        }
        return servers
    }
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.countServers([[1,0],[0,1]]), 0)
    }
    func test2() {
        XCTAssertEqual(s.countServers([[1,0],[1,1]]), 3)
    }
    func test3() {
        XCTAssertEqual(s.countServers([[1,1,0,0],[0,0,1,0],[0,0,1,0],[0,0,0,1]]), 4)
    }
}

Tests.defaultTestSuite.run()
