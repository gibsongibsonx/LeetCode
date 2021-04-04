# [10. Regular Expression Matching](https://leetcode.com/problems/regular-expression-matching/)

### Solution:
```swift
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var visit = [[Bool]]()
        for _ in 0...s.count + 1 {
            visit.append(Array(repeating: false, count: p.count + 1))
        }
        visit[s.count][p.count] = true
        for i in stride(from: s.count, through: 0, by: -1) {
            for j in stride(from: p.count - 1, through: 0, by: -1) {
                let ars = Array(s), arp = Array(p)
                let first = i < s.count && (ars[i] == arp[j] || arp[j] == ".")
                if j + 1 < p.count && arp[j + 1] == "*" {
                    visit[i][j] = visit[i][j+2] || first && visit[i + 1][j]
                } else {
                    visit[i][j] = first && visit[i + 1][j + 1]
                }
            }
        }
        return visit[0][0]
    }
}
```

### Description:

Given an input string (```s```) and a pattern (```p```), implement regular expression matching with support for ```'.'``` and ```'*'``` where: 

* ```'.'``` Matches any single character.​​​​
* ```'*'``` Matches zero or more of the preceding element.

The matching should cover the **entire** input string (not partial).
 

#### Example 1:
```swift
Input: s = "aa", p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
```

#### Example 2:
```swift
Input: s = "aa", p = "a*"
Output: true
Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
```

#### Example 3:
```swift
Input: s = "ab", p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".
```

#### Example 4:
```swift
Input: s = "aab", p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
```

#### Example 5:
```swift
Input: s = "mississippi", p = "mis*is*p*."
Output: false
```

#### Constraints:
```swift
0 <= s.length <= 20
0 <= p.length <= 30
s contains only lowercase English letters.
p contains only lowercase English letters, '.', and '*'.
It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.
```