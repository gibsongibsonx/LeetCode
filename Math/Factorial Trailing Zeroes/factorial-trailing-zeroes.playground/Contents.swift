import Foundation

// 172. Factorial Trailing Zeroes
// https://leetcode.com/problems/factorial-trailing-zeroes/

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        return n < 5 ? 0 : (n/5 + trailingZeroes(n/5))
    }
}
