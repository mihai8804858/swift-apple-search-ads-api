import Foundation
@preconcurrency import Crypto

struct JWT: Equatable, Codable, Sendable {
    struct Header: Equatable, Codable, Sendable {
        enum CodingKeys: String, CodingKey {
            case algorithm = "alg"
            case keyIdentifier = "kid"
        }

        let algorithm = "ES256"
        let keyIdentifier: String
    }

    struct Payload: Equatable, Codable, Sendable {
        enum CodingKeys: String, CodingKey {
            case subject = "sub"
            case issuer = "iss"
            case audience = "aud"
            case issuedTime = "iat"
            case expirationTime = "exp"
        }

        let audience: String
        let subject: String
        let issuer: String
        let issuedTime: TimeInterval
        let expirationTime: TimeInterval
    }

    enum Error: Swift.Error, LocalizedError, Sendable {
        case invalidBase64EncodedPrivateKey
        case invalidDigest
        case invalidExpirationDuration
        case invalidPrivateKey

        var localizedDescription: String {
            switch self {
            case .invalidBase64EncodedPrivateKey: "The private key is not encoded in Base64 format"
            case .invalidDigest: "Failed to generate a digest"
            case .invalidExpirationDuration: "The expiration duration must be between 0 and 20 minutes (1200 seconds)"
            case .invalidPrivateKey: "The private key is not valid"
            }
        }
    }

    let header: Header
    let clientIdentifier: String
    let teamIdentifier: String
    let audience: String
    let expireDuration: TimeInterval

    init(
        clientIdentifier: String,
        teamIdentifier: String,
        keyIdentifier: String,
        audience: String,
        expireDuration: TimeInterval
    ) {
        self.header = Header(keyIdentifier: keyIdentifier)
        self.clientIdentifier = clientIdentifier
        self.teamIdentifier = teamIdentifier
        self.audience = audience
        self.expireDuration = expireDuration
    }

    func signedToken(using privateKey: P256.Signing.PrivateKey) throws -> String {
        let rawDigest = try digest()
        guard let digest = rawDigest.data(using: .utf8) else { throw JWT.Error.invalidDigest }
        let signature = try privateKey.signature(for: digest)
        let encoded = signature.rawRepresentation.base64URLEncoded()

        return "\(rawDigest).\(encoded)"
    }

    // MARK: - Private

    private func digest() throws -> String {
        let issuedTime = Date()
        let expirationTime = issuedTime.addingTimeInterval(expireDuration)
        let payload = Payload(
            audience: audience,
            subject: clientIdentifier,
            issuer: teamIdentifier,
            issuedTime: issuedTime.timeIntervalSince1970,
            expirationTime: expirationTime.timeIntervalSince1970
        )
        let headerString = try JSONEncoder.default.encode(header).base64URLEncoded()
        let payloadString = try JSONEncoder.default.encode(payload).base64URLEncoded()

        return "\(headerString).\(payloadString)"
    }
}

extension Data {
    func base64URLEncoded() -> String {
        base64EncodedString()
            .replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }
}
