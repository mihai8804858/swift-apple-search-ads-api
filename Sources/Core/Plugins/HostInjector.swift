import Foundation

struct HostInjector: PluginType {
    func prepare(request: inout URLRequest) async throws {
        guard let url = request.url,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let host = components.host else { return }
        request.add(headers: ["Host": host], replace: true)
    }
}
