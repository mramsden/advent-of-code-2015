import XCTest
@testable import NiceStringDetector

class NiceStringDetectorTests: XCTestCase {
  var detector: NiceStringDetector!

  override func setUp() {
    super.setUp()
    detector = NiceStringDetector()
  }

  func testStringWithThreeOrMoreVowelsIsNice() {
    XCTAssertTrue(detector.isNice(string: "nicce string"))
  }

  func testStringWithTwoOrFewerVowelsIsNotNice() {
    XCTAssertFalse(detector.isNice(string: "nicce"))
  }

  func testStringWithRepeatedLettersIsNice() {
    XCTAssertTrue(detector.isNice(string: "nicce string"))
  }

  func testStringWithoutRepeatedLettersIsNotNice() {
    XCTAssertFalse(detector.isNice(string: "nice string"))
  }
}

#if os(Linux)
extension NiceStringDetectorTests {
  static var allTests : [(String, (NiceStringDetectorTests) -> () throws -> Void)] {
    return [
      ("testStringWithThreeOrMoreVowelsIsNice", testStringWithThreeOrMoreVowelsIsNice),
      ("testStringWithTwoOrFewerVowelsIsNotNice", testStringWithTwoOrFewerVowelsIsNotNice),
      ("testStringWithRepeatedLettersIsNice", testStringWithRepeatedLettersIsNice),
      ("testStringWithoutRepeatedLettersIsNotNice", testStringWithoutRepeatedLettersIsNotNice),
    ]
  }
}
#endif
