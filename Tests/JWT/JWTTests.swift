import XCTest
import Crypto
@testable import AppleSearchAds

final class JWTTests: XCTestCase {
    func testDigest() throws {
        let jwt = JWT(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            audience: "audience",
            expireDuration: 3600,
            issuedTime: { Date(timeIntervalSinceReferenceDate: 1_234_567) }
        )

        XCTAssertEqual(
            try jwt.digest(),
            // cspell:disable
            // swiftlint:disable:next line_length
            "ewogICJhbGciIDogIkVTMjU2IiwKICAia2lkIiA6ICJrZXktaWQiCn0.ewogICJhdWQiIDogImF1ZGllbmNlIiwKICAiZXhwIiA6IDk3OTU0NTM2NywKICAiaWF0IiA6IDk3OTU0MTc2NywKICAiaXNzIiA6ICJ0ZWFtLWlkIiwKICAic3ViIiA6ICJjbGllbnQtaWQiCn0"
            // cspell:enable
        )
    }

    func testExpired() throws {
        let privateKey = try P256.Signing.PrivateKey(pemRepresentation: pemKey)
        let validJWT = try JWT(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            audience: "audience",
            expireDuration: 3600,
            issuedTime: { Date() }
        ).signed(using: privateKey)

        let expiredJWT = try JWT(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            audience: "audience",
            expireDuration: 3600,
            issuedTime: { Date().addingTimeInterval(-7200) }
        ).signed(using: privateKey)

        XCTAssertFalse(validJWT.isJWTExpired)
        XCTAssertTrue(expiredJWT.isJWTExpired)
    }
}
