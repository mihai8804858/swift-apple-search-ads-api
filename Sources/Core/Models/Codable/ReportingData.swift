/// The total metrics for a report.
public struct ReportingData<
    Insights: Codable & Equatable & Sendable,
    Metadata: Codable & Equatable & Sendable
>: Codable, Equatable, Sendable {
    /// A summary of cumulative report metrics.
    public let grandTotals: GrandTotalsRow
    /// A grouping of metric totals.
    public let row: [Row<Insights, Metadata>]

    public init(grandTotals: GrandTotalsRow, row: [Row<Insights, Metadata>]) {
        self.grandTotals = grandTotals
        self.row = row
    }
}
