import Foundation

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()
        
        nums.enumerated().forEach({
            let index = abs(nums[$0.offset]) - 1
            guard nums[index] > 0 else { return }
            nums[index] = -nums[index]
        })

        for i in 0..<nums.count where nums[i] > 0 {
            result.append(i+1)
        }
        return result
    }
}
