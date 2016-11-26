import XCTest
@testable import AdventCoinMiner

class AdventCoinMinerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(AdventCoinMiner().text, "Hello, World!")
    }


    static var allTests : [(String, (AdventCoinMinerTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
