import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct HostInjector: PluginType {
    func prepare(request: inout URLRequest) async throws {
        guard let url = request.url,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let host = components.host else { return }
        request.add(header: "Host", value: host, replace: true)
    }
}
