import XCTest
@testable import DeliveryTracker

class DeliveryTrackerTests: XCTestCase {
    func testStartsAtOriginCurrentLocation() {
      let deliveryTracker = DeliveryTracker()
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].y)
    }

    func testStartsWithAtLeastOneHouseVisited() {
      let deliveryTracker = DeliveryTracker()
      XCTAssertEqual(1, deliveryTracker.numberOfHousesVisited)
    }

    func testCanMoveNorth() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.north)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(1, deliveryTracker.currentLocations[0].y)
    }

    func testCanMoveEast() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.east)
      XCTAssertEqual(1, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].y)
    }

    func testCanMoveSouth() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.south)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(-1, deliveryTracker.currentLocations[0].y)
    }

    func testCanMoveWest() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(.west)
      XCTAssertEqual(-1, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].y)
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
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(1, deliveryTracker.currentLocations[0].y)
    }

    func testFollowsElfEastInstruction() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move(">")
      XCTAssertEqual(1, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].y)
    }

    func testFollowsElfSouthInstruction() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move("v")
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(-1, deliveryTracker.currentLocations[0].y)
    }

    func testFollowsElfWestInstruction() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move("<")
      XCTAssertEqual(-1, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].y)
    }

    func testFollowsMultipleElfInstructions() {
      let deliveryTracker = DeliveryTracker()
      deliveryTracker.move("^>v<")
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].y)
      XCTAssertEqual(4, deliveryTracker.numberOfHousesVisited)
    }

    func testCanTrackMultipleTargets() {
      let deliveryTracker = DeliveryTracker(targetCount: 2)
      XCTAssertEqual(2, deliveryTracker.currentLocations.count)
    }

    func testAllTargetsStartAtOrigin() {
      let deliveryTracker = DeliveryTracker(targetCount: 2)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].y)
      XCTAssertEqual(0, deliveryTracker.currentLocations[1].x)
      XCTAssertEqual(0, deliveryTracker.currentLocations[1].y)
    }

    func testInstructionsMoveAlternatingTargets() {
      let deliveryTracker = DeliveryTracker(targetCount: 2)
      deliveryTracker.move(.north)
      deliveryTracker.move(.south)
      XCTAssertEqual(0, deliveryTracker.currentLocations[0].x)
      XCTAssertEqual(1, deliveryTracker.currentLocations[0].y)
      XCTAssertEqual(0, deliveryTracker.currentLocations[1].x)
      XCTAssertEqual(-1, deliveryTracker.currentLocations[1].y)
      XCTAssertEqual(3, deliveryTracker.numberOfHousesVisited)
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
      ("testCanTrackMultipleTargets", testCanTrackMultipleTargets),
      ("testAllTargetsStartAtOrigin", testAllTargetsStartAtOrigin),
      ("testInstructionsMoveAlternatingTargets", testInstructionsMoveAlternatingTargets),
    ]
  }
}
#endif
