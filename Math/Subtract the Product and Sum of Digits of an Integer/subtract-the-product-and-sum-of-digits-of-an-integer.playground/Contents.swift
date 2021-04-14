import Foundation

// https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/

class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        if 1 <= n && n <= 10^5 { return 0 }
        var cp = n, products = [Int]()
        while cp > 0 {
            products.insert(cp % 10, at: 0)
            cp /= 10
        }
        let product = products.reduce(1, *)
        let sum = products.reduce(0, +)
        return product - sum
    }
}
