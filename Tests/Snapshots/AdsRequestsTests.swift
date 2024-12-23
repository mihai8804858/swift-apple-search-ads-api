import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class AdsRequestsTests: SnapshotTestCase {
    func testCreateRequest() async throws {
        try await assertRequest(AdCreateRequest(
            campaignId: 12345,
            adGroupId: 67890,
            ad: AdCreate(
                id: 13579,
                orgId: 24680,
                adGroupId: 67890,
                campaignId: 12345,
                creativeId: 98765,
                name: "My Ad",
                creativeType: .customProductPage,
                deleted: false,
                status: .enabled,
                servingStatus: .running,
                servingStateReasons: [
                    .pausedBySystem,
                    .pausedByUser
                ],
                creationTime: Date(timeIntervalSince1970: 1_000_000),
                modificationTime: Date(timeIntervalSince1970: 2_000_000)
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890/ads
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

            {
              "adGroupId" : 67890,
              "campaignId" : 12345,
              "creationTime" : "1970-01-12T13:46:40Z",
              "creativeId" : 98765,
              "creativeType" : "CUSTOM_PRODUCT_PAGE",
              "deleted" : false,
              "id" : 13579,
              "modificationTime" : "1970-01-24T03:33:20Z",
              "name" : "My Ad",
              "orgId" : 24680,
              "servingStateReasons" : [
                "PAUSED_BY_SYSTEM",
                "PAUSED_BY_USER"
              ],
              "servingStatus" : "RUNNING",
              "status" : "ENABLED"
            }
            """
        }
    }

    func testDeleteRequest() async throws {
        try await assertRequest(AdDeleteRequest(campaignId: 12345, adGroupId: 67890, adId: 13579)) {
            """
            DELETE https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890/ads/13579
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(AdRequest(campaignId: 12345, adGroupId: 67890, adId: 13579)) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890/ads/13579
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }

    func testFindRequest() async throws {
        try await assertRequest(AdsFindRequest(
            campaignId: 12345,
            selector: Selector(
                conditions: [
                    Condition(field: "status", operator: .equals, values: ["ENABLED"]),
                    Condition(field: "deleted", operator: .in, values: ["true", "false"])
                ],
                fields: ["id", "name"],
                orderBy: [Sorting(field: "creationTime", sortOrder: .ascending)],
                pagination: Pagination(limit: 20, offset: 40)
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/12345/ads/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "status",
                  "operator" : "EQUALS",
                  "values" : [
                    "ENABLED"
                  ]
                },
                {
                  "field" : "deleted",
                  "operator" : "IN",
                  "values" : [
                    "true",
                    "false"
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

    func testFindOrgWideRequest() async throws {
        try await assertRequest(AdsFindRequest(campaignId: nil, selector: nil)) {
            """
            POST https://api.searchads.apple.com/api/v5/ads/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }

    func testListRequest() async throws {
        try await assertRequest(AdsListRequest(campaignId: 12345, adGroupId: 67890)) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890/ads
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }

    func testUpdateRequest() async throws {
        try await assertRequest(AdUpdateRequest(
            campaignId: 12345,
            adGroupId: 67890,
            adId: 13579,
            ad: AdUpdate(
                id: 13579,
                orgId: 24680,
                adGroupId: 67890,
                campaignId: 12345,
                creativeId: 98765,
                name: "My Ad",
                creativeType: .customProductPage,
                deleted: false,
                status: .paused,
                servingStatus: .notRunning,
                servingStateReasons: [.pausedByUser],
                creationTime: Date(timeIntervalSince1970: 1_000_000),
                modificationTime: Date(timeIntervalSince1970: 2_000_000)
            )
        )) {
            """
            PUT https://api.searchads.apple.com/api/v5/campaigns/12345/adgroups/67890/ads/13579
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

            {
              "adGroupId" : 67890,
              "campaignId" : 12345,
              "creationTime" : "1970-01-12T13:46:40Z",
              "creativeId" : 98765,
              "creativeType" : "CUSTOM_PRODUCT_PAGE",
              "deleted" : false,
              "id" : 13579,
              "modificationTime" : "1970-01-24T03:33:20Z",
              "name" : "My Ad",
              "orgId" : 24680,
              "servingStateReasons" : [
                "PAUSED_BY_USER"
              ],
              "servingStatus" : "NOT_RUNNING",
              "status" : "PAUSED"
            }
            """
        }
    }
}
