import Foundation

actor AccessTokenStore: Sendable {
    private let configuration: APIConfiguration
    private let provider: Provider
    private let jwtStore: JWTStore
    private var cachedToken: Response<AccessToken>?
    private var creationDate: Date?

    init(configuration: APIConfiguration, jwtAudience: String) {
        self.configuration = configuration
        self.jwtStore = JWTStore(configuration: configuration, audience: jwtAudience)
        self.provider = Provider(
            baseURL: URL(string: "https://appleid.apple.com")!,
            plugins: [
                HostInjector(),
                AcceptHeadersInjector()
            ],
            retryBehavior: RetryBehavior(
                maxAttempts: 3,
                errorPredicate: \.isConnectionLost,
                recovery: { _ in }
            )
        )
    }

    func token() async throws -> Response<AccessToken> {
        if let cachedToken,
           let creationDate,
           !cachedToken.model.isExpired(createdAt: creationDate) { return cachedToken }
        let jwt = try await jwtStore.jwt()
        let token = try await requestToken(jwt: jwt)
        creationDate = Date()
        cachedToken = token

        return token
    }

    func refreshToken() async throws {
        cachedToken = nil
        creationDate = nil
        _ = try await token()
    }

    // MARK: - Private

    private func requestToken(jwt: String) async throws -> Response<AccessToken> {
        try await provider.requestModel(from: AccessTokenRequest(parameters: AccessTokenParameters(
            clientID: configuration.clientIdentifier,
            clientSecret: jwt
        )))
    }
}
