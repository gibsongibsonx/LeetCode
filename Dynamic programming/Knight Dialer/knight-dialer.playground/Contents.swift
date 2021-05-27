import Foundation

// https://leetcode.com/problems/knight-dialer/

class Solution {
    private let mode = 1e9 + 7 // 1000000007
    private let moves = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]
    
    func knightDialer(_ n: Int) -> Int {
        var res = 0
        let arr = Array(repeating: -1, count: 10)
        var visit = Array(repeating: arr, count: n+1)
        for i in 0..<10 {
            res = (res + helper(n, i, &visit, [Int]())) % Int(mode)
        }
        return res
    }
    private func helper(_ n: Int, _ i: Int, _ visit: inout [[Int]], _ sub: [Int]) -> Int {
        if n == 1 { return 1 }
        if visit[n][i] != -1 { return visit[n][i] } // 34452 times
        var sum = 0 // 28228 times
        moves[i].forEach({
            sum = (sum + helper(n-1, $0, &visit, [i, $0])) % Int(mode) // 62720 times
        })
        visit[n][i] = sum // 28228 times
        return sum
    }
}

import XCTest

//      Executed 5 tests, with 0 failures (0 unexpected) in 2.065 (2.066) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.knightDialer(1), 10)
    }
    func test2() {
        XCTAssertEqual(s.knightDialer(2), 20)
    }
    func test3() {
        XCTAssertEqual(s.knightDialer(3), 46)
    }
    func test4() {
        XCTAssertEqual(s.knightDialer(4), 104)
    }
    func test5() {
        XCTAssertEqual(s.knightDialer(3131), 136006598)
    }
}

Tests.defaultTestSuite.run()
