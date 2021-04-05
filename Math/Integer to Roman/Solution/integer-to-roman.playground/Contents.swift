import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String {
        let decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        
        var result = "", number = num
        
        while number > 0 {
            for (i, d) in decimals.enumerated() {
                if number - d >= 0 {
                    number -= d
                    result += numerals[i]
                    break
                }
            }
        }
        return result
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.033 (0.035) seconds

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func testExample1() { XCTAssert(s.intToRoman(3) == "III") } // success
    
    func testExample2() { XCTAssert(s.intToRoman(4) == "IV") } // success
    
    func testExample3() { XCTAssert(s.intToRoman(9) == "IX") } // success
    
    func testExample4() { XCTAssert(s.intToRoman(58) == "LVIII") } // success
    
    func testExample5() { XCTAssert(s.intToRoman(1994) == "MCMXCIV") } // success
    
}

Tests.defaultTestSuite.run()
