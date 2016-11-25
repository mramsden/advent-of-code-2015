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

  func testCanFindBasementCharacter() {
    XCTAssertEqual(1, FloorFinder().findBasementPosition(")"))
    XCTAssertEqual(5, FloorFinder().findBasementPosition("()())"))
  }
}

#if os(Linux)
extension FloorFinderTests {
  static var allTests: [(String, FloorFinderTests -> () throws -> Void)] {
    return [
      ("testCanFindUpFloor", testCanFindUpFloor),
      ("testCanFindDownFloor", testCanFindDownFloor),
      ("testCanFindFloorOnLongSpecification", testCanFindFloorOnLongSpecification),
      ("testCanFindBasementCharacter", testCanFindBasementCharacter),
    ]
  }
}
#endif
