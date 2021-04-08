import UIKit

// https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/

class Solution {
    func maxLength(_ arr: [String]) -> Int {
        var map = [String: Set<Character>](), ans = 0
        for s in arr {
            let chars = Set<Character>(s)
            if chars.count == s.count {
                for (k,ex) in map {
                    if ex.intersection(chars).isEmpty {
                        let str = "" + k + s
                        map[str] = ex.union(chars)
                        ans = max(ans, str.count)
                    }
                }
                map[s] = chars
                ans = max(ans, s.count)
                if ans == 26 { return 26 }
            }
        }
        return ans
    }
}

func tests() {
    let s = Solution()
    assert(s.maxLength(["un","iq","ue"]) == 4)
    assert(s.maxLength(["cha","r","act","ers"]) == 6)
    assert(s.maxLength(["abcdefghijklmnopqrstuvwxyz"]) == 26)
}

tests()
