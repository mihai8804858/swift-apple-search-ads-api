import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import AppleSearchAds

final class HostInjectorTests: XCTestCase {
    func testPrepareRequest() async throws {
        let url = try XCTUnwrap(URL(string: "https://example.com"))
        let plugin = HostInjector()

        var request = URLRequest(url: url)
        try await plugin.prepare(request: &request)

        XCTAssertEqual(request.allHTTPHeaderFields?["Host"], "example.com")
    }
}
