import Foundation

struct ContextInjector: PluginType {
    typealias UserACLProvider = @Sendable () async throws -> [UserACL]

    private let provider: UserACLProvider

    init(provider: @escaping UserACLProvider) {
        self.provider = provider
    }

    func prepare(request: URLRequest) async throws -> URLRequest {
        guard let acl = try await provider().first else { return request }
        let header = ["X-AP-Context": "orgId=\(acl.orgId)"]

        return request.adding(headers: header, replace: true)
    }
}
