import Foundation

struct AuthorizationInjector: PluginType {
    typealias TokenProvider = @Sendable () async throws -> AccessToken

    private let provider: TokenProvider

    init(provider: @escaping TokenProvider) {
        self.provider = provider
    }

    func prepare(request: URLRequest) async throws -> URLRequest {
        let token = try await provider()
        let header = ["Authorization": "\(token.tokenType) \(token.token)"]

        return request.adding(headers: header, replace: true)
    }
}
