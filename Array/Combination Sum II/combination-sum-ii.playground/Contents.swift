import Foundation

// 40. Combination Sum II
// https://leetcode.com/problems/combination-sum-ii/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]](), path = [Int]()
        dfs(&result, &path, target, candidates.sorted(), 0)
        return result
    }
    
    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ t: Int, _ candidates: [Int], _ index: Int) {
        guard t > 0 else { res.append(Array(path)); return }
        
        for i in index..<candidates.count where candidates[i] <= t {
            if i > 0 && candidates[i] == candidates[i-1] && i != index { continue }
            path.append(candidates[i])
            dfs(&res, &path, t - candidates[i], candidates, i + 1)
            path.removeLast()
        }
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        let res = s.combinationSum2([10,1,2,7,6,1,5], 8)
        XCTAssertEqual(res, [[1,1,6],[1,2,5],[1,7],[2,6]])
    }
    func test1() {
        let res = s.combinationSum2([2,5,2,1,2], 5)
        XCTAssertEqual(res, [[1,2,2],[5]])
    }
}

Tests.defaultTestSuite.run()
