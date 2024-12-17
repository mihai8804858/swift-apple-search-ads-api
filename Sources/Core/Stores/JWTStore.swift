import Foundation

actor JWTStore: Sendable {
    private let configuration: APIConfiguration
    private let jwtSigner: JWT
    private var cachedToken: JWT.Token?

    init(configuration: APIConfiguration, audience: String) {
        self.configuration = configuration
        self.jwtSigner = JWT(
            clientIdentifier: configuration.clientIdentifier,
            teamIdentifier: configuration.teamIdentifier,
            keyIdentifier: configuration.keyIdentifier,
            audience: audience,
            expireDuration: configuration.jwtExpirationDuration
        )
    }

    func jwt() throws -> JWT.Token {
        if let cachedToken, !cachedToken.isExpired { return cachedToken }
        let token = try jwtSigner.signedToken(using: configuration.privateKey)
        cachedToken = token

        return token
    }
}
