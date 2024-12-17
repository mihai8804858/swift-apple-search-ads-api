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
public struct Selector: Encodable, Equatable, Sendable {
    /// A list of condition objects that allow users to filter a list of records.
    public let conditions: [Condition]?
    /// A list of field names to return within each record.
    public let fields: [String]?
    /// A list of field names and grouping to sort the records by ASCENDING or DESCENDING.
    public let orderBy: [Sorting]?
    /// A defined range and limit of the number of returned records.
    public let pagination: Pagination?

    /// Create an instance of `Pagination`.
    ///
    /// - Parameters:
    ///     - conditions: A list of condition objects that allow users to filter a list of records.
    ///     - fields: A list of field names to return within each record.
    ///     - orderBy: A list of field names and grouping to sort the records by ASCENDING or DESCENDING.
    ///     - pagination: A defined range and limit of the number of returned records.
    public init(
        conditions: [Condition]? = nil,
        fields: [String]? = nil,
        orderBy: [Sorting]? = nil,
        pagination: Pagination? = nil
    ) {
        self.conditions = conditions
        self.fields = fields
        self.orderBy = orderBy
        self.pagination = pagination
    }
}
