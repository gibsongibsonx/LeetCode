import Foundation

class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for i in 0..<(nums.count/2) {
            for _ in 1...nums[2*i] { res.append(nums[2*i+1]) }
        }
        return res
    }
}
