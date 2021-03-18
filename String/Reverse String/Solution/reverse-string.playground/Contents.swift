import Foundation

// https://leetcode.com/problems/reverse-string

class Solution {
    func reverseString(_ s: inout [Character]) {
        s = s.reversed()
    }
}

func tests() {
    let s = Solution()
    
    var hello: [Character] = ["h","e","l","l","o"]
    s.reverseString(&hello)
    assert(hello == ["o","l","l","e","h"])
    
    var hannah: [Character] = ["H","a","n","n","a","h"]
    s.reverseString(&hannah)
    assert(hannah == ["h","a","n","n","a","H"])
}

tests()
