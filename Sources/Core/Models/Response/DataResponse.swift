struct DataResponse<T: Sendable>: Sendable {
    let data: T
}

extension DataResponse: Decodable where T: Decodable {}
extension DataResponse: Encodable where T: Encodable {}
extension DataResponse: Equatable where T: Equatable {}
extension DataResponse: Hashable where T: Hashable {}
