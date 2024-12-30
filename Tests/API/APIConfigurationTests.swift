import XCTest
@testable import AppleSearchAds

final class APIConfigurationTests: XCTestCase {
    private lazy var pemDir = URL.temporaryDirectory.appendingPathComponent("apple-search-ads-api-tests")
    private lazy var pemURL = pemDir.appendingPathComponent("test.pem")

    override func setUpWithError() throws {
        try super.setUpWithError()
        try FileManager.default.createDirectory(at: pemDir, withIntermediateDirectories: true)
        try pemKey.write(to: pemURL, atomically: true, encoding: .utf8)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        try FileManager.default.removeItem(at: pemURL)
    }

    func testJWTExpiration() throws {
        let validExpiration: TimeInterval = 86400
        let invalidExpiration: TimeInterval = 86400 * 181

        XCTAssertNoThrow(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: validExpiration
        ))

        XCTAssertNoThrow(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKeyURL: pemURL,
            jwtExpirationDuration: validExpiration
        ))

        XCTAssertThrowsError(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: invalidExpiration
        ))

        XCTAssertThrowsError(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKeyURL: pemURL,
            jwtExpirationDuration: invalidExpiration
        ))
    }
}