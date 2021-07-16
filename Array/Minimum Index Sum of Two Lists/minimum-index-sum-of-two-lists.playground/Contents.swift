import Foundation

// 599. Minimum Index Sum of Two Lists
// https://leetcode.com/problems/minimum-index-sum-of-two-lists/

class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var maxInd = Int.max, result: [String] = [], map = [String:Int]()
        list1.enumerated().forEach { map[$1] = $0 }
        
        for (index, str) in list2.enumerated() where map[str] != nil {
            let sum = index + map[str]!
            if maxInd == sum {
                result.append(str)
            } else if maxInd > sum {
                maxInd = sum
                result = [str]
            }
        }
        return result
    }
}
