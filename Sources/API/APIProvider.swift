import Foundation

/// The main object used to interface with the Apple Search Ads API.
public actor APIProvider: Sendable {
    let configuration: APIConfiguration
    let accessTokenStore: AccessTokenStore
    let contextStore: ContextStore
    let provider: Provider

    /// Create an instance of `APIProvider`.
    ///
    /// - Parameters:
    ///     - configuration: API configuration parameters.
    public init(configuration: APIConfiguration) {
        let accessTokenStore = AccessTokenStore(
            configuration: configuration,
            jwtAudience: "https://appleid.apple.com"
        )
        let contextStore = ContextStore {
            try await accessTokenStore.token().model
        }
        let provider = Provider(
            baseURL: URL(string: "https://api.searchads.apple.com")!,
            plugins: [
                HostInjector(),
                AcceptHeadersInjector(),
                ContextInjector { try await contextStore.userACL().model },
                AuthorizationInjector { try await accessTokenStore.token().model }
            ],
            retryBehavior: RetryBehavior(
                maxAttempts: 3,
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
}
