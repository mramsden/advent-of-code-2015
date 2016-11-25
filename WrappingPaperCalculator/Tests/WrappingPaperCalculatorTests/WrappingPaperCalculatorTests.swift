import XCTest
@testable import WrappingPaperCalculator

class WrappingPaperCalculatorTests: XCTestCase {
    func testCanExtractWidthHeightAndLengthComponents() {
      let calculator = WrappingPaperCalculator()
      do {
        XCTAssert((2, 3, 4) == (try calculator.parseComponents("2x3x4")))
        XCTAssert((1, 1, 10) == (try calculator.parseComponents("1x1x10")))
      } catch let error {
        XCTFail("Unexpected error \(error)")
      }
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
