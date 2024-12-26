import Foundation

actor Provider: ProviderType {
    let baseURL: URL
    let session: SessionType
    let plugins: [PluginType]
    let retryBehavior: RetryBehavior
    let exponentialBackoffBehavior: ExponentialBackoffBehavior

    init(
        baseURL: URL,
        session: SessionType,
        plugins: [PluginType],
        retryBehavior: RetryBehavior,
        exponentialBackoffBehavior: ExponentialBackoffBehavior
    ) {
        self.baseURL = baseURL
        self.plugins = plugins
        self.session = session
        self.retryBehavior = retryBehavior
        self.exponentialBackoffBehavior = exponentialBackoffBehavior
    }

    func requestData<R: RequestType>(from request: R) async throws -> Response<Data> {
        try await withExponentialBackoff(exponentialBackoffBehavior) {
            try await withRetryBehavior(retryBehavior) {
                try await perform(request: request)
            }
        }
    }

    func perform<R: RequestType>(request: R) async throws -> Response<Data> {
        do {
            let request = try await prepare(request: request)
            let (data, urlResponse) = try await session.data(for: request)
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode ?? ResponseStatus.success.rawValue
            let response = Response(model: data, statusCode: ResponseStatus(rawValue: statusCode))
            return try response.validatingStatusCode()
        } catch {
            throw APIError(error: error)
        }
    }

    func prepare<R: RequestType>(request: R) async throws -> URLRequest {
        var urlRequest = try request.urlRequest(baseURL: baseURL)
        for plugin in plugins {
            try await plugin.prepare(request: &urlRequest)
        }

        return urlRequest
    }
}
