import Foundation

// https://leetcode.com/problems/new-21-game

class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        guard k != 0 && n < (k + maxPts) else { return 1.0 }
        var dp = [Double](repeating: 0, count: n+1)
        dp[0] = 1.0
        var result = 0.0, val = 1.0
        for i in 1...n {
            dp[i] = val / Double(maxPts)
            i < k ? (val += dp[i]) : (result += dp[i])
            if i - maxPts >= 0 { val -= dp[i - maxPts] }
        }
        return result
    }
}

import XCTest

class Tests: XCTestCase {
    
}
