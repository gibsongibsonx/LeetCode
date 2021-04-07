import Foundation

// https://leetcode.com/problems/strong-password-checker/
// Status: Accepted
// Runtime: 0 ms
// Memory Usage: 14.6 MB

// Discuss: https://leetcode.com/problems/strong-password-checker/discuss/1146420/Swift%3A-Strong-Password-Checker

class Solution {
    func strongPasswordChecker(_ password: String) -> Int {
        let arr = Array(password), c = arr.count
        var low = false, up = false, num = false
        arr.forEach({
            if $0.isLowercase { low = true }
            else if $0.isUppercase { up = true }
            else if $0.isNumber { num = true }
        })
        var types = 3
        if low { types -= 1 }
        if up { types -= 1 }
        if num { types -= 1 }
        
        var one = 0, two = 0, rep = 0, i = 2
        while i < c {
            if arr[i] == arr[i-1] && arr[i] == arr[i-2] {
                var l = 2
                while i < c && arr[i] == arr[i-1] {
                    l += 1
                    i += 1
                }
                rep += l / 3
                if l % 3 == 0 { one += 1 }
                else if l % 3 == 1 { two += 1 }
            } else {
                i += 1
            }
        }
        if c < 6 {
            return max(types, 6 - c)
        } else if c <= 20 {
            return max(types, rep)
        }
        let del = c - 20
        rep -= min(del, one)
        rep -= (min(max(del - one, 0), two * 2) / 2)
        rep -= (max(del - one - 2 * two, 0) / 3)
        return max(types, rep) + del
    }
}

let s = Solution()
print(s.strongPasswordChecker("1337C0d3")) // 0
print(s.strongPasswordChecker("aaa111")) // 2
print(s.strongPasswordChecker("aaa123")) // 1
