import XCTest
@testable import WrappingPaperCalculator

class WrappingPaperCalculatorTests: XCTestCase {
    func testCanExtractWidthHeightAndLengthComponents() {
      XCTAssert((2, 3, 4) == WrappingPaperCalculator().parseComponents("2x3x4"))
      XCTAssert((1, 1, 10) == WrappingPaperCalculator().parseComponents("1x1x10"))
    }
}

#if os(Linux)
extension WrappingPaperCalculatorTests {
  static var allTests : [(String, (WrappingPaperCalculatorTests) -> () throws -> Void)] {
      return [
          ("testCanExtractWidthHeightAndLengthComponents", testCanExtractWidthHeightAndLengthComponents),
      ]
  }
}
#endif
