/// A container for paginated API responses.
public struct Paginated<T: Sendable, Page: Sendable>: Sendable {
    /// Response data that the API provides.
    public let data: [T]
    /// Page detail information that the API provides.
    public let pagination: Page

    public init(data: [T], pagination: Page) {
        self.data = data
        self.pagination = pagination
    }
}

extension Paginated: Decodable where T: Decodable, Page: Decodable {}
extension Paginated: Encodable where T: Encodable, Page: Encodable {}
extension Paginated: Equatable where T: Equatable, Page: Equatable {}
extension Paginated: Hashable where T: Hashable, Page: Hashable {}
