import XCTest
@testable import AppleSearchAds

#if os(Linux)
private let env = ProcessInfo.processInfo.environment
#endif

final class APIConfigurationTests: XCTestCase {
    #if os(Linux)
    private lazy var pemDir = URL(fileURLWithPath: env["TMPDIR"] ?? env["TEMP"] ?? env["TMP"] ?? "/tmp")
    #else
    private lazy var pemDir = URL.temporaryDirectory.appendingPathComponent("apple-search-ads-api-tests")
    #endif
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

    func testJWTExpiration() {
        let validExpiration: TimeInterval = 86400
        let invalidExpiration: TimeInterval = 86400 * 181

        XCTAssertNoThrow(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: validExpiration
        ).privateKey)

        XCTAssertNoThrow(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKeyURL: pemURL,
            jwtExpirationDuration: validExpiration
        ).privateKey)

        XCTAssertThrowsError(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKey: clearKey,
            jwtExpirationDuration: invalidExpiration
        ).privateKey)

        XCTAssertThrowsError(try APIConfiguration(
            clientIdentifier: "client-id",
            teamIdentifier: "team-id",
            keyIdentifier: "key-id",
            privateKeyURL: pemURL,
            jwtExpirationDuration: invalidExpiration
        ).privateKey)
    }
}
