import XCTest
@testable import FloorFinder

class FloorFinderTests: XCTestCase {
  func testCanFindUpFloor() {
    let finder = FloorFinder()
    XCTAssertEqual(1, finder.findFloor("("))
  }

  func testCanFindDownFloor() {
    let finder = FloorFinder()
    XCTAssertEqual(-1, finder.findFloor(")"))
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
