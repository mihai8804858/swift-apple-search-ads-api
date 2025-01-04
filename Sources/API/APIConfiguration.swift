import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
@preconcurrency import Crypto

enum PrivateKeySource: Sendable {
    case derContents(String)
    case pemURL(URL)
}

/// API configuration parameters.
public struct APIConfiguration: Sendable {
    private static let allowedJWTExpirationDurationRange: ClosedRange<TimeInterval> = 0...86400 * 180

    /// API users need to create a private key and upload it to App Store Search Ads UI in exchange for client,
    /// team and key identifier. Private key is used to generate a JWT which is then exchanged for an access token
    /// that is used to authenticate the API calls.
    private let privateKeySource: PrivateKeySource

    /// `URLSession` to use to perform the requests.
    public let session: URLSession
    /// You receive your client identifier when you upload a public key to App Store Search Ads UI.
    public let clientIdentifier: String
    /// You receive your team identifier when you upload a public key to App Store Search Ads UI.
    public let teamIdentifier: String
    /// You receive your key identifier when you upload a public key to App Store Search Ads UI.
    public let keyIdentifier: String
    /// Defines the JWT expiration duration, which may not exceed 180 days.
    public let jwtExpirationDuration: TimeInterval

    /// Create an instance of `APIConfiguration`.
    ///
    /// - Parameters:
    ///     - clientIdentifier: You receive your client identifier when you upload a public key.
    ///     - teamIdentifier: You receive your team identifier when you upload a public key.
    ///     - keyIdentifier: You receive your key identifier when you upload a public key.
    ///     - privateKey: API users need to create a private key and upload it to App Store Search Ads UI.
    ///     - session: `URLSession` to use to perform the requests.
    ///     - jwtExpirationDuration: Defines the JWT expiration duration, which may not exceed 180 days.
    public init(
        clientIdentifier: String,
        teamIdentifier: String,
        keyIdentifier: String,
        privateKey: String,
        session: URLSession = .shared,
        jwtExpirationDuration: TimeInterval = 86400
    ) {
        self.privateKeySource = .derContents(privateKey)
        self.jwtExpirationDuration = jwtExpirationDuration
        self.clientIdentifier = clientIdentifier
        self.teamIdentifier = teamIdentifier
        self.keyIdentifier = keyIdentifier
        self.session = session
    }

    /// Create an instance of `APIConfiguration`.
    ///
    /// - Parameters:
    ///     - clientIdentifier: You receive your client identifier when you upload a public key.
    ///     - teamIdentifier: You receive your team identifier when you upload a public key.
    ///     - keyIdentifier: You receive your key identifier when you upload a public key.
    ///     - privateKeyURL: API users need to create a private key and upload it to App Store Search Ads UI.
    ///     - session: `URLSession` to use to perform the requests.
    ///     - jwtExpirationDuration: Defines the JWT expiration duration, which may not exceed 180 days.
    public init(
        clientIdentifier: String,
        teamIdentifier: String,
        keyIdentifier: String,
        privateKeyURL: URL,
        session: URLSession = .shared,
        jwtExpirationDuration: TimeInterval = 86400
    ) {
        self.privateKeySource = .pemURL(privateKeyURL)
        self.jwtExpirationDuration = jwtExpirationDuration
        self.clientIdentifier = clientIdentifier
        self.teamIdentifier = teamIdentifier
        self.keyIdentifier = keyIdentifier
        self.session = session
    }

    var privateKey: P256.Signing.PrivateKey {
        get throws {
            guard Self.allowedJWTExpirationDurationRange ~= jwtExpirationDuration else {
                throw JWT.Error.invalidExpirationDuration
            }
            switch privateKeySource {
            case .derContents(let privateKey):
                guard let base64Key = Data(base64Encoded: privateKey) else {
                    throw JWT.Error.invalidBase64EncodedPrivateKey
                }
                return try P256.Signing.PrivateKey(derRepresentation: base64Key)
            case .pemURL(let privateKeyURL):
                let pemEncodedPrivateKey = try String(contentsOf: privateKeyURL)
                return try P256.Signing.PrivateKey(pemRepresentation: pemEncodedPrivateKey)
            }
        }
    }
}
