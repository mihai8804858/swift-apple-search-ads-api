/// The Impression Share report request body.
public struct CustomReportRequest: Codable, Equatable, Sendable {
    /// The date range of the report request.
    public enum DateRange: String, Codable, Equatable, Sendable {
        case lastWeek = "LAST_WEEK"
        case last2Weeks = "LAST_2_WEEKS"
        case last4Weeks = "LAST_4_WEEKS"
    }

    /// A free-text field. The maximum length is 50 characters.
    public let name: String
    /// The start time of the report. The format is YYYY-MM-DD, such as 2024-06-01.
    public let startTime: String
    /// The end time of the report. The format is YYYY-MM-DD, such as 2024-06-30.
    public let endTime: String
    /// The date range of the report request.
    ///
    /// A date range is required only when using `WEEKLY` granularity in Impression Share Report.
    public let dateRange: DateRange
    /// The report data organized by day or week.
    ///
    /// Impression Share reports with a `WEEKLY` granularity value can’t have
    /// custom `startTime` and `endTime` in the request payload.
    public let granularity: CustomReportGranularity
    /// Selector is an optional parameter to filter API results using the `countryOrRegion` and `adamId` fields.
    ///
    /// For `countryOrRegion`, use an alpha-2 country code value.
    /// The `IN` operator is available to use with Impression Share reports.
    /// See `SovCondition` for selector descriptions and see `Selector` for structural guidance with selectors.
    public let selector: CustomReportSelector

    public init(
        name: String,
        startTime: String,
        endTime: String,
        dateRange: DateRange,
        granularity: CustomReportGranularity,
        selector: CustomReportSelector
    ) {
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.dateRange = dateRange
        self.granularity = granularity
        self.selector = selector
    }
}
