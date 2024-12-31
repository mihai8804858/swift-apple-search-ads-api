/// The selector objects available to filter returned data.
///
/// `Selector` objects define what data the API returns when fetching resources.
/// You use selector objects with find calls and reporting endpoints.
/// | Functionality | Description |
/// | --- | --- |
/// | Filtering | Specifies the criteria to filter the resources that return. |
/// | Sorting | Specifies the criteria to order the resources that return. |
/// | Paginating | Specifies the page segment of resources that return. |
///
/// You can also use `Selector` objects to find archived or soft-deleted campaigns.
/// By default, API fetch calls don’t return deleted resources, with the exception of GET by a resource Id.
/// To retrieve deleted resources, you must explicitly request the call using the selector `Condition`:
/// ```json
/// {
///   "conditions": [
///     {
///       "field": "deleted",
///       "operator": "IN",
///       "values": ["true", "false"]
///     }
///   ]
/// }
/// ```
public struct Selector<Root: CodingKeysContaining>: Codable, Equatable, Sendable {
    /// A list of condition objects that allow users to filter a list of records.
    public let conditions: [Condition<Root>]?
    /// A list of field names to return within each record.
    public let fields: [Root.CodingKeys]?
    /// A list of field names and grouping to sort the records by ASCENDING or DESCENDING.
    public let orderBy: [Sorting<Root>]?
    /// A defined range and limit of the number of returned records.
    public let pagination: Pagination?

    public init(
        conditions: [Condition<Root>]? = nil,
        fields: [Root.CodingKeys]? = nil,
        orderBy: [Sorting<Root>]? = nil,
        pagination: Pagination? = nil
    ) {
        self.conditions = conditions
        self.fields = fields
        self.orderBy = orderBy
        self.pagination = pagination
    }

    enum CodingKeys: String, CodingKey {
        case conditions
        case fields
        case orderBy
        case pagination
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fields = try container.decodeCodingKeysIfPresent(forKey: .fields, type: Root.self)
        conditions = try container.decodeIfPresent([Condition<Root>].self, forKey: .conditions)
        orderBy = try container.decodeIfPresent([Sorting<Root>].self, forKey: .orderBy)
        pagination = try container.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeCodingKeysIfPresent(fields, forKey: .fields, type: Root.self)
        try container.encodeIfPresent(conditions, forKey: .conditions)
        try container.encodeIfPresent(orderBy, forKey: .orderBy)
        try container.encodeIfPresent(pagination, forKey: .pagination)
    }
}
