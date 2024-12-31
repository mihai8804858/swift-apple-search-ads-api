@preconcurrency import AnyCodable

/// The list of condition objects that allow users to filter a list of records.
///
/// The `Condition` object functionality is similar to the `WHERE` clause in `SQL`.
public struct SovCondition<Root: CodingKeysContaining>: Codable, Equatable, Sendable {
    public enum Operator: String, Codable, Equatable, Sendable {
        /// The `IN` operator matches any value in a list of specified values.
        case `in` = "IN"
    }

    /// A list of field names to return within each record.
    public let field: Root.CodingKeys
    /// The operator values compare attributes to a list of specified values.
    public let `operator`: Operator
    /// A list of matching values.
    public let values: [AnyCodable]

    public init<Value: Codable & Equatable & Sendable>(field: Root.CodingKeys, operator: Operator, values: [Value]) {
        self.field = field
        self.operator = `operator`
        self.values = values.map { AnyCodable($0) }
    }

    public init<Value: Codable & Equatable & Sendable>(field: Root.CodingKeys, operator: Operator, value: Value) {
        self.init(field: field, operator: `operator`, values: [value])
    }

    enum CodingKeys: String, CodingKey {
        case field
        case `operator`
        case values
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        field = try container.decodeCodingKey(forKey: .field, type: Root.self)
        values = try container.decode([AnyCodable].self, forKey: .values)
        `operator` = try container.decode(Operator.self, forKey: .operator)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeCodingKey(field, forKey: .field, type: Root.self)
        try container.encode(values, forKey: .values)
        try container.encode(`operator`, forKey: .operator)
    }
}
