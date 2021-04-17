import Foundation

// https://leetcode.com/problems/divide-two-integers/

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let positive = (dividend < 0) == (divisor < 0)
        var _dividend = Int64(abs(dividend))
        let _divisor = Int64(abs(divisor))
        
        var count = 0, t = 1, divisor = _divisor
        
        while divisor < _dividend {
            divisor = divisor << 1
            t = t << 1
        }
        
        while divisor > 0, divisor > _divisor {
            while divisor > _dividend {
                divisor = divisor >> 1
                t = t >> 1
            }
            _dividend -= divisor
            count += t
        }
        if _dividend == _divisor { count += 1 }
        return positive ? min(count, Int(Int32.max)) : max(-count, Int(Int32.min))
    }
}
