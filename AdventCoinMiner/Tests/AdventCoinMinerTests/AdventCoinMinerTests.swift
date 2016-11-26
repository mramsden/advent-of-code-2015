import XCTest
@testable import AdventCoinMiner

class AdventCoinMinerTests: XCTestCase {
  func testCanProvideDifferentHashPadding() {
    let miner = AdventCoinMiner(key: "abcdef", hashPadding: "0")
    XCTAssertEqual(31, miner.lowestPositiveNumber)
  }

  func testCanFindLowestPositiveNumberForAKey() {
    let miner = AdventCoinMiner(key: "abcdef")
    XCTAssertEqual(609043, miner.lowestPositiveNumber)
  }

  func testCanFindLowestPositiveNumberForAnotherKey() {
    let miner = AdventCoinMiner(key: "pqrstuv")
    XCTAssertEqual(1048970, miner.lowestPositiveNumber)
  }
}

#if os(Linux)
extension AdventCoinMinerTests {
  static var allTests : [(String, (AdventCoinMinerTests) -> () throws -> Void)] {
    return [
      ("testCanProvideDifferentHashPadding", testCanProvideDifferentHashPadding),
      ("testCanFindLowestPositiveNumberForAKey", testCanFindLowestPositiveNumberForAKey),
      ("testCanFindLowestPositiveNumberForAnotherKey", testCanFindLowestPositiveNumberForAnotherKey),
    ]
  }
}
#endif
