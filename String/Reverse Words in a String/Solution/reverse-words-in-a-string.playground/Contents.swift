import Foundation

// https://leetcode.com/problems/reverse-words-in-a-string/

class Solution {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ").reversed().joined(separator: " ")
    }
}

func tests() {
    let s = Solution()
    assert(s.reverseWords("the sky is blue") == "blue is sky the") // good
    assert(s.reverseWords("  hello world  ") == "world hello") // good
    assert(s.reverseWords("a good   example") == "example good a") // good
    assert(s.reverseWords("  Bob    Loves  Alice   ") == "Alice Loves Bob") // good
    assert(s.reverseWords("Alice does not even like bob") == "bob like even not does Alice") // good
}

tests()
