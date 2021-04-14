import Foundation

// https://leetcode.com/problems/goal-parser-interpretation/

class Solution {
    func interpret(_ command: String) -> String {
        if !(1...100).contains(command.count) { return "" }
        let o = command.replacingOccurrences(of: "()", with: "o")
        return o.replacingOccurrences(of: "(al)", with: "al")
    }
}
