import Foundation

// https://leetcode.com/problems/isomorphic-strings/

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var source = [Character:Character]()
        var target = [Character:Character]()
        
        let s = Array(s), t = Array(t)
        
        for (i, char) in s.enumerated() {
            let t = t[i]
            
            if source[char] == nil && target[t] == nil {
                source[char] = t; target[t] = char
            } else if (source[char] != t) || (target[t] != char) {
                return false
            }
        }
        return true
    }
}
