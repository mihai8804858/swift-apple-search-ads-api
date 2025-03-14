import Foundation

/// A container for Impression Share report metrics.
public struct CustomReport: Codable, Hashable, Sendable, CodingKeysContaining, Identifiable {
    /// The state of the report.
    public enum State: String, Codable, Hashable, Sendable {
        case queued = "QUEUED"
        case pending = "PENDING"
        case completed = "COMPLETED"
        case failed = "FAILED"
    }

    /// The report dimension.
    public enum Dimension: String, Codable, Hashable, Sendable {
        case adamId
        case appName
        case countryOrRegion
        case searchTerm
    }

    /// The report metric.
    public enum Metric: String, Codable, Hashable, Sendable {
        /// If impression share is 11–20%, `lowImpressionShare` is 0.11 and `highImpressionShare` is 0.2.
        case lowImpressionShare
        /// If impression share is 91–100%, `lowImpressionShare` is 0.91 and `highImpressionShare` is 1.
        case highImpressionShare
        /// The ranking of your app in terms of impression share compared to other apps in the same countries / regions.
        /// The rank displays from `ONE` to `FIVE` or `GREATER_THAN_FIVE`, with `ONE` being the highest rank.
        case rank
        /// The total search volume of keyword popularity. The popularity of search terms is based on country or region.
        /// The ranking is 1–5, with 5 as the most search volume.
        case searchPopularity
    }

    /// The report id is a unique identifier per report.
    public let id: Int?
    /// A free-text field. The maximum length is 50 characters.
    public let name: String?
    /// The state of the report.
    ///
    /// A value of `COMPLETED` has a report link in the `downloadUri` field.
    public let state: State?
    /// The start time of the report. The format is YYYY-MM-DD, such as 2024-06-01.
    public let startTime: Date?
    /// The end time of the report. The format is YYYY-MM-DD, such as 2024-06-30.
    public let endTime: Date?
    /// The date range of the report.
    ///
    /// A date range is required only when using `WEEKLY` granularity in Impression Share Report.
    public let dateRange: CustomReportDateRange?
    /// The timestamp for the creation of the report.
    public let creationTime: Date?
    /// The most recent timestamp of report modifications
    public let modificationTime: Date?
    /// The report data organized by day or week.
    public let granularity: CustomReportGranularity?
    /// The report dimensions.
    public let dimensions: [Dimension]?
    /// Impression Share is a daily aggregation with a range in deciles, such as 11–20% and 21–30%.
    ///
    /// App impressions for search terms correlate by country or region and organization against
    /// the total requests for country- or region-search term combinations.
    /// Search terms need to have more than 10 impressions per day for inclusion in a daily Impression Share report.
    public let metrics: [Metric]?
    /// Selector is an optional parameter to filter API results using the `countryOrRegion` and `adamId` fields.
    public let selector: CustomReportSelector?
    /// The report download link.
    ///
    /// The state of the report needs to be `COMPLETED` for a valid URL to return when calling
    /// Get a Single Impression Share Report or Get All Impression Share Reports.
    /// A response of `null` means the report generation is still in progress.
    /// URLs expire 90 seconds after creation.
    /// Reports remain active for 2 days.
    public let downloadUri: URL?

    public init(
        id: Int? = nil,
        name: String? = nil,
        state: State? = nil,
        startTime: Date? = nil,
        endTime: Date? = nil,
        dateRange: CustomReportDateRange? = nil,
        creationTime: Date? = nil,
        modificationTime: Date? = nil,
        granularity: CustomReportGranularity? = nil,
        dimensions: [Dimension]? = nil,
        metrics: [Metric]? = nil,
        selector: CustomReportSelector? = nil,
        downloadUri: URL? = nil
    ) {
        self.id = id
        self.name = name
        self.state = state
        self.startTime = startTime
        self.endTime = endTime
        self.dateRange = dateRange
        self.creationTime = creationTime
        self.modificationTime = modificationTime
        self.granularity = granularity
        self.dimensions = dimensions
        self.metrics = metrics
        self.selector = selector
        self.downloadUri = downloadUri
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case state
        case startTime
        case endTime
        case dateRange
        case creationTime
        case modificationTime
        case granularity
        case dimensions
        case metrics
        case selector
        case downloadUri
        case adamId
        case countryOrRegion
    }

    public init(from decoder: any Decoder) throws {
        let formatter = DateFormatter.yearMonthDay
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        state = try container.decodeIfPresent(CustomReport.State.self, forKey: .state)
        startTime = try container.decodeIfPresent(String.self, forKey: .startTime).flatMap(formatter.date(from:))
        endTime = try container.decodeIfPresent(String.self, forKey: .endTime).flatMap(formatter.date(from:))
        dateRange = try container.decodeIfPresent(CustomReportDateRange.self, forKey: .dateRange)
        creationTime = try container.decodeIfPresent(Date.self, forKey: .creationTime)
        modificationTime = try container.decodeIfPresent(Date.self, forKey: .modificationTime)
        granularity = try container.decodeIfPresent(CustomReportGranularity.self, forKey: .granularity)
        dimensions = try container.decodeIfPresent([CustomReport.Dimension].self, forKey: .dimensions)
        metrics = try container.decodeIfPresent([CustomReport.Metric].self, forKey: .metrics)
        selector = try container.decodeIfPresent(CustomReportSelector.self, forKey: .selector)
        downloadUri = try container.decodeIfPresent(URL.self, forKey: .downloadUri)
    }

    public func encode(to encoder: any Encoder) throws {
        let formatter = DateFormatter.yearMonthDay
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(state, forKey: .state)
        try container.encodeIfPresent(dateRange, forKey: .dateRange)
        try container.encodeIfPresent(creationTime, forKey: .creationTime)
        try container.encodeIfPresent(modificationTime, forKey: .modificationTime)
        try container.encodeIfPresent(granularity, forKey: .granularity)
        try container.encodeIfPresent(dimensions, forKey: .dimensions)
        try container.encodeIfPresent(metrics, forKey: .metrics)
        try container.encodeIfPresent(selector, forKey: .selector)
        try container.encodeIfPresent(downloadUri, forKey: .downloadUri)
        if let startTime { try container.encode(formatter.string(from: startTime), forKey: .startTime) }
        if let endTime { try container.encode(formatter.string(from: endTime), forKey: .endTime) }
    }
}
