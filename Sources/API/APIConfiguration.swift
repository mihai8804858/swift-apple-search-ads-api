import Foundation
@preconcurrency import Crypto

/// API configuration parameters.
public struct APIConfiguration: Sendable {
    private static let allowedJWTExpirationDurationRange: ClosedRange<TimeInterval> = 0...86400 * 180

    /// You receive your client identifier when you upload a public key to App Store Search Ads UI.
    public let clientIdentifier: String
    /// You receive your team identifier when you upload a public key to App Store Search Ads UI.
    public let teamIdentifier: String
    /// You receive your key identifier when you upload a public key to App Store Search Ads UI.
    public let keyIdentifier: String
    /// Defines the JWT expiration duration, which may not exceed 180 days.
    public let jwtExpirationDuration: TimeInterval
    /// API users need to create a private key and upload it to App Store Search Ads UI in exchange for client,
    /// team and key identifier. Private key is used to generate a JWT which is then exchanged for an access token
    /// that is used to authenticate the API calls.
    public let privateKey: P256.Signing.PrivateKey

    /// Create an instance of `APIConfiguration`.
    ///
    /// - Parameters:
    ///     - clientIdentifier: You receive your client identifier when you upload a public key.
    ///     - teamIdentifier: You receive your team identifier when you upload a public key.
    ///     - keyIdentifier: You receive your key identifier when you upload a public key.
    ///     - privateKey: API users need to create a private key and upload it to App Store Search Ads UI.
    ///     - jwtExpirationDuration: Defines the JWT expiration duration, which may not exceed 180 days.
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
        self.privateKey = try P256.Signing.PrivateKey(derRepresentation: base64Key)
        self.jwtExpirationDuration = jwtExpirationDuration
        self.clientIdentifier = clientIdentifier
        self.teamIdentifier = teamIdentifier
        self.keyIdentifier = keyIdentifier
    }

    /// Create an instance of `APIConfiguration`.
    ///
    /// - Parameters:
    ///     - clientIdentifier: You receive your client identifier when you upload a public key.
    ///     - teamIdentifier: You receive your team identifier when you upload a public key.
    ///     - keyIdentifier: You receive your key identifier when you upload a public key.
    ///     - privateKeyURL: API users need to create a private key and upload it to App Store Search Ads UI.
    ///     - jwtExpirationDuration: Defines the JWT expiration duration, which may not exceed 180 days.
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
        self.privateKey = try P256.Signing.PrivateKey(pemRepresentation: pemEncodedPrivateKey)
        self.jwtExpirationDuration = jwtExpirationDuration
        self.clientIdentifier = clientIdentifier
        self.teamIdentifier = teamIdentifier
        self.keyIdentifier = keyIdentifier
    }
}
