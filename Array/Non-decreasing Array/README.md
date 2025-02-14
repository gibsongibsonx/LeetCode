# [665. Non-decreasing Array](https://leetcode.com/problems/non-decreasing-array/)

### Solution:
```swift
class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return true }
        var modify = 0, n = nums.count - 1
        while n != 0 {
            if nums[n] < nums[n-1] {
                modify += 1
                if n > 1,
                   n < nums.count - 1,
                   nums[n+1] < nums[n-1],
                   nums[n-2] > nums[n] { return false }
            }
            if modify > 1 { return false }
            n -= 1
        }
        return true
    }
}
```

### Description:

<div><p>Given an array <code>nums</code> with <code>n</code> integers, your task is to check if it could become non-decreasing by modifying <strong>at most one element</strong>.</p>

<p>We define an array is non-decreasing if <code>nums[i] &lt;= nums[i + 1]</code> holds for every <code>i</code> (<strong>0-based</strong>) such that (<code>0 &lt;= i &lt;= n - 2</code>).</p>

<p>&nbsp;</p>
<p><strong>Example 1:</strong></p>

<pre><strong>Input:</strong> nums = [4,2,3]
<strong>Output:</strong> true
<strong>Explanation:</strong> You could modify the first <code>4</code> to <code>1</code> to get a non-decreasing array.
</pre>

<p><strong>Example 2:</strong></p>

<pre><strong>Input:</strong> nums = [4,2,1]
<strong>Output:</strong> false
<strong>Explanation:</strong> You can't get a non-decreasing array by modify at most one element.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == nums.length</code></li>
	<li><code>1 &lt;= n &lt;= 10<sup>4</sup></code></li>
	<li><code>-10<sup>5</sup> &lt;= nums[i] &lt;= 10<sup>5</sup></code></li>
</ul>
</div>