import Foundation

// 60. Permutation Sequence
// https://leetcode.com/problems/permutation-sequence/

// Runtime: 4 ms

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var numbers = [Int](1...n)
        var k = k, factorial = 1, div = n - 1, result = ""
        
        for i in 1..<n { factorial *= i }
        
        for _ in 0..<n {
            for (i, num) in numbers.enumerated() {
                if k > factorial {
                    k -= factorial
                } else {
                    result += "\(num)"
                    numbers.remove(at: i)
                    break
                }
            }
            if div > 1 {
                factorial /= div
                div -= 1
            }
        }
        return result
    }
}
