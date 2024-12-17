public struct DataResponse<T: Decodable & Sendable>: Decodable, Sendable {
    public let data: T

    public init(data: T) {
        self.data = data
    }
}

extension DataResponse: Equatable where T: Equatable {}
