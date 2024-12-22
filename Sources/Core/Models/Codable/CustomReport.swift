import Foundation

/// A container for Impression Share report metrics.
public struct CustomReport: Codable, Equatable, Sendable {
    /// The state of the report.
    public enum State: String, Codable, Equatable, Sendable {
        case queued = "QUEUED"
        case pending = "PENDING"
        case completed = "COMPLETED"
        case failed = "FAILED"
    }

    /// The report dimension.
    public enum Dimension: String, Codable, Equatable, Sendable {
        case adamId
        case appName
        case countryOrRegion
        case searchTerm
    }

    /// The report metric.
    public enum Metric: String, Codable, Equatable, Sendable {
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
    public let id: Int
    /// A free-text field. The maximum length is 50 characters.
    public let name: String
    /// The state of the report.
    ///
    /// A value of `COMPLETED` has a report link in the `downloadUri` field.
    public let state: State
    /// The start time of the report. The format is YYYY-MM-DD, such as 2024-06-01.
    public let startTime: String
    /// The end time of the report. The format is YYYY-MM-DD, such as 2024-06-30.
    public let endTime: String
    /// The timestamp for the creation of the report.
    public let creationTime: Date
    /// The most recent timestamp of report modifications
    public let modificationTime: Date
    /// The report data organized by day or week.
    public let granularity: CustomReportGranularity
    /// The report dimensions.
    public let dimensions: [Dimension]
    /// Impression Share is a daily aggregation with a range in deciles, such as 11–20% and 21–30%.
    ///
    /// App impressions for search terms correlate by country or region and organization against
    /// the total requests for country- or region-search term combinations.
    /// Search terms need to have more than 10 impressions per day for inclusion in a daily Impression Share report.
    public let metrics: [Metric]
    /// Selector is an optional parameter to filter API results using the `countryOrRegion` and `adamId` fields.
    public let selector: CustomReportSelector
    /// The report download link.
    ///
    /// The state of the report needs to be `COMPLETED` for a valid URL to return when calling
    /// Get a Single Impression Share Report or Get All Impression Share Reports.
    /// A response of `null` means the report generation is still in progress.
    /// URLs expire 90 seconds after creation.
    /// Reports remain active for 2 days.
    public let downloadUri: URL?

    public init(
        id: Int,
        name: String,
        state: State,
        startTime: String,
        endTime: String,
        creationTime: Date,
        modificationTime: Date,
        granularity: CustomReportGranularity,
        dimensions: [Dimension],
        metrics: [Metric],
        selector: CustomReportSelector,
        downloadUri: URL?
    ) {
        self.id = id
        self.name = name
        self.state = state
        self.startTime = startTime
        self.endTime = endTime
        self.creationTime = creationTime
        self.modificationTime = modificationTime
        self.granularity = granularity
        self.dimensions = dimensions
        self.metrics = metrics
        self.selector = selector
        self.downloadUri = downloadUri
    }
}
