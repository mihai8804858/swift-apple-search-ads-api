import Foundation
@preconcurrency import Crypto

public struct APIConfiguration: Sendable {
    private static let allowedJWTExpirationDurationRange: ClosedRange<TimeInterval> = 0...86400 * 180

    let clientIdentifier: String
    let teamIdentifier: String
    let keyIdentifier: String
    let jwtExpirationDuration: TimeInterval
    let privateKey: JWT.PrivateKey

    public init(
        clientIdentifier: String,
        teamIdentifier: String,
        keyIdentifier: String,
        privateKey: String,
        jwtExpirationDuration: TimeInterval = 86400
    ) throws {
        guard Self.allowedJWTExpirationDurationRange ~= jwtExpirationDuration else {
            throw JWT.Error.invalidExpirationDuration
        }
        guard let base64Key = Data(base64Encoded: privateKey) else {
            throw JWT.Error.invalidBase64EncodedPrivateKey
        }
        self.privateKey = try JWT.PrivateKey(derRepresentation: base64Key)
        self.jwtExpirationDuration = jwtExpirationDuration
        self.clientIdentifier = clientIdentifier
        self.teamIdentifier = teamIdentifier
        self.keyIdentifier = keyIdentifier
    }

    public init(
        clientIdentifier: String,
        teamIdentifier: String,
        keyIdentifier: String,
        privateKeyURL: URL,
        jwtExpirationDuration: TimeInterval = 86400
    ) throws {
        guard Self.allowedJWTExpirationDurationRange ~= jwtExpirationDuration else {
            throw JWT.Error.invalidExpirationDuration
        }
        let pemEncodedPrivateKey = try String(contentsOf: privateKeyURL)
        self.privateKey = try JWT.PrivateKey(pemRepresentation: pemEncodedPrivateKey)
        self.jwtExpirationDuration = jwtExpirationDuration
        self.clientIdentifier = clientIdentifier
        self.teamIdentifier = teamIdentifier
        self.keyIdentifier = keyIdentifier
    }
}
