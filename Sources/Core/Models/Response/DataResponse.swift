struct DataResponse<T: Decodable & Sendable>: Decodable, Sendable {
    let data: T
}

extension DataResponse: Equatable where T: Equatable {}
