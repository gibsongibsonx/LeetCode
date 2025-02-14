# [220. Contains Duplicate III](https://leetcode.com/problems/contains-duplicate-iii/)

### Solution:
```swift
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k > 0, nums.count > 1 else { return false }
        let range = 0 ..< nums.count, ids = [Int](range).sorted{ nums[$0] < nums[$1] }
        
        for i in range {
            for j in (i + 1) ..< nums.count {
                if (nums[ids[j]] - nums[ids[i]]) > t { break }
                if abs(ids[j] - ids[i]) <= k { return true }
            }
        }
        return false
    }
}
```

### Description:

<div><p>Given an integer array <code>nums</code> and two integers <code>k</code> and <code>t</code>, return <code>true</code> if there are <strong>two distinct indices</strong> <code>i</code> and <code>j</code> in the array such that <code>abs(nums[i] - nums[j]) &lt;= t</code> and <code>abs(i - j) &lt;= k</code>.</p>

<p><strong>Example 1:</strong></p>
<pre><strong>Input:</strong> nums = [1,2,3,1], k = 3, t = 0
<strong>Output:</strong> true
</pre><p><strong>Example 2:</strong></p>
<pre><strong>Input:</strong> nums = [1,0,1,1], k = 1, t = 2
<strong>Output:</strong> true
</pre><p><strong>Example 3:</strong></p>
<pre><strong>Input:</strong> nums = [1,5,9,1,5,9], k = 2, t = 3
<strong>Output:</strong> false
</pre>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>0 &lt;= nums.length &lt;= 2 * 10<sup>4</sup></code></li>
	<li><code>-2<sup>31</sup> &lt;= nums[i] &lt;= 2<sup>31</sup> - 1</code></li>
	<li><code>0 &lt;= k &lt;= 10<sup>4</sup></code></li>
	<li><code>0 &lt;= t &lt;= 2<sup>31</sup> - 1</code></li>
</ul>
</div>