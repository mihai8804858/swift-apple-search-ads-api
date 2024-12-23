import Foundation

struct AuthorizationInjector: PluginType {
    typealias TokenProvider = @Sendable () async throws -> AccessToken

    private let provider: TokenProvider

    init(provider: @escaping TokenProvider) {
        self.provider = provider
    }

    func prepare(request: inout URLRequest) async throws {
        let token = try await provider()
        let value = "\(token.tokenType) \(token.token)"
        request.add(header: "Authorization", value: value, replace: true)
    }
}
