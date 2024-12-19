/// The order of grouped results.
public struct Sorting: Codable, Equatable, Sendable {
    public enum Order: String, Codable, Equatable, Sendable {
        /// Grouped results are ordered in ascending order.
        case ascending = "ASCENDING"
        /// Grouped results are ordered in descending order.
        case descending = "DESCENDING"
    }

    /// The name of a field.
    public let field: String
    /// The order of grouped results.
    public let sortOrder: Order

    public init(field: String, sortOrder: Order) {
        self.field = field
        self.sortOrder = sortOrder
    }
}
