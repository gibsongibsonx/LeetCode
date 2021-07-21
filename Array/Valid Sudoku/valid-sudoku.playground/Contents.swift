import Foundation

// 36. Valid Sudoku
// https://leetcode.com/problems/valid-sudoku/

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for index in board.indices {
            let row = board[index].filter { $0 != "." }
            if row.count != Set(row).count { return false }
            
            let col = board.map{ $0[index] }.filter { $0 != "." }
            if col.count != Set(col).count { return false }
            
            let n = (i: 3 * (index / 3), j: 3 * (index % 3))
            let blocks = board[n.i ..< n.i+3].flatMap{$0[n.j ..< n.j+3]}.filter{$0 != "."}
            if blocks.count != Set(blocks).count { return false }
        }
        return true
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.173 (0.175) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])
        XCTAssertEqual(res, true)
    }
    func test1() {
        let res = s.isValidSudoku([["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])
        XCTAssertEqual(res, false)
    }
}

Tests.defaultTestSuite.run()
