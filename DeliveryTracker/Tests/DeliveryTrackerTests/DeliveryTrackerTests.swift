import XCTest
@testable import DeliveryTracker

class DeliveryTrackerTests: XCTestCase {
    func testCanCreateDeliveryTracker() {
        let _ = DeliveryTracker()
    }
}

#if os(Linux)
extension DeliveryTrackerTests {
  static var allTests : [(String, (DeliveryTrackerTests) -> () throws -> Void)] {
      return [
          ("testCanCreateDeliveryTracker", testCanCreateDeliveryTracker),
      ]
  }
}
#endif
