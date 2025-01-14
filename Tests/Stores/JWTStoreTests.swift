import XCTest
@testable import AppleSearchAds

final class JWTStoreTests: XCTestCase {
    func testNoCache() async throws {
        nonisolated(unsafe) var jwtIssueCount = 0
        let store = JWTStore(
            configuration: APIConfiguration(
                clientIdentifier: "client-id",
                teamIdentifier: "team-id",
                keyIdentifier: "key-id",
                privateKey: clearKey,
                jwtExpirationDuration: 3600
            ),
            audience: "https://appleid.apple.com",
            issuedTime: {
                jwtIssueCount += 1
                return Date()
            }
        )
        _ = try await store.jwt()
        XCTAssertEqual(jwtIssueCount, 1)
    }

    func testValidCache() async throws {
        nonisolated(unsafe) var jwtIssueCount = 0
        let store = JWTStore(
            configuration: APIConfiguration(
                clientIdentifier: "client-id",
                teamIdentifier: "team-id",
                keyIdentifier: "key-id",
                privateKey: clearKey,
                jwtExpirationDuration: 3600
            ),
            audience: "https://appleid.apple.com",
            issuedTime: {
                jwtIssueCount += 1
                return Date()
            }
        )
        _ = try await store.jwt()
        _ = try await store.jwt()
        _ = try await store.jwt()
        XCTAssertEqual(jwtIssueCount, 1)
    }

    func testExpiredCache() async throws {
        nonisolated(unsafe) var isFirstIssue = true
        nonisolated(unsafe) var jwtIssueCount = 0
        let store = JWTStore(
            configuration: APIConfiguration(
                clientIdentifier: "client-id",
                teamIdentifier: "team-id",
                keyIdentifier: "key-id",
                privateKey: clearKey,
                jwtExpirationDuration: 3600
            ),
            audience: "https://appleid.apple.com",
            issuedTime: {
                defer {
                    isFirstIssue = false
                    jwtIssueCount += 1
                }
                if isFirstIssue {
                    return Date().addingTimeInterval(-7200)
                } else {
                    return Date()
                }
            }
        )
        _ = try await store.jwt()
        _ = try await store.jwt()
        _ = try await store.jwt()
        XCTAssertEqual(jwtIssueCount, 2)
    }
}
