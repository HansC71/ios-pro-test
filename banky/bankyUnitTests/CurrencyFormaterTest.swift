//
//  CurrencyFormaterTest.swift
//  bankyUnitTests
//
//  Created by Johann Csida on 24.02.23.
//

import Foundation

import XCTest

@testable import banky
class CurrencyFormatterTests: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        //XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
          XCTAssertEqual(result, "929,466.23 $")
      }

      // Challenge: You write
      func testZeroDollarsFormatted() throws {
          let result = formatter.dollarsFormatted(0.00)
          XCTAssertEqual(result, "0.00 $")
      }
    
    
}
