/// The list of condition objects that allow users to filter a list of records.
///
/// The `Condition` object functionality is similar to the `WHERE` clause in `SQL`.
public struct SovCondition: Codable, Equatable, Sendable {
    public enum Operator: String, Codable, Equatable, Sendable {
        /// The `IN` operator matches any value in a list of specified values.
        case `in` = "IN"
    }

    /// A list of field names to return within each record.
    public let field: String
    /// The operator values compare attributes to a list of specified values.
    public let `operator`: Operator
    /// A list of matching values.
    public let values: [String]

    public init(field: String, operator: Operator, values: [String]) {
        self.field = field
        self.operator = `operator`
        self.values = values
    }
}
