import XCTest
@testable import WrappingPaperCalculator

class WrappingPaperCalculatorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(WrappingPaperCalculator().text, "Hello, World!")
    }


    static var allTests : [(String, (WrappingPaperCalculatorTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
