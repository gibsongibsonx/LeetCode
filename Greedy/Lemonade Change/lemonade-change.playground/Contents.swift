import Foundation

// https://leetcode.com/problems/lemonade-change/

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for bill in bills {
            switch bill {
            case 5:
                five += 1
            case 10:
                ten += 1
                if five < 1 { return false }
                five -= 1
            case 20:
                if five < 1 { return false }
                if ten < 1, five < 3 { return false }
                ten >= 1 ? (ten -= 1, five -= 1) : ((five -= 3),())
            default: break
            }
        }
        return true
    }
}
