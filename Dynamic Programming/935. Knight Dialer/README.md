# [935. Knight Dialer](https://leetcode.com/problems/knight-dialer)

### Solution:
```swift
class Solution {
    private let mode = 1e9 + 7 // 1000000007
    private let moves = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]
    
    func knightDialer(_ n: Int) -> Int {
        var res = 0
        let arr = Array(repeating: -1, count: 10)
        var visit = Array(repeating: arr, count: n+1)
        for i in 0..<10 {
            res = (res + helper(n, i, &visit, [Int]())) % Int(mode)
        }
        return res
    }
    private func helper(_ n: Int, _ i: Int, _ visit: inout [[Int]], _ sub: [Int]) -> Int {
        if n == 1 { return 1 }
        if visit[n][i] != -1 { return visit[n][i] }
        var sum = 0
        moves[i].forEach({
            sum = (sum + helper(n-1, $0, &visit, [i, $0])) % Int(mode)
        })
        visit[n][i] = sum
        return sum
    }
}
```

### Description

<div><p>The chess knight has a <strong>unique movement</strong>,&nbsp;it may move two squares vertically and one square horizontally, or two squares horizontally and one square vertically (with both forming the shape of an <strong>L</strong>). The possible movements of chess knight are shown in this diagaram:</p>

<p>A chess knight can move as indicated in the chess diagram below:</p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/08/18/chess.jpg" style="width: 402px; height: 402px;">
<p>We have a chess knight and a phone pad as shown below, the knight <strong>can only stand on a numeric cell</strong>&nbsp;(i.e. blue cell).</p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/08/18/phone.jpg" style="width: 242px; height: 322px;">
<p>Given an integer <code>n</code>, return how many distinct phone numbers of length <code>n</code> we can dial.</p>

<p>You are allowed to place the knight <strong>on any numeric cell</strong> initially and then you should perform <code>n - 1</code> jumps to dial a number of length <code>n</code>. All jumps should be <strong>valid</strong> knight jumps.</p>

<p>As the answer may be very large, <strong>return the answer modulo</strong> <code>10<sup>9</sup> + 7</code>.</p>

<p><strong>Example 1:</strong></p>

<pre><strong>Input:</strong> n = 1
<strong>Output:</strong> 10
<strong>Explanation:</strong> We need to dial a number of length 1, so placing the knight over any numeric cell of the 10 cells is sufficient.
</pre>

<p><strong>Example 2:</strong></p>

<pre><strong>Input:</strong> n = 2
<strong>Output:</strong> 20
<strong>Explanation:</strong> All the valid number we can dial are [04, 06, 16, 18, 27, 29, 34, 38, 40, 43, 49, 60, 61, 67, 72, 76, 81, 83, 92, 94]
</pre>

<p><strong>Example 3:</strong></p>

<pre><strong>Input:</strong> n = 3
<strong>Output:</strong> 46
</pre>

<p><strong>Example 4:</strong></p>

<pre><strong>Input:</strong> n = 4
<strong>Output:</strong> 104
</pre>

<p><strong>Example 5:</strong></p>

<pre><strong>Input:</strong> n = 3131
<strong>Output:</strong> 136006598
<strong>Explanation:</strong> Please take care of the mod.
</pre>

<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= n &lt;= 5000</code></li>
</ul>
</div>