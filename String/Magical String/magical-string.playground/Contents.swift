import Foundation

// https://leetcode.com/problems/magical-string

class Solution {
    func magicalString(_ n: Int) -> Int {
        if n == 0 { return 0 }
        var queue = [1, 2, 2], i = 2
        while queue.count < n {
            let add = queue.last == 1 ? 2 : 1
            if queue[i] == 1 {
                queue.append(add)
            } else {
                queue.append(add)
                queue.append(add)
            }
            i += 1
        }
        if queue.count > n { queue.removeLast() }
        return queue.reduce(0, { $1 == 1 ? $0 + 1 : $0 })
    }
}

import XCTest

//      Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        XCTAssertEqual(s.magicalString(6), 3)
    }
    func test2() {
        XCTAssertEqual(s.magicalString(3), 1)
    }
}

Tests.defaultTestSuite.run()
