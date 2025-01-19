/// The summary of cumulative metrics.
public struct GrandTotalsRow: Codable, Hashable, Sendable {
    /// The impressions that return in reports when there are fewer than 100 demographic dimensions,
    /// and fewer than 10 search terms. If `other` is `true`, the corresponding dimensions are null.
    public let other: Bool?
    /// The tap, conversion, and monetary totals (`SpendRow`) in the response.
    ///
    /// This is the same as `SpendRowExtended` except it doesn’t include the date attribute.
    public let total: SpendRow?

    public init(other: Bool? = nil, total: SpendRow? = nil) {
        self.other = other
        self.total = total
    }
}
