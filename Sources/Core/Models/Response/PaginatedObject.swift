/// A container for paginated API responses.
public struct PaginatedObject<T: Sendable, P: Page>: Sendable {
    /// Response data that the API provides.
    public let data: T
    /// Page detail information that the API provides.
    public let pagination: P

    public init(data: T, pagination: P) {
        self.data = data
        self.pagination = pagination
    }
}

extension PaginatedObject: Decodable where T: Decodable, P: Decodable {}
extension PaginatedObject: Encodable where T: Encodable, P: Encodable {}
extension PaginatedObject: Equatable where T: Equatable, P: Equatable {}
extension PaginatedObject: Hashable where T: Hashable, P: Hashable {}
