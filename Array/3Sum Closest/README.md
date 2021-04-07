# [16. 3Sum Closest](https://leetcode.com/problems/3sum-closest/)

### Solution:
```swift
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums
        nums.sort()
        var diff = Int.max, res = 0
        for i in 0..<nums.count - 2 {
            var n = i + 1, q = nums.count - 1
            while n < q {
                let sum = nums[i] + nums[n] + nums[q]
                sum > target ? q -= 1 : (n += 1)
                if abs(sum - target) < diff {
                    diff = abs(sum - target)
                    res = sum
                }
            }
        }
        return res
    }
}
```

### Description:

Given an array ```nums``` of **n** integers and an integer ```target```, find three integers in ```nums``` such that the sum is closest to ```target```. Return the sum of the three integers. You may assume that each input would have exactly one solution.

#### Example 1:
```swift
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

#### Constraints:
* ```3 <= nums.length <= 10^3```
* ```-10^3 <= nums[i] <= 10^3```
* ```-10^4 <= target <= 10^4```
