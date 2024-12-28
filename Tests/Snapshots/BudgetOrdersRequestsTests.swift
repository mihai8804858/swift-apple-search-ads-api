import XCTest
import InlineSnapshotTesting
@testable import AppleSearchAds

final class BudgetOrdersRequestsTests: SnapshotTestCase {
    func testCreateRequest() async throws {
        try await assertRequest(BudgetOrderCreateRequest(budgetOrder: BudgetOrderCreate(
            orgIds: [12345, 67890],
            bo: BudgetOrderCreate.Bo(
                primaryBuyerEmail: "buyer@email.com",
                primaryBuyerName: "Buyer Name",
                billingEmail: "billing@email.com",
                name: "Order Name",
                clientName: "Client Name",
                budget: Money(amount: "10", currency: "USD"),
                startDate: Date(timeIntervalSince1970: 1_000_000),
                endDate: Date(timeIntervalSince1970: 2_000_000),
                orderNumber: "123",
                supplySources: [.appStoreSearchResults, .appStoreSearchTab]
            )
        ))) {
            """
            POST https://api.searchads.apple.com/api/v5/budgetorders
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 524
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

            {
              "bo" : {
                "billingEmail" : "billing@email.com",
                "budget" : {
                  "amount" : "10",
                  "currency" : "USD"
                },
                "clientName" : "Client Name",
                "endDate" : "1970-01-24T03:33:20.000",
                "name" : "Order Name",
                "orderNumber" : "123",
                "primaryBuyerEmail" : "buyer@email.com",
                "primaryBuyerName" : "Buyer Name",
                "startDate" : "1970-01-12T13:46:40.000",
                "supplySources" : [
                  "APPSTORE_SEARCH_RESULTS",
                  "APPSTORE_SEARCH_TAB"
                ]
              },
              "orgIds" : [
                12345,
                67890
              ]
            }
            """
        }
    }

    func testUpdateRequest() async throws {
        try await assertRequest(BudgetOrderUpdateRequest(boID: 12345, budgetOrder: BudgetOrderUpdate(
            orgIds: [12345, 67890],
            bo: BudgetOrderUpdate.Bo(
                primaryBuyerEmail: "buyer@email.com",
                primaryBuyerName: "Buyer Name",
                billingEmail: "billing@email.com",
                name: "Order Name",
                clientName: "Client Name",
                budget: Money(amount: "10", currency: "USD"),
                startDate: Date(timeIntervalSince1970: 1_000_000),
                endDate: Date(timeIntervalSince1970: 2_000_000),
                orderNumber: "123"
            )
        ))) {
            """
            PUT https://api.searchads.apple.com/api/v5/budgetorders/12345
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Content-Length: 432
            Content-Type: application/json
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345

            {
              "bo" : {
                "billingEmail" : "billing@email.com",
                "budget" : {
                  "amount" : "10",
                  "currency" : "USD"
                },
                "clientName" : "Client Name",
                "endDate" : "1970-01-24T03:33:20.000",
                "name" : "Order Name",
                "orderNumber" : "123",
                "primaryBuyerEmail" : "buyer@email.com",
                "primaryBuyerName" : "Buyer Name",
                "startDate" : "1970-01-12T13:46:40.000"
              },
              "orgIds" : [
                12345,
                67890
              ]
            }
            """
        }
    }

    func testGetRequest() async throws {
        try await assertRequest(BudgetOrderRequest(boID: 12345)) {
            """
            GET https://api.searchads.apple.com/api/v5/budgetorders/12345
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }

    func testListRequest() async throws {
        try await assertRequest(BudgetOrderListRequest(pagination: Pagination(limit: 20, offset: 40))) {
            """
            GET https://api.searchads.apple.com/api/v5/budgetorders?limit=20&offset=40
            Accept-Encoding: gzip;q=1.0, compress;q=0.5
            Accept-Language: en-US;q=1.0
            Authorization: Bearer token
            Host: api.searchads.apple.com
            X-AP-Context: orgId=12345
            """
        }
    }
}
