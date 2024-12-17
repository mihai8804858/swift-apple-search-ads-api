import Foundation

struct HostInjector: PluginType {
    func prepare(request: URLRequest) async throws -> URLRequest {
        guard let url = request.url,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let host = components.host else { return request }
        return request.adding(headers: ["Host": host], replace: true)
    }
}
