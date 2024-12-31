/// The order of grouped results.
public struct Sorting<Root: CodingKeysContaining>: Codable, Equatable, Sendable {
    public enum Order: String, Codable, Equatable, Sendable {
        /// Grouped results are ordered in ascending order.
        case ascending = "ASCENDING"
        /// Grouped results are ordered in descending order.
        case descending = "DESCENDING"
    }

    /// The name of a field.
    public let field: Root.CodingKeys
    /// The order of grouped results.
    public let sortOrder: Order

    public init(field: Root.CodingKeys, sortOrder: Order) {
        self.field = field
        self.sortOrder = sortOrder
    }

    enum CodingKeys: String, CodingKey {
        case field
        case sortOrder
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        field = try container.decodeCodingKey(forKey: .field, type: Root.self)
        sortOrder = try container.decode(Order.self, forKey: .sortOrder)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeCodingKey(field, forKey: .field, type: Root.self)
        try container.encode(sortOrder, forKey: .sortOrder)
    }
}
