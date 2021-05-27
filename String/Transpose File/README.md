# [194. Transpose File](https://leetcode.com/problems/transpose-file)

### Solution:
```bash
awk '{
    for (i = 1; i <= NF; i++) {
        if (NR == 1) {
            s[i] = $i
        } else {
            s[i] = s[i] " " $i
        }
    }
} END {
    for (i = 1; s[i] != ""; i++) {
        print s[i]
    }
}' file.txt
```

### Description:

<div><p>Given a text file <code>file.txt</code>, transpose its content.</p>

<p>You may assume that each row has the same number of columns, and each field is separated by the <code>' '</code> character.</p>

<p><strong>Example:</strong></p>

<p>If <code>file.txt</code> has the following content:</p>

<pre>name age
alice 21
ryan 30
</pre>

<p>Output the following:</p>

<pre>name alice ryan
age 21 30
</pre>
</div>