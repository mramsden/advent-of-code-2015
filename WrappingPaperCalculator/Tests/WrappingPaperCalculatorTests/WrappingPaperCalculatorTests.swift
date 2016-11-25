import XCTest
@testable import WrappingPaperCalculator

class WrappingPaperCalculatorTests: XCTestCase {
    func testCalculatesWrappingPaperAreaRequired() {
      let calculator = WrappingPaperCalculator()
      let areaRequired1 = calculator.areaRequired(2, 3, 4)
      let areaRequired2 = calculator.areaRequired(1, 1, 10)
      XCTAssertEqual(58, areaRequired1)
      XCTAssertEqual(43, areaRequired2)
    }

    func testCalculatesWrappingPaperAreaRequiredFromString() {
      let calculator = WrappingPaperCalculator()
      do {
        let areaRequired1 = try calculator.areaRequired(specification: "2x3x4")
        let areaRequired2 = try calculator.areaRequired(specification: "1x1x10")
        XCTAssertEqual(58, areaRequired1)
        XCTAssertEqual(43, areaRequired2)
      } catch {
        XCTFail("Unexpected error")
      }
    }

    func testThrowsErrorForUnexpectedInput() {
      let calculator = WrappingPaperCalculator()
      do {
        let _ = try calculator.areaRequired(specification: "lxwxh")
        XCTFail("Expected invalidFormat error")
      } catch {}
    }

    func testCalculatesRibbonRequired() {
      let calculator = WrappingPaperCalculator()
      let ribbonRequired1 = calculator.ribbonRequired(2, 3, 4)
      XCTAssertEqual(34, ribbonRequired1)
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
