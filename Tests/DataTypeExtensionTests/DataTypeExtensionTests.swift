import XCTest
@testable import DataTypeExtension

final class DataTypeExtensionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DataTypeExtension().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
