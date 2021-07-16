import Foundation

// 118. Pascal's Triangle
// https://leetcode.com/problems/pascals-triangle/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        guard numRows > 0 else { return result }
        for i in 1...numRows {
            switch i <= 2 {
            case true:
                result.append(Array<Int>(repeating: 1, count: i))
            default:
                var row = Array<Int>(repeating: 1, count: i)
                let lastRow = result.last!
                for k in 1...i/2 {
                    row[k] = lastRow[k-1] + lastRow[k]
                    row[i - k - 1] = row[k]
                }
                result.append(row)
            }
        }
        return result
    }
}
