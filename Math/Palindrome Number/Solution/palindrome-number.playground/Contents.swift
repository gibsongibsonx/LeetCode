import Foundation

// https://leetcode.com/problems/palindrome-number/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        let reverse = { () -> Int in
            // https://leetcode.com/problems/reverse-integer/
            var r = 0, x = x
            while x != 0 {
                r = r * 10
                r = r + x % 10
                x /= 10
            }
            if r < Int32.min || r > Int32.max { return 0 }
            return r
        }
        return reverse() == x
    }
}
