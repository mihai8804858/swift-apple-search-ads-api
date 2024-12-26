import XCTest
@testable import AppleSearchAds

final class ContextStoreTests: XCTestCase {
    func testUserACLNoCache() async throws {
        let provider = MockProvider()
        let store = ContextStore(provider: provider)

        let userACLs = [
            UserACL(
                orgId: 123,
                orgName: "My Org",
                parentOrgId: nil,
                currency: "USD",
                paymentModel: .payAsYouGo,
                roleNames: [],
                timeZone: "UTC"
            )
        ]
        let userACLData = try JSONEncoder.default.encode(DataResponse(data: userACLs))
        provider.requestDataStub = .success(Response(model: userACLData, statusCode: .success))
        _ = try await store.userACL()

        XCTAssertEqual(provider.performedRequests.count, 1)
    }

    func testUserACLValidCache() async throws {
        let provider = MockProvider()
        let store = ContextStore(provider: provider)

        let userACLs = [
            UserACL(
                orgId: 123,
                orgName: "My Org",
                parentOrgId: nil,
                currency: "USD",
                paymentModel: .payAsYouGo,
                roleNames: [],
                timeZone: "UTC"
            )
        ]
        let userACLData = try JSONEncoder.default.encode(DataResponse(data: userACLs))
        provider.requestDataStub = .success(Response(model: userACLData, statusCode: .success))
        _ = try await store.userACL()
        _ = try await store.userACL()
        _ = try await store.userACL()

        XCTAssertEqual(provider.performedRequests.count, 1)
    }

    func testMeDetailsNoCache() async throws {
        let provider = MockProvider()
        let store = ContextStore(provider: provider)

        let meDetails = MeDetail(userId: 123, parentOrgId: 456)
        let meDetailsData = try JSONEncoder.default.encode(DataResponse(data: meDetails))
        provider.requestDataStub = .success(Response(model: meDetailsData, statusCode: .success))
        _ = try await store.meDetail()

        XCTAssertEqual(provider.performedRequests.count, 1)
    }

    func testMeDetailsValidCache() async throws {
        let provider = MockProvider()
        let store = ContextStore(provider: provider)

        let meDetails = MeDetail(userId: 123, parentOrgId: 456)
        let meDetailsData = try JSONEncoder.default.encode(DataResponse(data: meDetails))
        provider.requestDataStub = .success(Response(model: meDetailsData, statusCode: .success))
        _ = try await store.meDetail()
        _ = try await store.meDetail()
        _ = try await store.meDetail()

        XCTAssertEqual(provider.performedRequests.count, 1)
    }
}
