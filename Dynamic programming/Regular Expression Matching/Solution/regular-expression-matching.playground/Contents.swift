import Foundation

// https://leetcode.com/problems/regular-expression-matching/

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var visit = [[Bool]]()
        for _ in 0...s.count + 1 {
            visit.append(Array(repeating: false, count: p.count + 1))
        }
        visit[s.count][p.count] = true
        for i in stride(from: s.count, through: 0, by: -1) {
            for j in stride(from: p.count - 1, through: 0, by: -1) {
                let ars = Array(s), arp = Array(p)
                let first = i < s.count && (ars[i] == arp[j] || arp[j] == ".")
                if j + 1 < p.count && arp[j + 1] == "*" {
                    visit[i][j] = visit[i][j+2] || first && visit[i + 1][j]
                } else {
                    visit[i][j] = first && visit[i + 1][j + 1]
                }
            }
        }
        return visit[0][0]
    }
}
