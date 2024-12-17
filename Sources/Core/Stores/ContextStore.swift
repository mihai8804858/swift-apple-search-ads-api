import Foundation

actor ContextStore: Sendable {
    private let provider: Provider
    private var cachedUserACL: APIResponse<DataResponse<[UserACL]>>?
    private var cachedMeDetail: APIResponse<DataResponse<MeDetail>>?

    init(token: @escaping AuthorizationInjector.TokenProvider) {
        self.provider = Provider(
            baseURL: URL(string: "https://api.searchads.apple.com")!,
            plugins: [
                HostInjector(),
                DefaultHeadersInjector(),
                AuthorizationInjector(provider: token)
            ],
            retryBehavior: RetryBehavior(
                maxAttempts: 5,
                errorPredicate: \.isConnectionLost,
                recovery: { _ in }
            )
        )
    }

    func userACL() async throws -> APIResponse<DataResponse<[UserACL]>> {
        if let cachedUserACL { return cachedUserACL }
        let acl = try await requestUserACL()
        cachedUserACL = acl

        return acl
    }

    func meDetail() async throws -> APIResponse<DataResponse<MeDetail>> {
        if let cachedMeDetail { return cachedMeDetail }
        let detail = try await requestMeDetail()
        cachedMeDetail = detail

        return detail
    }

    // MARK: - Private

    private func requestUserACL() async throws -> APIResponse<DataResponse<[UserACL]>> {
        try await provider.requestModel(
            from: UserACLRequest(),
            type: DataResponse<[UserACL]>.self,
            decoder: JSONDecoder.default
        )
    }

    private func requestMeDetail() async throws -> APIResponse<DataResponse<MeDetail>> {
        try await provider.requestModel(
            from: MeDetailsRequest(),
            type: DataResponse<MeDetail>.self,
            decoder: JSONDecoder.default
        )
    }
}

private struct UserACLRequest: RequestType {
    let path = "/api/v5/acls"
    let method = HTTPMethod.get
    let task = RequestTask.plain
}

private struct MeDetailsRequest: RequestType {
    let path = "/api/v5/me"
    let method = HTTPMethod.get
    let task = RequestTask.plain
}
