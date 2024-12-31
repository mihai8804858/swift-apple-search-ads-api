import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class AppsRequestsTests: SnapshotTestCase {
    func testEligibilityRequest() async throws {
        try await assertRequest(AppEligibilityRequest(
            adamId: 12345,
            selector: Selector(
                conditions: [Condition(field: .state, operator: .equals, value: EligibilityRecord.State.eligible)],
                fields: [.adamId, .supplySource],
                orderBy: [Sorting(field: .minAge, sortOrder: .ascending)],
                pagination: Pagination(limit: 20, offset: 40)
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/apps/12345/eligibilities/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 342
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "state",
                  "operator" : "EQUALS",
                  "values" : [
                    "ELIGIBLE"
                  ]
                }
              ],
              "fields" : [
                "adamId",
                "supplySource"
              ],
              "orderBy" : [
                {
                  "field" : "minAge",
                  "sortOrder" : "ASCENDING"
                }
              ],
              "pagination" : {
                "limit" : 20,
                "offset" : 40
              }
            }
            """
        }
    }

    func testSearchRequest() async throws {
        try await assertRequest(SearchAppsRequest(parameters: SearchAppsRequestParameters(
            query: "App Query",
            returnOwnedApps: true,
            pagination: Pagination(limit: 20, offset: 40)
        ))) {
            """
            GET https://api.searchads.apple.com/api/v5/search/apps?limit=20&offset=40&query=App%20Query&returnOwnedApps=true
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }
}
