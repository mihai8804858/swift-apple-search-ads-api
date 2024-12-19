/// The list of condition objects that allow users to filter a list of records.
///
/// The Condition object functionality is similar to the `WHERE` clause in `SQL`.
public struct Condition: Codable, Equatable, Sendable {
    public enum Operator: String, Codable, Equatable, Sendable {
        /// The attribute matches the values within a specified range. The values can be numbers, text, or dates.
        case between = "BETWEEN"
        /// The attribute matches the value in the specified list.
        case contains = "CONTAINS"
        /// The attribute has all of the values in the specified list. The attribute must be a collection type.
        case containsAll = "CONTAINS_ALL"
        /// The attribute contains any of the values in the specified list. The attribute must be a collection type.
        case containsAny = "CONTAINS_ANY"
        /// The attribute matches the suffix of a string.
        case endsWidth = "ENDSWITH"
        /// The attribute contains exact values.
        case equals = "EQUALS"
        /// The value is greater than the specified value. You can use this attribute with time parameters.
        case greaterThan = "GREATER_THAN"
        /// The attribute matches any value in a list of specified values.
        case `in` = "IN" // swiftlint:disable:this identifier_name
        /// The value is less than the specified value. You can use this attribute with time parameters.
        case lessThan = "LESS_THAN"
        /// The attribute matches the prefix of a string.
        case startsWith = "STARTSWITH"
    }

    /// The name of a field.
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
