import Foundation

// 1392. Longest Happy Prefix
// Runtime: 388 ms, faster than 100.00%
// https://leetcode.com/problems/longest-happy-prefix/

class Solution {
    func longestPrefix(_ s: String) -> String {
        guard s.count > 1 else { return "" }
        let l = s.count, chars = [Character](s)
        var next = [Int](repeating: -1, count: l)
        
        var k = -1
        for i in 1..<l {
            while k != -1 && chars[k+1] != chars[i] { k = next[k] }
            if chars[k + 1] == chars[i] { k += 1 }
            next[i] = k
        }
        return next[l-1] == -1 ? "" : String(chars[0...next[l-1]])
    }
}
