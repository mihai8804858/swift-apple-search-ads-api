import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import AppleSearchAds

final class AuthorizationInjectorTests: XCTestCase {
    func testPrepareRequest() async throws {
        let url = try XCTUnwrap(URL(string: "https://example.com"))
        let plugin = AuthorizationInjector {
            AccessToken(token: "token", tokenType: "Bearer", expiresIn: 3600)
        }

        var request = URLRequest(url: url)
        try await plugin.prepare(request: &request)

        XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], "Bearer token")
    }
}
