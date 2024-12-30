/// The container object of report metrics.
public struct Reporting<
    Insights: Codable & Equatable & Sendable,
    Metadata: Codable & Equatable & Sendable
>: Codable, Equatable, Sendable {
    /// A container for reporting responses.
    public let reportingDataResponse: ReportingData<Insights, Metadata>?

    public init(reportingDataResponse: ReportingData<Insights, Metadata>? = nil) {
        self.reportingDataResponse = reportingDataResponse
    }
}
