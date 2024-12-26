/// A container for paginated API responses.
public struct Paginated<T: Sendable>: Sendable {
    /// Response data that the API provides.
    public let data: [T]
    /// Page detail information that the API provides.
    public let pagination: PageDetail

    public init(data: [T], pagination: PageDetail) {
        self.data = data
        self.pagination = pagination
    }
}

extension Paginated: Decodable where T: Decodable {}
extension Paginated: Encodable where T: Encodable {}
extension Paginated: Equatable where T: Equatable {}
