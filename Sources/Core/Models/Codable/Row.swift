/// The report metrics by time granularity.
public struct Row<
    Insights: Codable & Equatable & Sendable,
    Metadata: Codable & Equatable & Sendable
>: Codable, Equatable, Sendable {
    /// The bid recommendations according to currency type, including range and amount.
    public let insights: Insights?
    /// Reporting request metadata.
    public let metadata: Metadata?
    /// The impressions that return in reports when there are fewer than 100 demographic dimensions,
    /// and fewer than 10 search terms. If `other` is `true`, the corresponding dimensions are null.
    public let other: Bool?
    /// The tap, conversion, and monetary totals (SpendRow) in the response.
    /// This is the same as `SpendRowExtended` except it doesn’t include the date attribute.
    public let total: SpendRow?
    /// The report data organized by hour, day, week, and month.
    ///
    /// If you specify `granularity` in the payload, `returnRowTotals` and `returnGrandTotals` must be `false`.
    /// See the payload example with `granularity` in Get Campaign-Level Reports.
    ///
    /// - `HOURLY`
    ///
    /// The `startTime` and `endTime` are ≤ 7 days apart, and the `startTime` is ≤ 30 days in the past.
    /// The hour, 00 to 23, appends to the date string as HH.
    /// `HOURLY` isn’t available to use in keyword reports, search term reports, or Creative Set reports.
    ///
    /// - `DAILY`
    ///
    /// The `startTime` and `endTime` are ≤ 90 days apart, and the `startTime` is ≤ 90 days in the past.
    ///
    /// - `WEEKLY`
    ///
    /// The date value is the Monday of the designated week.
    /// The `startTime` and `endTime` are > 14 days and ≤ 365 days apart, the `startTime` is ≤ 24 months in the past.
    ///
    /// - `MONTHLY`
    ///
    /// The date value is the first day of the designated month.
    /// The `startTime` and `endTime` are > 3 months apart, and the `startTime` is ≤ 24 months in the past.
    ///
    public let granularity: [SpendRowExtended]?

    public init(
        insights: Insights? = nil,
        metadata: Metadata? = nil,
        other: Bool? = nil,
        total: SpendRow? = nil,
        granularity: [SpendRowExtended]? = nil
    ) {
        self.insights = insights
        self.metadata = metadata
        self.other = other
        self.total = total
        self.granularity = granularity
    }
}
