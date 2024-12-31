import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class CampaignsRequestsTests: SnapshotTestCase {
    func testCreateRequest() async throws {
        try await assertRequest(CampaignCreateRequest(campaign: Campaign(
            id: 123,
            orgId: 456,
            adamId: 789,
            adChannelType: .search,
            billingEvent: .impressions,
            budgetAmount: Money(amount: "10", currency: "USD"),
            budgetOrders: [246, 135],
            countriesOrRegions: ["US", "GB"],
            countryOrRegionServingStateReasons: [
                "US": [
                    .appNotEligible,
                    .appNotPublishedYet
                ]
            ],
            creationTime: Date(timeIntervalSince1970: 1_000_000),
            dailyBudgetAmount: Money(amount: "2", currency: "USD"),
            deleted: false,
            displayStatus: .onHold,
            endTime: Date(timeIntervalSince1970: 2_000_000),
            locInvoiceDetails: LOCInvoiceDetails(
                billingContactEmail: "billing@email.com",
                buyerEmail: "buyer@email.com",
                buyerName: "Buyer Name",
                clientName: "Client Name",
                orderNumber: "123abc"
            ),
            modificationTime: Date(timeIntervalSince1970: 1_500_000),
            name: "My Campaign",
            paymentModel: .lineOfCredit,
            servingStatus: .notRunning,
            servingStateReasons: [
                .adGroupMissing,
                .boStartDateInFuture
            ],
            startTime: Date(timeIntervalSince1970: 1_200_000),
            status: .paused,
            supplySources: [.appStoreSearchResults, .appStoreTodayTab]
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 1201
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "adamId" : 789,
              "adChannelType" : "SEARCH",
              "billingEvent" : "IMPRESSIONS",
              "budgetAmount" : {
                "amount" : "10",
                "currency" : "USD"
              },
              "budgetOrders" : [
                246,
                135
              ],
              "countriesOrRegions" : [
                "US",
                "GB"
              ],
              "countryOrRegionServingStateReasons" : {
                "US" : [
                  "APP_NOT_ELIGIBLE",
                  "APP_NOT_PUBLISHED_YET"
                ]
              },
              "creationTime" : "1970-01-12T13:46:40.000",
              "dailyBudgetAmount" : {
                "amount" : "2",
                "currency" : "USD"
              },
              "deleted" : false,
              "displayStatus" : "ON_HOLD",
              "endTime" : "1970-01-24T03:33:20.000",
              "id" : 123,
              "locInvoiceDetails" : {
                "billingContactEmail" : "billing@email.com",
                "buyerEmail" : "buyer@email.com",
                "buyerName" : "Buyer Name",
                "clientName" : "Client Name",
                "orderNumber" : "123abc"
              },
              "modificationTime" : "1970-01-18T08:40:00.000",
              "name" : "My Campaign",
              "orgId" : 456,
              "paymentModel" : "LOC",
              "servingStateReasons" : [
                "AD_GROUP_MISSING",
                "BO_START_DATE_IN_FUTURE"
              ],
              "servingStatus" : "NOT_RUNNING",
              "startTime" : "1970-01-14T21:20:00.000",
              "status" : "PAUSED",
              "supplySources" : [
                "APPSTORE_SEARCH_RESULTS",
                "APPSTORE_TODAY_TAB"
              ]
            }
            """
        }
    }

    func testUpdateRequest() async throws {
        try await assertRequest(CampaignUpdateRequest(
            campaignId: 123,
            campaign: CampaignUpdate(
                clearGeoTargetingOnCountryOrRegionChange: true,
                campaign: CampaignUpdateProperties(
                    name: "My Campaign",
                    status: .paused,
                    budgetAmount: Money(amount: "10", currency: "USD"),
                    budgetOrders: [456, 789],
                    dailyBudgetAmount: Money(amount: "2", currency: "USD"),
                    countriesOrRegions: ["US", "GB"],
                    locInvoiceDetails: LOCInvoiceDetails(
                        billingContactEmail: "billing@email.com",
                        buyerEmail: "buyer@email.com",
                        buyerName: "Buyer Name",
                        clientName: "Client Name",
                        orderNumber: "123abc"
                    )
                )
            )
        )) {
            """
            PUT https://api.searchads.apple.com/api/v5/campaigns/123
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 626
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "campaign" : {
                "budgetAmount" : {
                  "amount" : "10",
                  "currency" : "USD"
                },
                "budgetOrders" : [
                  456,
                  789
                ],
                "countriesOrRegions" : [
                  "US",
                  "GB"
                ],
                "dailyBudgetAmount" : {
                  "amount" : "2",
                  "currency" : "USD"
                },
                "locInvoiceDetails" : {
                  "billingContactEmail" : "billing@email.com",
                  "buyerEmail" : "buyer@email.com",
                  "buyerName" : "Buyer Name",
                  "clientName" : "Client Name",
                  "orderNumber" : "123abc"
                },
                "name" : "My Campaign",
                "status" : "PAUSED"
              },
              "clearGeoTargetingOnCountryOrRegionChange" : true
            }
            """
        }
    }

    func testDeleteRequest() async throws {
        try await assertRequest(CampaignDeleteRequest(campaignId: 123)) {
            """
            DELETE https://api.searchads.apple.com/api/v5/campaigns/123
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(CampaignRequest(campaignId: 123)) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns/123
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testListRequest() async throws {
        try await assertRequest(CampaignListRequest(pagination: Pagination(limit: 20, offset: 40))) {
            """
            GET https://api.searchads.apple.com/api/v5/campaigns?limit=20&offset=40
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345
            """
        }
    }

    func testFindRequest() async throws {
        try await assertRequest(CampaignFindRequest(selector: Selector(
            conditions: [
                Condition(field: .servingStatus, operator: .equals, value: Campaign.ServingStatus.running),
                Condition(field: .adChannelType, operator: .in, values: [
                    Campaign.AdChannelType.search,
                    Campaign.AdChannelType.display
                ])
            ],
            fields: [.id, .name],
            orderBy: [Sorting(field: .creationTime, sortOrder: .ascending)],
            pagination: Pagination(limit: 20, offset: 40)
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/campaigns/find
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 477
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-Ap-Context: orgId=12345

            {
              "conditions" : [
                {
                  "field" : "servingStatus",
                  "operator" : "EQUALS",
                  "values" : [
                    "RUNNING"
                  ]
                },
                {
                  "field" : "adChannelType",
                  "operator" : "IN",
                  "values" : [
                    "SEARCH",
                    "DISPLAY"
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
