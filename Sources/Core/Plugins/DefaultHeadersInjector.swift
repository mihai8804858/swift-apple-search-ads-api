import Foundation

struct DefaultHeadersInjector: PluginType {
    private let headersInjector: HeadersInjector

    init() {
        headersInjector = HeadersInjector(strategy: .append, headers: defaultHTTPHeaders)
    }

    func prepare(request: inout URLRequest) async throws {
        try await headersInjector.prepare(request: &request)
    }
}
