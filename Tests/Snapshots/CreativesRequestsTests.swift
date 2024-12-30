import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class CreativesRequestsTests: SnapshotTestCase {
    func testCreateRequest() async throws {
        try await assertRequest(CreativeCreateRequest(creative: CreativeCustomProductPage(
            id: 123,
            adamId: 456,
            orgId: 789,
            productPageId: "page-id",
            name: "My Creative",
            type: .customProductPage,
            state: .invalid,
            stateReasons: [
                .productPageHidden,
                .assetDeleted
            ],
            creationTime: Date(timeIntervalSince1970: 1_000_000),
            modificationTime: Date(timeIntervalSince1970: 2_000_000)
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/creatives
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 334
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "adamId" : 456,
              "creationTime" : "1970-01-12T13:46:40.000",
              "id" : 123,
              "modificationTime" : "1970-01-24T03:33:20.000",
              "name" : "My Creative",
              "orgId" : 789,
              "productPageId" : "page-id",
              "state" : "INVALID",
              "stateReasons" : [
                "PRODUCT_PAGE_HIDDEN",
                "ASSET_DELETED"
              ],
              "type" : "CUSTOM_PRODUCT_PAGE"
            }
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(CreativeRequest(
            creativeId: 123,
            parameters: CreativeParameters(includeDeletedCreativeSetAssets: true)
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/creatives/123?includeDeletedCreativeSetAssets=true
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testListRequest() async throws {
        try await assertRequest(CreativesListRequest(pagination: Pagination(limit: 20, offset: 40))) {
            """
            GET https://api.searchads.apple.com/api/v5/creatives?limit=20&offset=40
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testFindRequest() async throws {
        try await assertRequest(CreativesFindRequest(selector: Selector(
            conditions: [
                Condition(field: "state", operator: .equals, values: ["VALID"]),
                Condition(field: "stateReasons", operator: .contains, values: [
                    "ASSET_DELETED",
                    "PRODUCT_PAGE_DELETED"
                ])
            ],
            fields: ["id", "name"],
            orderBy: [Sorting(field: "creationTime", sortOrder: .ascending)],
            pagination: Pagination(limit: 20, offset: 40)
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/creatives/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 492
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "state",
                  "operator" : "EQUALS",
                  "values" : [
                    "VALID"
                  ]
                },
                {
                  "field" : "stateReasons",
                  "operator" : "CONTAINS",
                  "values" : [
                    "ASSET_DELETED",
                    "PRODUCT_PAGE_DELETED"
                  ]
                }
              ],
              "fields" : [
                "id",
                "name"
              ],
              "orderBy" : [
                {
                  "field" : "creationTime",
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
}
