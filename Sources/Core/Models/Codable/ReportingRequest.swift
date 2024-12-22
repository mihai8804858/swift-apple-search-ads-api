/// The report request body.
public struct ReportingRequest: Codable, Equatable, Sendable {
    /// The report data organized by hour, day, week, and month.
    public enum Granularity: String, Codable, Equatable, Sendable {
        /// The `startTime` and `endTime` are ≤ 7 days apart, and the `startTime` is ≤ 30 days in the past.
        /// The hour, 00 to 23, appends to the date string as HH.
        /// `HOURLY` isn’t available to use in Get Ad-Level Reports or Get Search Term-Level Reports.
        case hourly = "HOURLY"
        /// The `startTime` and `endTime` are ≤ 90 days apart, and the `startTime` is ≤ 90 days in the past.
        case daily = "DAILY"
        /// The date value is the Monday of the designated week.
        /// The `startTime` and `endTime` are > 14 days and ≤ 365 days apart,
        /// the `startTime` is ≤ 24 months in the past.
        case weekly = "WEEKLY"
        /// The date value is the first day of the designated month.
        /// The `startTime` and `endTime` are > 3 months apart, and the `startTime` is ≤ 24 months in the past.
        case monthly = "MONTHLY"
    }

    /// Use the groupBy field to group responses by selected dimensions.
    public enum GroupBy: String, Codable, Equatable, Sendable {
        /// The `adminArea` dimension is a group of states or the equivalent according to its associated country.
        /// In Get Ad Group-Level Reports, you need to use the `adminArea` dimension with `countryCode`.
        /// The `locality` dimension is optional.
        case adminArea

        /// The `ageRange` dimension is a group of the user demographic age ranges.
        /// In Get Ad Group-Level Reports, the `ageRange` dimension is available to use with `deviceClass`.
        case ageRange

        /// The `countryCode` dimension is a group of country codes that indicate the country or region to serve ads in.
        /// In Get Ad Group-Level Reports, the `countryCode` dimension is available to use with
        /// `deviceClass`, `adminArea`, and `locality`.
        case countryCode

        /// The `countryOrRegion` dimension is a group of countries and regions.
        /// In Get Campaign-Level Reports, Get Ad Group-Level Reports, Get Keyword-Level Reports,
        /// and Get Search Term-Level Reports, the `countryOrRegion` dimension is available to use with `deviceClass`.
        case countryOrRegion

        /// The `deviceClass` dimension is a group of device classes that the promoted app supports.
        /// In Get Ad Group-Level Reports, the `deviceClass` dimension is available to use with any other dimension.
        case deviceClass

        /// The `gender` dimension is a group of user-demographic genders.
        /// In Get Ad Group-Level Reports, the `gender` dimension is available to use with `deviceClass`.
        case gender

        /// The `locality` dimension is the city or group of cities equivalent according to its associated adminArea.
        /// In Get Ad Group-Level Reports, the `locality` dimension with higher dimensions is available to use
        /// with `countryCode` and `adminArea`.
        case locality
    }

    /// The date and time the report coverage starts. The format is YYYY-MM-DD.
    public let startTime: String
    /// The date and time the report coverage ends. The format is YYYY-MM-DD.
    public let endTime: String
    /// You set the default `timeZone` during account creation through the Apple Search Ads UI.
    /// `ORTZ` (organization time zone) is the default.
    /// Possible Values: `ORTZ`, `UTC`
    public let timeZone: String
    /// The report data organized by hour, day, week, and month.
    public let granularity: Granularity?
    /// Use the `groupBy` field to group responses by selected dimensions.
    ///
    /// If `groupBy` specifies age, gender, and geodimensions, `returnRowTotals` and `returnGrandTotals` must be false.
    /// The API groups `ageRange`, `countryCode`, `gender`, `adminArea`, and `locality` records with
    /// fewer than 100 impressions in the API response as other.
    public let groupBy: [GroupBy]
    /// Selector objects define what data the API returns when fetching resources.
    public let selector: Selector?
    /// Returns the total of all the rows in the result set.
    ///
    /// If you don’t specify `granularity`, `returnRowTotals` must be true.
    /// If you specify `granularity` in the payload, `returnGrandTotals` must be false.
    /// The default is `false`.
    public let returnGrandTotals: Bool
    /// Specifies whether the API returns records without metrics.
    ///
    /// The default is `false`.
    public let returnRecordsWithNoMetrics: Bool
    /// Specifies whether to return the totals of each row.
    ///
    /// If you don’t specify `granularity`, `returnRowTotals` must be true.
    /// If you specify `granularity` in the payload, `returnGrandTotals` must be false.
    /// The default is `false`.
    public let returnRowTotals: Bool

    public init(
        startTime: String,
        endTime: String,
        timeZone: String,
        granularity: ReportingRequest.Granularity?,
        groupBy: [ReportingRequest.GroupBy] = [],
        selector: Selector?,
        returnGrandTotals: Bool,
        returnRecordsWithNoMetrics: Bool,
        returnRowTotals: Bool
    ) {
        self.startTime = startTime
        self.endTime = endTime
        self.timeZone = timeZone
        self.granularity = granularity
        self.groupBy = groupBy
        self.selector = selector
        self.returnGrandTotals = returnGrandTotals
        self.returnRecordsWithNoMetrics = returnRecordsWithNoMetrics
        self.returnRowTotals = returnRowTotals
    }
}
