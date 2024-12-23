import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class ContextRequestsTests: SnapshotTestCase {
    func testAccessTokenRequest() async throws {
        try await assertRequest(AccessTokenRequest(parameters: AccessTokenParameters(
            clientID: "client id",
            clientSecret: "client secret"
        ))) {
            """
            POST https://api.searchads.apple.com/auth/oauth2/token?client_id=client%20id&client_secret=client%20secret&grant_type=client_credentials&scope=searchadsorg
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }

    func testMeDetailsRequest() async throws {
        try await assertRequest(MeDetailsRequest()) {
            """
            GET https://api.searchads.apple.com/api/v5/me
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }

    func testUserACLRequest() async throws {
        try await assertRequest(UserACLRequest()) {
            """
            GET https://api.searchads.apple.com/api/v5/acls
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }
}
