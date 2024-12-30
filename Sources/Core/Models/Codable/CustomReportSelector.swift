/// Selector is an optional parameter to filter API results using the `countryOrRegion` and `adamId` fields.
///
/// For `countryOrRegion`, use alpha-2 country code values.
/// The `IN` operator is available to use with Impression Share reports.
/// See `SovCondition` for selector descriptions and see `Selector` for structural guidance with selectors.
public struct CustomReportSelector: Codable, Equatable, Sendable {
    /// A list of condition objects that allow users to filter a list of records.
    public let conditions: [SovCondition]?

    public init(conditions: [SovCondition]? = nil) {
        self.conditions = conditions
    }
}
