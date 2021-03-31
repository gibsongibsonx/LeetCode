# [9. Palindrome Number](https://leetcode.com/problems/palindrome-number/)

Given an integer ```x```, return ```true``` if ```x``` is palindrome integer.

An integer is a **palindrome** when it reads the same backward as forward. For example, ```121``` is palindrome while ```123``` is not.

#### Example 1:
```swift
Input: x = 121
Output: true
```

#### Example 2:
```swift
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
```

#### Example 3:
```swift
Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

#### Example 4:
```swift
Input: x = -101
Output: false
``` 

#### Constraints:
```swift
-231 <= x <= 231 - 1
```

#### Solution:
```swift
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
```