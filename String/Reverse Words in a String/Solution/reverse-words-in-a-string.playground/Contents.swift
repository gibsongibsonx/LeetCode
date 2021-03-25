import Foundation

// https://leetcode.com/problems/reverse-words-in-a-string/

/*
Given an input string s, reverse the order of the words.
A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
Return a string of the words in reverse order concatenated by a single space.
Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
*/

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
