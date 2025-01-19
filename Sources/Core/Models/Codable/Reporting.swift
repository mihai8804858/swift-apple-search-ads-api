/// The container object of report metrics.
public struct Reporting<
    Insights: Codable & Hashable & Sendable,
    Metadata: Codable & Hashable & Sendable
>: Codable, Hashable, Sendable {
    /// A container for reporting responses.
    public let reportingDataResponse: ReportingData<Insights, Metadata>?

    public init(reportingDataResponse: ReportingData<Insights, Metadata>? = nil) {
        self.reportingDataResponse = reportingDataResponse
    }
}
