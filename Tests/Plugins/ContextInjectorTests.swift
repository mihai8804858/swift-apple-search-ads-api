import XCTest
@testable import AppleSearchAds

final class ContextInjectorTests: XCTestCase {
    func testPrepareRequest() async throws {
        let url = try XCTUnwrap(URL(string: "https://example.com"))
        let plugin = ContextInjector {
            [
                UserACL(
                    orgId: 123,
                    orgName: "My Org",
                    parentOrgId: nil,
                    currency: "USD",
                    paymentModel: .payAsYouGo,
                    roleNames: ["Admin"],
                    timeZone: "UTC"
                )
            ]
        }

        var request = URLRequest(url: url)
        try await plugin.prepare(request: &request)

        XCTAssertEqual(request.allHTTPHeaderFields?["X-AP-Context"], "orgId=123")
    }
}
