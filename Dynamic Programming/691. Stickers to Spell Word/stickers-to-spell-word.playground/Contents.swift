import Foundation

// https://leetcode.com/problems/stickers-to-spell-word

class Solution {
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        let n = stickers.count, alph = ("a"..."z").array!
        let map = [Int](repeating: 0, count: alph.count)
        var freq = [[Int]](repeating: map, count: n)
        var memo = [String:Int]()
        memo[""] = 0
        for i in 0..<n {
            for char in stickers[i] {
                freq[i][char.ascii - 97] += 1
            }
        }
        return helper(&freq, target, &memo)
    }
    
    private func helper(_ freq: inout [[Int]], _ target: String,_ memo: inout [String:Int]) -> Int {
        if let num = memo[target] { return num }
        var res = Int.max, cnt = [Int](repeating:0, count: 26)
        target.forEach({ cnt[$0.ascii - 97] += 1 })
        for i in 0..<freq.count {
            if freq[i][target[0].ascii - 97] == 0 { continue }
            var t = ""
            for j in 0..<26 {
                if cnt[j] - freq[i][j] > 0 {
                    for _ in 0..<(cnt[j] - freq[i][j]) {
                        t.append((97 + j).ASCII)
                    }
                    
                }
            }
            let ans = helper(&freq, t, &memo)
            if ans != -1 {res = min(res, ans + 1)}
        }
        memo[target, default:0] = (res == Int.max) ? -1 : res
        return memo[target,default:0]
    }
}

extension String {
    subscript (_ i: Int) -> Character {
        get { return self[index(startIndex, offsetBy: i)] }
    }
}

extension Character {
    var ascii: Int {
        get { return Int(unicodeScalars.first?.value ?? 0) }
    }
}

extension Int {
    var ASCII: Character {
        get { return Character(UnicodeScalar(self)!) }
    }
}

extension ClosedRange where Bound == UnicodeScalar {
    func toArray() -> [UnicodeScalar] {
        (lowerBound.value...upperBound.value).compactMap { UnicodeScalar($0) }
    }
}

extension ClosedRange where Bound == String {
    private func toArray() -> [UnicodeScalar]? {
        guard let lower = lowerBound.first?.unicodeScalars.first,
              let upper = upperBound.first?.unicodeScalars.first else { return nil }
        return (lower...upper).toArray()
    }
    var array: [UnicodeScalar]? { self.toArray() }
}

// MARK: Tests

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.505 (0.507) seconds
class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        let res = s.minStickers(["with","example","science"], "thehat")
        XCTAssertEqual(res, 3)
    }
    func testExample2() {
        let res = s.minStickers(["notice","possible"], "basicbasic")
        XCTAssertEqual(res, -1)
    }
}

Tests.defaultTestSuite.run()
