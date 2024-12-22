/// The total metrics for a report.
public struct ReportingData: Codable, Equatable, Sendable {
    /// A summary of cumulative report metrics.
    public let grandTotals: GrandTotalsRow
    /// A grouping of metric totals.
    public let row: [Row]

    public init(grandTotals: GrandTotalsRow, row: [Row]) {
        self.grandTotals = grandTotals
        self.row = row
    }
}
