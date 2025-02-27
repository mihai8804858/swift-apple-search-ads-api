import Foundation

actor JWTStore {
    private let configuration: APIConfiguration
    private let jwtSigner: JWT
    private var cachedToken: String?

    init(
        configuration: APIConfiguration,
        audience: String,
        issuedTime: @escaping @Sendable () -> Date = { Date() }
    ) {
        self.configuration = configuration
        self.jwtSigner = JWT(
            clientIdentifier: configuration.clientIdentifier,
            teamIdentifier: configuration.teamIdentifier,
            keyIdentifier: configuration.keyIdentifier,
            audience: audience,
            expireDuration: configuration.jwtExpirationDuration,
            issuedTime: issuedTime
        )
    }

    func jwt() throws -> String {
        if let cachedToken, !cachedToken.isJWTExpired { return cachedToken }
        let token = try jwtSigner.signed(using: configuration.privateKey)
        cachedToken = token

        return token
    }
}
