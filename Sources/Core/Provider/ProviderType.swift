import Foundation

protocol ProviderType: Sendable {
    func requestData<Request: RequestType>(from request: Request) async throws -> Response<Data>
}

extension ProviderType {
    func requestModel<Request: RequestType, Model: Decodable>(
        from request: Request,
        type: Model.Type = Model.self,
        decoder: JSONDecoder = .default
    ) async throws -> Response<Model> {
        do {
            let response = try await requestData(from: request)
            return try response.jsonDecoding(Model.self)
        } catch {
            throw APIError(error: error)
        }
    }

    func requestDataModel<Request: RequestType, Model: Decodable>(
        from request: Request,
        type: Model.Type = Model.self,
        decoder: JSONDecoder = .default
    ) async throws -> Response<Model> {
        try await requestModel(from: request, type: DataResponse<Model>.self).map(\.data)
    }

    func requestPaginatedModel<Request: RequestType, Model: Decodable>(
        from request: Request,
        type: Model.Type = Model.self,
        decoder: JSONDecoder = .default
    ) async throws -> Response<Paginated<Model>> {
        try await requestModel(from: request, type: Paginated<Model>.self)
    }

    func requestPaginatedObject<Request: RequestType, Model: Decodable>(
        from request: Request,
        type: Model.Type = Model.self,
        decoder: JSONDecoder = .default
    ) async throws -> Response<PaginatedObject<Model>> {
        try await requestModel(from: request, type: PaginatedObject<Model>.self)
    }
}
