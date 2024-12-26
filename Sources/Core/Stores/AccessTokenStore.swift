import Foundation

actor AccessTokenStore: Sendable {
    private let configuration: APIConfiguration
    private let provider: ProviderType
    private let jwtStore: JWTStore
    private var cachedToken: Response<AccessToken>?
    private var creationDate: Date?

    init(configuration: APIConfiguration, jwtStore: JWTStore, provider: ProviderType) {
        self.configuration = configuration
        self.jwtStore = jwtStore
        self.provider = provider
    }

    init(configuration: APIConfiguration, jwtAudience: String) {
        self.init(
            configuration: configuration,
            jwtStore: JWTStore(
                configuration: configuration,
                audience: jwtAudience
            ),
            provider: Provider(
                baseURL: URL(string: "https://appleid.apple.com")!,
                session: configuration.session,
                plugins: [
                    HostInjector(),
                    AcceptHeadersInjector()
                ],
                retryBehavior: .onConnectionLost,
                exponentialBackoffBehavior: .onRetryableError
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
