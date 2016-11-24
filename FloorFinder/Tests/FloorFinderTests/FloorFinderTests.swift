import XCTest
@testable import FloorFinder

class FloorFinderTests: XCTestCase {
  func testCanFindUpFloor() {
    XCTAssertEqual(1, FloorFinder().findFloor("("))
  }

  func testCanFindDownFloor() {
    XCTAssertEqual(-1, FloorFinder().findFloor(")"))
  }

  func testCanFindFloorOnLongSpecification() {
    XCTAssertEqual(2, FloorFinder().findFloor("(()()("))
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
