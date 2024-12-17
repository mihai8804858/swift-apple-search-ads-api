import Foundation
import Combine

actor Provider: Sendable {
    let baseURL: URL
    let plugins: [PluginType]
    let urlSession: URLSession
    let retryBehavior: RetryBehavior

    init(
        baseURL: URL,
        urlSession: URLSession = .shared,
        plugins: [PluginType] = [],
        retryBehavior: RetryBehavior = .none
    ) {
        self.baseURL = baseURL
        self.plugins = plugins
        self.urlSession = urlSession
        self.retryBehavior = retryBehavior
    }

    func requestData<R: RequestType>(from request: R) async throws -> Response<Data> {
        try await withExponentialBackoff {
            try await withRetryBehavior(retryBehavior) {
                try await performRequest(request)
            }
        }
    }

    func requestModel<R: RequestType, Model: Decodable, Decoder: TopLevelDecoder>(
        from request: R,
        type: Model.Type = Model.self,
        decoder: Decoder = JSONDecoder.default
    ) async throws -> Response<Model> where Decoder.Input == Data {
        do {
            let response = try await requestData(from: request)
            return try response.decoding(Model.self, decoder: decoder)
        } catch {
            throw APIError(error: error)
        }
    }

    func requestDataModel<R: RequestType, Model: Decodable, Decoder: TopLevelDecoder>(
        from request: R,
        type: Model.Type = Model.self,
        decoder: Decoder = JSONDecoder.default
    ) async throws -> Response<Model> where Decoder.Input == Data {
        try await requestModel(from: request, type: DataResponse<Model>.self).map(\.data)
    }

    func requestPaginatedModel<R: RequestType, Model: Decodable, Decoder: TopLevelDecoder>(
        from request: R,
        type: Model.Type = Model.self,
        decoder: Decoder = JSONDecoder.default
    ) async throws -> Response<Paginated<Model>> where Decoder.Input == Data {
        try await requestModel(from: request, type: Paginated<Model>.self)
    }

    // MARK: - Private

    private func performRequest<R: RequestType>(_ request: R) async throws -> Response<Data> {
        do {
            let request = try await prepare(request: request.urlRequest(baseURL: baseURL))
            let (data, urlResponse) = try await urlSession.data(for: request)
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode ?? ResponseStatus.success.code
            let response = Response(model: data, statusCode: statusCode)
            return try response.validatingStatusCode()
        } catch {
            throw APIError(error: error)
        }
    }

    private func prepare(request: URLRequest) async throws -> URLRequest {
        var request = request
        for plugin in plugins {
            request = try await plugin.prepare(request: request)
        }

        return request
    }
}
