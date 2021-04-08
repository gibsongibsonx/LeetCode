import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let matrix: [Character:[Character]] = ["2":Array<Character>("abc"),
                                               "3":Array<Character>("def"),
                                               "4":Array<Character>("ghi"),
                                               "5":Array<Character>("jkl"),
                                               "6":Array<Character>("mno"),
                                               "7":Array<Character>("pqrs"),
                                               "8":Array<Character>("tuv"),
                                               "9":Array<Character>("wxyz")]
        var res = [String](), digs = digits.map({Character($0.lowercased())})
        for num in digs {
            let chars = matrix[num]!
            if res.isEmpty {
                chars.forEach({ res.append("\($0)") })
                continue
            }
            let cur = res; res = [String]()
            chars.forEach({ ch in
                let externStr = cur.map { (str) -> String in
                    str + "\(ch)"
                }
                res.append(contentsOf: externStr)
            })
        }
        return res
    }
}
