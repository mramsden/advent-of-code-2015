import XCTest
@testable import NiceStringDetector

class NiceStringDetectorTests: XCTestCase {
  var detector: NiceStringDetector!

  override func setUp() {
    super.setUp()
    detector = NiceStringDetector()
  }

  func testStringWithThreeOrMoreVowelsIsNice() {
    XCTAssertTrue(detector.isNice(string: "nice string"))
  }

  func testStringWithTwoOrFewerVowelsIsNotNice() {
    XCTAssertFalse(detector.isNice(string: "nice"))
  }
}

#if os(Linux)
extension NiceStringDetectorTests {
  static var allTests : [(String, (NiceStringDetectorTests) -> () throws -> Void)] {
    return [
      ("testStringWithThreeOrMoreVowelsIsNice", testStringWithThreeOrMoreVowelsIsNice),
      ("testStringWithTwoOrFewerVowelsIsNotNice", testStringWithTwoOrFewerVowelsIsNotNice),
    ]
  }
}
#endif
