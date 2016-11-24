import XCTest
@testable import FloorFinder

class FloorFinderTests: XCTestCase {
  func testCanCreateFloorFinder() {
    let floorFinder = FloorFinder()
  }
}

#if os(Linux)
extension FloorFinderTests {
  static var allTests: [(String, FloorFinderTests -> () throws -> Void)] {
    return [
      ("testCanCreateFloorFinder", testCanCreateFloorFinder),
    ]
  }
}
#endif
