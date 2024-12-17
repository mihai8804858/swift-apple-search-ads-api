import Foundation

public actor APIProvider: Sendable {
    private let configuration: APIConfiguration
    private let accessTokenStore: AccessTokenStore
    private let contextStore: ContextStore
    private let provider: Provider

    public init(configuration: APIConfiguration) {
        let accessTokenStore = AccessTokenStore(configuration: configuration, jwtAudience: "https://appleid.apple.com")
        let contextStore = ContextStore { try await accessTokenStore.token().model }
        let provider = Provider(
            baseURL: URL(string: "https://api.searchads.apple.com")!,
            plugins: [
                HostInjector(),
                DefaultHeadersInjector(),
                ContextInjector { try await contextStore.userACL().model.data },
                AuthorizationInjector { try await accessTokenStore.token().model }
            ],
            retryBehavior: RetryBehavior(
                maxAttempts: 5,
                errorPredicate: { $0.isUnauthorized || $0.isConnectionLost },
                recovery: { error in
                    if error.isUnauthorized {
                        try await accessTokenStore.refreshToken()
                    }
                }
            )
        )
        self.configuration = configuration
        self.accessTokenStore = accessTokenStore
        self.contextStore = contextStore
        self.provider = provider
    }

    public func getAccessToken() async throws -> APIResponse<AccessToken> {
        try await accessTokenStore.token()
    }

    public func getUserACL() async throws -> APIResponse<DataResponse<[UserACL]>> {
        try await contextStore.userACL()
    }

    public func getMeDetail() async throws -> APIResponse<DataResponse<MeDetail>> {
        try await contextStore.meDetail()
    }
}
