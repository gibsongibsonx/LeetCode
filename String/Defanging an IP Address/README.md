# [1108. Defanging an IP Address](https://leetcode.com/problems/defanging-an-ip-address/)

### Solution:
```swift
class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.components(separatedBy: ".").joined(separator: "[.]")
    }
}
```

### Description:

<div><p>Given a valid (IPv4) IP <code>address</code>, return a defanged version of that IP address.</p>

<p>A <em>defanged&nbsp;IP address</em>&nbsp;replaces every period <code>"."</code> with <code>"[.]"</code>.</p>


<p><strong>Example 1:</strong></p>
<pre><strong>Input:</strong> address = "1.1.1.1"
<strong>Output:</strong> "1[.]1[.]1[.]1"
</pre><p><strong>Example 2:</strong></p>
<pre><strong>Input:</strong> address = "255.100.50.0"
<strong>Output:</strong> "255[.]100[.]50[.]0"
</pre>

<p><strong>Constraints:</strong></p>

<ul>
	<li>The given <code>address</code> is a valid IPv4 address.</li>
</ul></div>