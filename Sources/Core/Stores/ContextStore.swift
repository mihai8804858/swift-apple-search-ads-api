import Foundation

actor ContextStore: Sendable {
    private let provider: Provider
    private var cachedUserACL: Response<[UserACL]>?
    private var cachedMeDetail: Response<MeDetail>?

    init(token: @escaping AuthorizationInjector.TokenProvider) {
        self.provider = Provider(
            baseURL: URL(string: "https://api.searchads.apple.com")!,
            plugins: [
                HostInjector(),
                AcceptHeadersInjector(),
                AuthorizationInjector(provider: token)
            ],
            retryBehavior: RetryBehavior(
                maxAttempts: 3,
                errorPredicate: \.isConnectionLost,
                recovery: { _ in }
            )
        )
    }

    func userACL() async throws -> Response<[UserACL]> {
        if let cachedUserACL { return cachedUserACL }
        let acl = try await requestUserACL()
        cachedUserACL = acl

        return acl
    }

    func meDetail() async throws -> Response<MeDetail> {
        if let cachedMeDetail { return cachedMeDetail }
        let detail = try await requestMeDetail()
        cachedMeDetail = detail

        return detail
    }

    // MARK: - Private

    private func requestUserACL() async throws -> Response<[UserACL]> {
        try await provider.requestDataModel(from: UserACLRequest())
    }

    private func requestMeDetail() async throws -> Response<MeDetail> {
        try await provider.requestDataModel(from: MeDetailsRequest())
    }
}
