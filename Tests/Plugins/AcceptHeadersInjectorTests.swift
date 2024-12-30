import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import AppleSearchAds

final class AcceptHeadersInjectorTests: XCTestCase {
    func testPrepareRequest() async throws {
        let url = try XCTUnwrap(URL(string: "https://example.com"))
        let plugin = AcceptHeadersInjector(preferredLanguages: ["en-US", "en-GB"])

        var request = URLRequest(url: url)
        try await plugin.prepare(request: &request)

        XCTAssertEqual(request.allHTTPHeaderFields?["Accept-Encoding"], "gzip;q=1.0, compress;q=0.5")
        XCTAssertEqual(request.allHTTPHeaderFields?["Accept-Language"], "en-US;q=1.0, en-GB;q=0.9")
    }
}
