import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct ContextInjector: PluginType {
    typealias UserACLProvider = @Sendable () async throws -> [UserACL]

    private let provider: UserACLProvider

    init(provider: @escaping UserACLProvider) {
        self.provider = provider
    }

    func prepare(request: inout URLRequest) async throws {
        guard let acl = try await provider().first else { return }
        request.add(header: "X-Ap-Context", value: "orgId=\(acl.orgId)", replace: true)
    }
}
