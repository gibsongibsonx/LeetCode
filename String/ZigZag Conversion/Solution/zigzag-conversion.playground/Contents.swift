import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var lines = [[Character]](repeating: [], count: numRows)
        var i = 0, flag = false
        s.forEach({
            lines[i].append($0)
            if flag {
                i -= 1
                if i == -1 { flag = false; i += 2 }
            } else {
                i += 1
                if i == numRows { flag = true; i -= 2 }
            }
        })
        return lines.map { String($0) }.joined()
    }
}
