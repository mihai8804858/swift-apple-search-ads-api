/// The container object of report metrics.
public struct Reporting: Codable, Equatable, Sendable {
    /// A container for reporting responses.
    public let reportingDataResponse: ReportingData

    public init(reportingDataResponse: ReportingData) {
        self.reportingDataResponse = reportingDataResponse
    }
}
