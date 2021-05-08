import Foundation

// https://leetcode.com/problems/concatenated-words

class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        guard words.count > 2 else { return [] }
        
        var res = [String](), map = [Int:Set<String>]()
        
        words.forEach({
            if !$0.isEmpty {
                if map[$0.count] == nil { map[$0.count] = [] }
                map[$0.count]?.insert($0)
            }
        })
        
        let minWordKeys = map.keys.min()!, maxWordKeys = map.keys.max()!
        let targetLength = minWordKeys << 1
        
        func dfs(_ totalCount: Int, word: [Character]) -> Bool {
            guard word.count >= minWordKeys else { return false }
            if word.count >= minWordKeys && word.count <= maxWordKeys {
                if let strs = map[word.count] {
                    if strs.contains(String(word)) && totalCount != 0 {
                        return true
                    }
                }
            }
            guard word.count >= targetLength else { return false }
            
            var length = minWordKeys
            while length <= min(maxWordKeys, word.count) {
                if word.count - length < minWordKeys { break }
                let left = String(word[0..<length])
                if let strs = map[length], strs.contains(left) {
                    var temp = word
                    temp.removeFirst(length)
                    if dfs(totalCount + 1, word: temp) { return true }
                }
                length += 1
            }
            return false
        }
        
        for index in 0..<words.count {
            if words[index].count >= targetLength && dfs(0, word: [Character](words[index])) {
                res.append(words[index])
            }
        }
        return res
    }
}

// MARK: - Tests

import XCTest

//      Executed 2 tests, with 0 failures (0 unexpected) in 0.619 (0.621) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
        XCTAssertEqual(s.findAllConcatenatedWordsInADict(words), ["catsdogcats","dogcatsdog","ratcatdogcat"])
    }
    func test2() {
        let words = ["cat","dog","catdog"]
        XCTAssertEqual(s.findAllConcatenatedWordsInADict(words), ["catdog"])
    }
}

Tests.defaultTestSuite.run()
