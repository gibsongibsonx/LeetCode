import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String {
        let decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        
        var result = "", number = num

        while number > 0 {
            for (i, d) in decimals.enumerated() {
                if number - d >= 0 {
                    number -= d
                    result += numerals[i]
                    break
                }
            }
        }
        return result
    }
}
