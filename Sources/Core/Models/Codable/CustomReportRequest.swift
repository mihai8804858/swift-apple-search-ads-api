import Foundation

/// The Impression Share report request body.
public struct CustomReportRequest: Codable, Hashable, Sendable {
    /// The date range of the report request.
    public enum DateRange: String, Codable, Hashable, Sendable {
        case lastWeek = "LAST_WEEK"
        case last2Weeks = "LAST_2_WEEKS"
        case last4Weeks = "LAST_4_WEEKS"
    }

    /// A free-text field. The maximum length is 50 characters.
    public let name: String
    /// The start time of the report. The format is YYYY-MM-DD, such as 2024-06-01.
    public let startTime: Date?
    /// The end time of the report. The format is YYYY-MM-DD, such as 2024-06-30.
    public let endTime: Date?
    /// The date range of the report request.
    ///
    /// A date range is required only when using `WEEKLY` granularity in Impression Share Report.
    public let dateRange: DateRange?
    /// The report data organized by day or week.
    ///
    /// Impression Share reports with a `WEEKLY` granularity value can’t have
    /// custom `startTime` and `endTime` in the request payload.
    public let granularity: CustomReportGranularity?
    /// Selector is an optional parameter to filter API results using the `countryOrRegion` and `adamId` fields.
    ///
    /// For `countryOrRegion`, use an alpha-2 country code value.
    /// The `IN` operator is available to use with Impression Share reports.
    /// See `SovCondition` for selector descriptions and see `Selector` for structural guidance with selectors.
    public let selector: CustomReportSelector?

    public init(
        name: String,
        startTime: Date? = nil,
        endTime: Date? = nil,
        dateRange: DateRange? = nil,
        granularity: CustomReportGranularity? = nil,
        selector: CustomReportSelector? = nil
    ) {
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.dateRange = dateRange
        self.granularity = granularity
        self.selector = selector
    }

    enum CodingKeys: CodingKey {
        case name
        case startTime
        case endTime
        case dateRange
        case granularity
        case selector
    }

    public init(from decoder: any Decoder) throws {
        let formatter = DateFormatter.yearMonthDay
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        startTime = try container.decodeIfPresent(String.self, forKey: .startTime).flatMap(formatter.date(from:))
        endTime = try container.decodeIfPresent(String.self, forKey: .endTime).flatMap(formatter.date(from:))
        dateRange = try container.decodeIfPresent(CustomReportRequest.DateRange.self, forKey: .dateRange)
        granularity = try container.decodeIfPresent(CustomReportGranularity.self, forKey: .granularity)
        selector = try container.decodeIfPresent(CustomReportSelector.self, forKey: .selector)
    }

    public func encode(to encoder: any Encoder) throws {
        let formatter = DateFormatter.yearMonthDay
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(dateRange, forKey: .dateRange)
        try container.encodeIfPresent(granularity, forKey: .granularity)
        try container.encodeIfPresent(selector, forKey: .selector)
        if let startTime { try container.encode(formatter.string(from: startTime), forKey: .startTime) }
        if let endTime { try container.encode(formatter.string(from: endTime), forKey: .endTime) }
    }
}
