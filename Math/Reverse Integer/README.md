# [7. Reverse Integer](https://leetcode.com/problems/reverse-integer/)

### Solution:
```swift
class Solution {
    func reverse(_ x: Int) -> Int {
        var r = 0, x = x
        while x != 0 {
            r = r * 10
            r = r + x % 10
            x /= 10
        }
        if r < Int32.min || r > Int32.max { return 0 }
        return r
    }
}
```

### Description:

Given a signed 32-bit integer ```x```, return x with its digits reversed. If reversing ```x``` causes the value to go outside the signed 32-bit integer range ```[-231, 231 - 1]```, then return ```0```.

**Assume the environment does not allow you to store 64-bit integers (signed or unsigned).**

#### Example 1:
```swift
Input: x = 123
Output: 321
```

#### Example 2:
```swift
Input: x = -123
Output: -321
```

#### Example 3:
```swift
Input: x = 120
Output: 21
```

#### Example 4:
```swift
Input: x = 0
Output: 0
```

#### Constraints:
```swift
-231 <= x <= 231 - 1
```