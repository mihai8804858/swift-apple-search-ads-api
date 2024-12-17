public struct PaginatedDataResponse<T: Decodable & Sendable>: Decodable, Sendable {
    public let data: T
    public let pagination: PageDetail

    public init(data: T, pagination: PageDetail) {
        self.data = data
        self.pagination = pagination
    }
}

extension PaginatedDataResponse: Equatable where T: Equatable {}
