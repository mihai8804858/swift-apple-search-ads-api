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

    func requestData<R: RequestType>(from request: R) async throws -> APIResponse<Data> {
        try await withExponentialBackoff {
            try await withRetryBehavior(retryBehavior) {
                try await sendRequest(request.urlRequest(baseURL: baseURL))
            }
        }
    }

    func requestModel<R: RequestType, Model: Decodable, Decoder: TopLevelDecoder>(
        from request: R,
        type: Model.Type = Model.self,
        decoder: Decoder
    ) async throws -> APIResponse<Model> where Decoder.Input == Data {
        do {
            let response = try await requestData(from: request)
            return try response.decoding(Model.self, decoder: decoder)
        } catch {
            throw APIError(error: error)
        }
    }

    // MARK: - Private

    private func sendRequest(_ request: URLRequest) async throws -> APIResponse<Data> {
        do {
            let request = try await prepare(request: request)
            let (data, response) = try await urlSession.data(for: request)
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? ResponseStatus.success.code
            let apiResponse = APIResponse(model: data, statusCode: statusCode)
            return try apiResponse.validatingStatusCode()
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
