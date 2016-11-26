import XCTest
@testable import DeliveryTracker

class DeliveryTrackerTests: XCTestCase {
    func testStartsAtOriginCurrentLocation() {
      let deliveryTracker = DeliveryTracker()
      XCTAssertEqual(0, deliveryTracker.currentLocation.x)
      XCTAssertEqual(0, deliveryTracker.currentLocation.y)
    }
}

#if os(Linux)
extension DeliveryTrackerTests {
  static var allTests : [(String, (DeliveryTrackerTests) -> () throws -> Void)] {
    return [
      ("testStartsAtOriginCurrentLocation", testStartsAtOriginCurrentLocation),
    ]
  }
}
#endif
