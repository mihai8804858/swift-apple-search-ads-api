import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class TargetingKeywordsRequestsTests: SnapshotTestCase {
    func testCreateRequest() async throws {
        try await assertRequest(TargetingKeywordsCreateRequest(
            campaignId: 123,
            adGroupId: 456,
            keywords: [
                Keyword(
                    id: 1_789,
                    campaignId: 1_135,
                    adGroupId: 1_791,
                    text: "keyword 1",
                    matchType: .broad,
                    status: .active,
                    bidAmount: Money(amount: "10", currency: "USD"),
                    deleted: false,
                    creationTime: Date(timeIntervalSince1970: 1_000_000),
                    modificationTime: Date(timeIntervalSince1970: 2_000_000)
                ),
                Keyword(
                    id: 2_789,
                    campaignId: 2_135,
                    adGroupId: 2_791,
                    text: "keyword 2",
                    matchType: .exact,
                    status: .paused,
                    bidAmount: Money(amount: "20", currency: "USD"),
                    deleted: true,
                    creationTime: Date(timeIntervalSince1970: 1_000_000),
                    modificationTime: Date(timeIntervalSince1970: 2_000_000)
                )
            ]
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/123/adgroups/456/targetingkeywords/bulk
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 701
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            [
              {
                "adGroupId" : 1791,
                "bidAmount" : {
                  "amount" : "10",
                  "currency" : "USD"
                },
                "campaignId" : 1135,
                "creationTime" : "1970-01-12T13:46:40.000",
                "deleted" : false,
                "id" : 1789,
                "matchType" : "BROAD",
                "modificationTime" : "1970-01-24T03:33:20.000",
                "status" : "ACTIVE",
                "text" : "keyword 1"
              },
              {
                "adGroupId" : 2791,
                "bidAmount" : {
                  "amount" : "20",
                  "currency" : "USD"
                },
                "campaignId" : 2135,
                "creationTime" : "1970-01-12T13:46:40.000",
                "deleted" : true,
                "id" : 2789,
                "matchType" : "EXACT",
                "modificationTime" : "1970-01-24T03:33:20.000",
                "status" : "PAUSED",
                "text" : "keyword 2"
              }
            ]
            """
        }
    }

    func testUpdateRequest() async throws {
        try await assertRequest(TargetingKeywordsUpdateRequest(
            campaignId: 123,
            adGroupId: 456,
            keywords: [
                KeywordUpdate(
                    id: 1_789,
                    adGroupId: 1_246,
                    text: "keyword 1",
                    matchType: .broad,
                    status: .active,
                    bidAmount: Money(amount: "10", currency: "USD"),
                    deleted: false,
                    modificationTime: Date(timeIntervalSince1970: 1_000_000)
                ),
                KeywordUpdate(
                    id: 2_789,
                    adGroupId: 2_246,
                    text: "keyword 2",
                    matchType: .exact,
                    status: .paused,
                    bidAmount: Money(amount: "20", currency: "USD"),
                    deleted: true,
                    modificationTime: Date(timeIntervalSince1970: 2_000_000)
                )
            ]
        )) {
            """
            PUT https://api.searchads.apple.com/api/v5/campaigns/123/adgroups/456/targetingkeywords/bulk
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 555
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            [
              {
                "adGroupId" : 1246,
                "bidAmount" : {
                  "amount" : "10",
                  "currency" : "USD"
                },
                "deleted" : false,
                "id" : 1789,
                "matchType" : "BROAD",
                "modificationTime" : "1970-01-12T13:46:40.000",
                "status" : "ACTIVE",
                "text" : "keyword 1"
              },
              {
                "adGroupId" : 2246,
                "bidAmount" : {
                  "amount" : "20",
                  "currency" : "USD"
                },
                "deleted" : true,
                "id" : 2789,
                "matchType" : "EXACT",
                "modificationTime" : "1970-01-24T03:33:20.000",
                "status" : "PAUSED",
                "text" : "keyword 2"
              }
            ]
            """
        }
    }

    func testDeleteRequest() async throws {
        try await assertRequest(TargetingKeywordDeleteRequest(
            campaignId: 123,
            adGroupId: 456,
            keywordId: 789
        )) {
            """
            DELETE https://api.searchads.apple.com/api/v5/campaigns/123/adgroups/456/targetingkeywords/789
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testDeleteBulkRequest() async throws {
        try await assertRequest(TargetingKeywordsDeleteRequest(
            campaignId: 123,
            adGroupId: 456,
            keywordIds: [789, 246]
        )) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/123/adgroups/456/targetingkeywords/delete/bulk
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 16
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            [
              789,
              246
            ]
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(TargetingKeywordRequest(
            campaignId: 123,
            adGroupId: 456,
            keywordId: 789
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/123/adgroups/456/targetingkeywords/789
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testListRequest() async throws {
        try await assertRequest(TargetingKeywordsListRequest(
            campaignId: 123,
            adGroupId: 456,
            pagination: Pagination(limit: 20, offset: 40)
        )) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/123/adgroups/456/targetingkeywords?limit=20&offset=40
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testFindRequest() async throws {
        try await assertRequest(TargetingKeywordsFindRequest(
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
            POST https://api.searchads.apple.com/api/v5/campaigns/123/adgroups/targetingkeywords/find
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
