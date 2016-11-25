import XCTest
@testable import WrappingPaperCalculator

class WrappingPaperCalculatorTests: XCTestCase {
    func testCanExtractWidthHeightAndLengthComponents() {
      let calculator = WrappingPaperCalculator()
      do {
        let components1 = try calculator.parseComponents("2x3x4")
        let components2 = try calculator.parseComponents("1x1x10")
        XCTAssert((2, 3, 4) == components1)
        XCTAssert((1, 1, 10) == components2)
      } catch {
        XCTFail("Unexpected error")
      }
    }

    func testThrowsErrorForUnexpectedInput() {
      let calculator = WrappingPaperCalculator()
      do {
        let _ = try calculator.parseComponents("lxwxh")
        XCTFail("Expected invalidFormat error")
      } catch {}
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
