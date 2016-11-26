import XCTest
@testable import AdventCoinMiner

class AdventCoinMinerTests: XCTestCase {
    func testCanFindLowestPositiveNumberForAKey() {
      let miner = AdventCoinMiner(key: "abcdef")
      XCTAssertEqual(609043, miner.lowestPositiveNumber)
    }
}

#if os(Linux)
extension AdventCoinMinerTests {
  static var allTests : [(String, (AdventCoinMinerTests) -> () throws -> Void)] {
    return [
      ("testCanFindLowestPositiveNumberForAKey", testCanFindLowestPositiveNumberForAKey),
    ]
  }
}
#endif
