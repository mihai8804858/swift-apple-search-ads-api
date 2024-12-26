import Foundation
import Combine

protocol ProviderType: Sendable {
    func requestData<Request: RequestType>(from request: Request) async throws -> Response<Data>
}

extension ProviderType {
    func requestModel<Request: RequestType, Model: Decodable, Decoder: TopLevelDecoder>(
        from request: Request,
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

    func requestDataModel<Request: RequestType, Model: Decodable, Decoder: TopLevelDecoder>(
        from request: Request,
        type: Model.Type = Model.self,
        decoder: Decoder = JSONDecoder.default
    ) async throws -> Response<Model> where Decoder.Input == Data {
        try await requestModel(from: request, type: DataResponse<Model>.self).map(\.data)
    }

    func requestPaginatedModel<Request: RequestType, Model: Decodable, Decoder: TopLevelDecoder>(
        from request: Request,
        type: Model.Type = Model.self,
        decoder: Decoder = JSONDecoder.default
    ) async throws -> Response<Paginated<Model>> where Decoder.Input == Data {
        try await requestModel(from: request, type: Paginated<Model>.self)
    }
}
