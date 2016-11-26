import XCTest
@testable import DeliveryTracker

class DeliveryTrackerTests: XCTestCase {
    func testStartsAtOriginCurrentLocation() {
      let deliveryTracker = DeliveryTracker()
      XCTAssertEqual(0, deliveryTracker.currentLocation.x)
      XCTAssertEqual(0, deliveryTracker.currentLocation.y)
    }

    func testStartsWithAtLeastOneHouseVisited() {
      let deliveryTracker = DeliveryTracker()
      XCTAssertEqual(1, deliveryTracker.numberOfHousesVisited)
    }

    func testCanMoveNorth() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.north)
      XCTAssertEqual(0, deliveryTracker.currentLocation.x)
      XCTAssertEqual(1, deliveryTracker.currentLocation.y)
    }

    func testCanMoveEast() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.east)
      XCTAssertEqual(1, deliveryTracker.currentLocation.x)
      XCTAssertEqual(0, deliveryTracker.currentLocation.y)
    }

    func testCanMoveSouth() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.south)
      XCTAssertEqual(0, deliveryTracker.currentLocation.x)
      XCTAssertEqual(-1, deliveryTracker.currentLocation.y)
    }

    func testCanMoveWest() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.west)
      XCTAssertEqual(-1, deliveryTracker.currentLocation.x)
      XCTAssertEqual(0, deliveryTracker.currentLocation.y)
    }

    func testCountsHousesVisited() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.north)
      XCTAssertEqual(2, deliveryTracker.numberOfHousesVisited)
    }

    func testCountsVisitedHousesOnlyOnce() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.north)
      deliveryTracker.move(.south)
      XCTAssertEqual(2, deliveryTracker.numberOfHousesVisited)
    }

    func testFollowsElfNorthInstruction() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move("^")
      XCTAssertEqual(0, deliveryTracker.currentLocation.x)
      XCTAssertEqual(1, deliveryTracker.currentLocation.y)
    }

    func testFollowsElfEastInstruction() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(">")
      XCTAssertEqual(1, deliveryTracker.currentLocation.x)
      XCTAssertEqual(0, deliveryTracker.currentLocation.y)
    }

    func testFollowsElfSouthInstruction() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move("v")
      XCTAssertEqual(0, deliveryTracker.currentLocation.x)
      XCTAssertEqual(-1, deliveryTracker.currentLocation.y)
    }

    func testFollowsElfWestInstruction() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move("<")
      XCTAssertEqual(-1, deliveryTracker.currentLocation.x)
      XCTAssertEqual(0, deliveryTracker.currentLocation.y)
    }

    func testFollowsMultipleElfInstructions() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move("^>v<")
      XCTAssertEqual(0, deliveryTracker.currentLocation.x)
      XCTAssertEqual(0, deliveryTracker.currentLocation.y)
      XCTAssertEqual(4, deliveryTracker.numberOfHousesVisited)
    }
}

#if os(Linux)
extension DeliveryTrackerTests {
  static var allTests : [(String, (DeliveryTrackerTests) -> () throws -> Void)] {
    return [
      ("testStartsAtOriginCurrentLocation", testStartsAtOriginCurrentLocation),
      ("testStartsWithAtLeastOneHouseVisited", testStartsWithAtLeastOneHouseVisited),
      ("testCanMoveNorth", testCanMoveNorth),
      ("testCanMoveEast", testCanMoveEast),
      ("testCanMoveSouth", testCanMoveSouth),
      ("testCanMoveWest", testCanMoveWest),
      ("testCountsHousesVisited", testCountsHousesVisited),
      ("testCountsVisitedHousesOnlyOnce", testCountsVisitedHousesOnlyOnce),
      ("testFollowsElfNorthInstruction", testFollowsElfNorthInstruction),
      ("testFollowsElfEastInstruction", testFollowsElfEastInstruction),
      ("testFollowsElfSouthInstruction", testFollowsElfSouthInstruction),
      ("testFollowsElfWestInstruction", testFollowsElfWestInstruction),
      ("testFollowsMultipleElfInstructions", testFollowsMultipleElfInstructions),
    ]
  }
}
#endif
