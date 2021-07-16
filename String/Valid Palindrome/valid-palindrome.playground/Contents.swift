import Foundation

// 125. Valid Palindrome
// https://leetcode.com/problems/valid-palindrome/

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = [Character](s.lowercased().filter { $0.isLetter || $0.isNumber })
        var lIndex = 0, rIndex = (chars.count - 1)
        while lIndex < rIndex {
            if chars[lIndex] != chars[rIndex] { return false }
            lIndex += 1
            rIndex -= 1
        }
        return true
    }
}
