/// A container for paginated API responses.
public struct Paginated<T: Decodable & Sendable>: Decodable, Sendable {
    /// Response data that the API provides.
    public let data: T
    /// Page detail information that the API provides.
    public let pagination: PageDetail

    /// Create an instance of `Paginated`.
    ///
    /// - Parameters:
    ///     - data: Response data that the API provides.
    ///     - pagination: Page detail information that the API provides.
    public init(data: T, pagination: PageDetail) {
        self.data = data
        self.pagination = pagination
    }
}

extension Paginated: Equatable where T: Equatable {}
