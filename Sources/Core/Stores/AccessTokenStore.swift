import Foundation

actor AccessTokenStore: Sendable {
    private let configuration: APIConfiguration
    private let provider: Provider
    private let jwtStore: JWTStore
    private var cachedToken: APIResponse<AccessToken>?
    private var creationDate: Date?

    init(configuration: APIConfiguration, jwtAudience: String) {
        self.configuration = configuration
        self.jwtStore = JWTStore(configuration: configuration, audience: jwtAudience)
        self.provider = Provider(
            baseURL: URL(string: "https://appleid.apple.com")!,
            plugins: [
                HostInjector(),
                DefaultHeadersInjector()
            ],
            retryBehavior: RetryBehavior(
                maxAttempts: 5,
                errorPredicate: \.isConnectionLost,
                recovery: { _ in }
            )
        )
    }

    func token() async throws -> APIResponse<AccessToken> {
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

    private func requestToken(jwt: String) async throws -> APIResponse<AccessToken> {
        let request = AccessTokenRequest(clientIdentifier: configuration.clientIdentifier, clientSecret: jwt)
        return try await provider.requestModel(from: request, decoder: JSONDecoder.default)
    }
}

private struct AccessTokenRequest: RequestType {
    let path = "/auth/oauth2/token"
    let method = HTTPMethod.post
    let task: RequestTask

    init(clientIdentifier: String, clientSecret: String) {
        self.task = .parameterized(EncodedParameters(
            encoding: URLEncoding.queryString,
            parameters: URLParameters([
                "grant_type": "client_credentials",
                "scope": "searchadsorg",
                "client_id": clientIdentifier,
                "client_secret": clientSecret
            ])
        ))
    }
}
