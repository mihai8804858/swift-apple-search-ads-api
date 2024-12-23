import Foundation

struct ContextInjector: PluginType {
    typealias UserACLProvider = @Sendable () async throws -> [UserACL]

    private let provider: UserACLProvider

    init(provider: @escaping UserACLProvider) {
        self.provider = provider
    }

    func prepare(request: inout URLRequest) async throws {
        guard let acl = try await provider().first else { return }
        let header = ["X-AP-Context": "orgId=\(acl.orgId)"]
        request.add(headers: header, replace: true)
    }
}
