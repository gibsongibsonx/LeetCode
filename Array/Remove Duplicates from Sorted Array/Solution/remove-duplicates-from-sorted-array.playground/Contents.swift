import Foundation

// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result: [Int: Int] = [:]
        nums.map { result[$0] = $0 }
        nums = result.map { $0.key }.sorted{ $1 > $0}
        return nums.count
    }
}
