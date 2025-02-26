/// A container for paginated API responses.
public struct PaginatedObject<T: Sendable>: Sendable {
    /// Response data that the API provides.
    public let data: T
    /// Page detail information that the API provides.
    public let pagination: PageDetail

    public init(data: T, pagination: PageDetail) {
        self.data = data
        self.pagination = pagination
    }
}

extension PaginatedObject: Decodable where T: Decodable {}
extension PaginatedObject: Encodable where T: Encodable {}
extension PaginatedObject: Equatable where T: Equatable {}
extension PaginatedObject: Hashable where T: Hashable {}
