### [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

You are given an array of integers ```nums```, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

**Return the max sliding window.**

#### Example 1:
```swift
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
```

#### Example 2:
```swift
Input: nums = [1], k = 1
Output: [1]
```

#### Example 3:
```swift
Input: nums = [1,-1], k = 1
Output: [1,-1]
```

#### Example 4:
```swift
Input: nums = [9,11], k = 2
Output: [11]
```

#### Example 5:
```swift
Input: nums = [4,-2], k = 2
Output: [4]
```

#### Constraints:
```swift
1 <= nums.length <= 105
-104 <= nums[i] <= 104
1 <= k <= nums.length
```

### Solution

```swift
import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.isEmpty == false else { return [] }
        
        var left = [Int]()
        var right = [Int]()
        
        for i in 0..<nums.count {
            while (left.count > 0) && (nums[left.last!] < nums[i]) {
                left.removeLast()
            }
            left.append(i)
            
            if i >= k - 1 {
                if left.first! + k == i { left.removeFirst() }
                right.append(nums[left.first!])
            }
        }
        return right
    }
}

func tests() {
    let s = Solution()
    assert(s.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3) == [3,3,5,5,6,7])
    assert(s.maxSlidingWindow([1], 1) == [1])
    assert(s.maxSlidingWindow([1,-1], 1) == [1,-1])
    assert(s.maxSlidingWindow([9,11], 2) == [11])
    assert(s.maxSlidingWindow([4,-2], 2) == [4])
}

tests()
```

**[LeetCode Discuss](https://leetcode.com/problems/sliding-window-maximum/discuss/1122916/swift-sliding-window-maximum)**
