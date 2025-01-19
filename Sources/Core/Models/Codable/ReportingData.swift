/// The total metrics for a report.
public struct ReportingData<
    Insights: Codable & Hashable & Sendable,
    Metadata: Codable & Hashable & Sendable
>: Codable, Hashable, Sendable {
    /// A summary of cumulative report metrics.
    public let grandTotals: GrandTotalsRow?
    /// A grouping of metric totals.
    public let row: [Row<Insights, Metadata>]?

    public init(grandTotals: GrandTotalsRow? = nil, row: [Row<Insights, Metadata>]? = nil) {
        self.grandTotals = grandTotals
        self.row = row
    }
}
