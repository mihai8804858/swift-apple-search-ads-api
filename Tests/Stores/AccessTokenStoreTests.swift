import XCTest
@testable import AppleSearchAds

final class AccessTokenStoreTests: XCTestCase {
    func testNoCache() async throws {
        let provider = MockProvider()
        let configuration = try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: 3600
        )
        let store = AccessTokenStore(
            configuration: configuration,
            jwtStore: JWTStore(configuration: configuration, audience: "audience"),
            provider: provider
        )

        let accessToken = AccessToken(token: "token", tokenType: "Bearer", expiresIn: 3600)
        let accessTokenData = try JSONEncoder.default.encode(accessToken)
        provider.requestDataStub = .success(Response(model: accessTokenData, statusCode: .success))
        _ = try await store.token()

        XCTAssertEqual(provider.performedRequests.count, 1)
    }

    func testValidCache() async throws {
        let provider = MockProvider()
        let configuration = try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: 3600
        )
        let store = AccessTokenStore(
            configuration: configuration,
            jwtStore: JWTStore(configuration: configuration, audience: "audience"),
            provider: provider
        )

        let accessToken = AccessToken(token: "token", tokenType: "Bearer", expiresIn: 3600)
        let accessTokenData = try JSONEncoder.default.encode(accessToken)
        provider.requestDataStub = .success(Response(model: accessTokenData, statusCode: .success))
        _ = try await store.token()
        _ = try await store.token()
        _ = try await store.token()

        XCTAssertEqual(provider.performedRequests.count, 1)
    }

    func testExpiredCache() async throws {
        let provider = MockProvider()
        let configuration = try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: 3600
        )
        let store = AccessTokenStore(
            configuration: configuration,
            jwtStore: JWTStore(configuration: configuration, audience: "audience"),
            provider: provider
        )

        let accessToken = AccessToken(token: "token", tokenType: "Bearer", expiresIn: -10)
        let accessTokenData = try JSONEncoder.default.encode(accessToken)
        provider.requestDataStub = .success(Response(model: accessTokenData, statusCode: .success))
        _ = try await store.token()
        _ = try await store.token()

        XCTAssertEqual(provider.performedRequests.count, 2)
    }

    func testRefreshToken() async throws {
        let provider = MockProvider()
        let configuration = try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: 3600
        )
        let store = AccessTokenStore(
            configuration: configuration,
            jwtStore: JWTStore(configuration: configuration, audience: "audience"),
            provider: provider
        )

        let accessToken = AccessToken(token: "token", tokenType: "Bearer", expiresIn: 3600)
        let accessTokenData = try JSONEncoder.default.encode(accessToken)
        provider.requestDataStub = .success(Response(model: accessTokenData, statusCode: .success))
        _ = try await store.token()
        _ = try await store.refreshToken()

        XCTAssertEqual(provider.performedRequests.count, 2)
    }
}
