import XCTest
@testable import WrappingPaperCalculator

class WrappingPaperCalculatorTests: XCTestCase {
    func testCanCreateWrappingPaperCalculator() {
      let calculator = WrappingPaperCalculator()
    }
}

#if os(Linux)
extension WrappingPaperCalculatorTests {
  static var allTests : [(String, (WrappingPaperCalculatorTests) -> () throws -> Void)] {
      return [
          ("testCanCreateWrappingPaperCalculator", testCanCreateWrappingPaperCalculator),
      ]
  }
}
#endif
