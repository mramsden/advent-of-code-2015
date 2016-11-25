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

    func testCalculatesWrappingPaperAreaRequired() {
      let calculator = WrappingPaperCalculator()
      do {
        let areaRequired1 = try calculator.areaRequired("2x3x4")
        let areaRequired2 = try calculator.areaRequired("1x1x10")
        XCTAssertEqual(52, areaRequired1)
        XCTAssertEqual(42, areaRequired2)
      } catch {
        XCTFail("Unexpected error")
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
