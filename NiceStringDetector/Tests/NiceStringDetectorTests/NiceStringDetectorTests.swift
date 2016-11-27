import XCTest
@testable import NiceStringDetector

class NiceStringDetectorTests: XCTestCase {
  var detector: NiceStringDetector!

  override func setUp() {
    super.setUp()
    detector = NiceStringDetector()
  }

  func testThreeOrMoreVowelsIsNice() {
    XCTAssertTrue(detector.isNice(string: "nicce string"))
  }

  func testTwoOrFewerVowelsIsNotNice() {
    XCTAssertFalse(detector.isNice(string: "nicce"))
  }

  func testRepeatedLettersIsNice() {
    XCTAssertTrue(detector.isNice(string: "nicce string"))
  }

  func testNoRepeatedLettersIsNotNice() {
    XCTAssertFalse(detector.isNice(string: "nice string"))
  }

  func testBadPairIsNotNice() {
    XCTAssertFalse(detector.isNice(string: "nicce stringab"))
  }
}

#if os(Linux)
extension NiceStringDetectorTests {
  static var allTests : [(String, (NiceStringDetectorTests) -> () throws -> Void)] {
    return [
      ("testThreeOrMoreVowelsIsNice", testThreeOrMoreVowelsIsNice),
      ("testTwoOrFewerVowelsIsNotNice", testTwoOrFewerVowelsIsNotNice),
      ("testRepeatedLettersIsNice", testRepeatedLettersIsNice),
      ("testNoRepeatedLettersIsNotNice", testNoRepeatedLettersIsNotNice),
    ]
  }
}
#endif
