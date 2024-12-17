import Foundation

struct DefaultHeadersInjector: PluginType {
    private let headersInjector: HeadersInjector

    init() {
        headersInjector = HeadersInjector(strategy: .append, headers: defaultHTTPHeaders)
    }

    func prepare(request: URLRequest) async throws -> URLRequest {
        try await headersInjector.prepare(request: request)
    }
}
