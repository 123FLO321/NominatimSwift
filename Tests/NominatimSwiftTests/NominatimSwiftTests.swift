import XCTest
@testable import NominatimSwift

final class NominatimSwiftTests: XCTestCase {

    let nominatim = Nominatim()

    func testReverseInnsbruckHofgarten() {
        let semaphore = DispatchSemaphore(value: 0)
        nominatim.reverse(
            params: ReverseParams(
                query: .coordinate(latitude: 47.271510, longitude: 11.397600),
                acceptLanguage: "de"
            )
        ) { (result, error) in
            XCTAssertNil(error, "Found error: \(error!)")
            guard let result = result else {
                XCTFail("Reverse result is nil!")
                semaphore.signal()
                return
            }
            XCTAssertEqual(result.name ?? "", "Musikpavillon")
            XCTAssertEqual(result.address.city, "Innsbruck")
            XCTAssertEqual(result.address.state, "Tirol")
            XCTAssertEqual(result.address.postcode, "6020")
            XCTAssertEqual(result.address.country, "Österreich")
            semaphore.signal()
        }
        semaphore.wait()
    }

    func testReverseInnsbruckHauptbahnhof() {
        let semaphore = DispatchSemaphore(value: 0)
        nominatim.reverse(
            params: ReverseParams(
                query: .coordinate(latitude: 47.263208, longitude: 11.400494),
                acceptLanguage: "de"
            )
        ) { (result, error) in
            XCTAssertNil(error, "Found error: \(error!)")
            guard let result = result else {
                XCTFail("Reverse result is nil!")
                semaphore.signal()
                return
            }
            XCTAssertEqual(result.name ?? "", "Hauptbahnhof")
            XCTAssertEqual(result.address.city, "Innsbruck")
            XCTAssertEqual(result.address.state, "Tirol")
            XCTAssertEqual(result.address.postcode, "6020")
            XCTAssertEqual(result.address.country, "Österreich")
            XCTAssertEqual(result.address.road, "Südtiroler Platz")
            XCTAssertEqual(result.address.houseNumber, "5")
            semaphore.signal()
        }
        semaphore.wait()
    }

    static var allTests = [
        ("testReverseInnsbruckHofgarten", testReverseInnsbruckHofgarten),
        ("testReverseInnsbruckHauptbahnhof", testReverseInnsbruckHauptbahnhof)
    ]
}
