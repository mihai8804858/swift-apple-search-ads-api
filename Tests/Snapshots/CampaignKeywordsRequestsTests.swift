import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class CampaignKeywordsRequestsTests: SnapshotTestCase {
    func testCreateRequest() async throws {
        try await assertRequest(CampaignNegativeKeywordsCreateRequest(
            campaignId: 123,
            keywords: [
                NegativeKeyword(
                    id: 789,
                    campaignId: 135,
                    adGroupId: 790,
                    text: "keyword text 1",
                    matchType: .exact,
                    status: .active,
                    deleted: false,
                    modificationTime: Date(timeIntervalSince1970: 1_000_000)
                ),
                NegativeKeyword(
                    id: 246,
                    campaignId: 802,
                    adGroupId: 987,
                    text: "keyword text 2",
                    matchType: .broad,
                    status: .paused,
                    deleted: true,
                    modificationTime: Date(timeIntervalSince1970: 2_000_000)
                )
            ]
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/123/negativekeywords/bulk
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 459
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            [
              {
                "adGroupId" : 790,
                "campaignId" : 135,
                "deleted" : false,
                "id" : 789,
                "matchType" : "EXACT",
                "modificationTime" : "1970-01-12T13:46:40.000",
                "status" : "ACTIVE",
                "text" : "keyword text 1"
              },
              {
                "adGroupId" : 987,
                "campaignId" : 802,
                "deleted" : true,
                "id" : 246,
                "matchType" : "BROAD",
                "modificationTime" : "1970-01-24T03:33:20.000",
                "status" : "PAUSED",
                "text" : "keyword text 2"
              }
            ]
            """
        }
    }

    func testUpdateRequest() async throws {
        try await assertRequest(CampaignNegativeKeywordsUpdateRequest(
            campaignId: 123,
            keywords: [
                NegativeKeyword(
                    id: 789,
                    campaignId: 135,
                    adGroupId: 790,
                    text: "keyword text 1",
                    matchType: .exact,
                    status: .active,
                    deleted: false,
                    modificationTime: Date(timeIntervalSince1970: 1_000_000)
                ),
                NegativeKeyword(
                    id: 246,
                    campaignId: 802,
                    adGroupId: 987,
                    text: "keyword text 2",
                    matchType: .broad,
                    status: .paused,
                    deleted: true,
                    modificationTime: Date(timeIntervalSince1970: 2_000_000)
                )
            ]
        )) {
            """
            PUT https://api.searchads.apple.com/api/v5/campaigns/123/negativekeywords/bulk
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 459
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            [
              {
                "adGroupId" : 790,
                "campaignId" : 135,
                "deleted" : false,
                "id" : 789,
                "matchType" : "EXACT",
                "modificationTime" : "1970-01-12T13:46:40.000",
                "status" : "ACTIVE",
                "text" : "keyword text 1"
              },
              {
                "adGroupId" : 987,
                "campaignId" : 802,
                "deleted" : true,
                "id" : 246,
                "matchType" : "BROAD",
                "modificationTime" : "1970-01-24T03:33:20.000",
                "status" : "PAUSED",
                "text" : "keyword text 2"
              }
            ]
            """
        }
    }

    func testDeleteRequest() async throws {
        try await assertRequest(CampaignNegativeKeywordsDeleteRequest(
            campaignId: 123,
            keywordIds: [789, 246, 135]
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/123/negativekeywords/delete/bulk
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 23
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            [
              789,
              246,
              135
            ]
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(CampaignNegativeKeywordRequest(
            campaignId: 123,
            keywordId: 789
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/123/negativekeywords/789
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testListRequest() async throws {
        try await assertRequest(CampaignNegativeKeywordsListRequest(
            campaignId: 123,
            pagination: Pagination(limit: 20, offset: 40)
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/123/negativekeywords?limit=20&offset=40
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testFindRequest() async throws {
        try await assertRequest(CampaignNegativeKeywordsFindRequest(
            campaignId: 123,
            selector: Selector(
                conditions: [
                    Condition(field: "status", operator: .equals, values: ["ACTIVE"]),
                    Condition(field: "matchType", operator: .contains, values: ["BROAD", "EXACT"])
                ],
                fields: ["id", "text"],
                orderBy: [Sorting(field: "modificationTime", sortOrder: .ascending)],
                pagination: Pagination(limit: 20, offset: 40)
            )
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/123/negativekeywords/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 472
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "status",
                  "operator" : "EQUALS",
                  "values" : [
                    "ACTIVE"
                  ]
                },
                {
                  "field" : "matchType",
                  "operator" : "CONTAINS",
                  "values" : [
                    "BROAD",
                    "EXACT"
                  ]
                }
              ],
              "fields" : [
                "id",
                "text"
              ],
              "orderBy" : [
                {
                  "field" : "modificationTime",
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
