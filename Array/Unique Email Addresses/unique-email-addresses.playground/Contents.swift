import Foundation

// 929. Unique Email Addresses
// https://leetcode.com/problems/unique-email-addresses/

class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        func validateEmail(_ candidate: String) -> String {
            let comp = candidate.split(separator: "@"), local = comp[0], domain = comp[1]
            let result = "\(local[local.startIndex..<(local.firstIndex(of: "+") ?? local.endIndex)])"
            return result.replacingOccurrences(of: ".", with: "") + "@" + domain
        }
        return Set(emails.compactMap{validateEmail($0)}).count
    }
}
